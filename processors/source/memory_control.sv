/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/

// interface include
`include "cache_control_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module memory_control (
  input CLK, nRST,
  cache_control_if.cc ccif
);
  // type import
  import cpu_types_pkg::*;

  // number of cpus for cc
  parameter CPUS = 2;
/*
  assign ccif.dload = (ccif.ramstate == ACCESS)? ccif.ramload : '0;
  assign ccif.iload = ccif.iREN ? ccif.ramload : '0;
  assign ccif.dwait = (ccif.dREN || ccif.dWEN) && ~(ccif.ramstate == ACCESS);
  assign ccif.iwait = ccif.iREN && (ccif.dREN || ccif.dWEN || (~ccif.ramstate == ACCESS)); 
  assign ccif.ramWEN = ccif.dWEN;
  assign ccif.ramREN = ((ccif.iREN || ccif.dREN) && !(ccif.dWEN)) ? 1 : 0;
  assign ccif.ramaddr = (ccif.dREN || ccif.dWEN) ? ccif.daddr : ccif.iaddr;
  assign ccif.ramstore = ccif.dstore;
*/


  typedef enum logic[3:0] {IDLE, ARBIT, LOAD0, LOAD1, CACHE0, CACHE1, WRITE0, WRITE1, ICACHE, SNOOP} stateT;
  stateT state, nstate;
  
  logic snoop, snooped, nsnoop, nsnooped;
  logic lastcore, nlastcore;
  //word_t  [CPUS-1:0]      snoopaddr;
  //logic   [CPUS-1:0]      wait, inv;
  //logic   [CPUS-1:0]      write, trans;

  always_ff @(posedge CLK or negedge nRST)
  begin 
      if(~nRST)
      begin
          snoop <= 0;
          snooped <= 1;
          state <= IDLE;
          lastcore <= 0;
          //ccif.ccwrite <= '0;
          //ccif.ccwait <= '0;
          //ccif.ccsnoopaddr <= '0;
      end
      else
      begin
          state <= nstate;
          snoop <= nsnoop;
          snooped <= nsnooped;
          lastcore <= nlastcore;
      end
  end
   
  always_comb
  begin
      nstate = state;
      nsnoop = snoop;
      nsnooped = snooped;
      case(state)
          IDLE:
          begin
              if(ccif.dWEN[0] || ccif.dWEN[1])
              begin
                  nstate = WRITE0;
              end
              else if(ccif.cctrans[0] || ccif.cctrans[1])
              begin
                  nstate = ARBIT;
              end
              else if(ccif.iREN[0] || ccif.iREN[1])
              begin
                  nstate = ICACHE;
              end
          end
          ARBIT:
          begin
              //if(ccif.cctrans[0] || ccif.cctrans[1])
              //begin
                  if(ccif.dREN[0])
                  begin
                      nstate = SNOOP;
                      nsnoop = 0;
                      nsnooped = 1;
                  end
                  else if(ccif.dREN[1])
                  begin
                      nstate = SNOOP;
                      nsnoop = 1;
                      nsnooped = 0;
                  end
                  else
                  begin
                      nstate = IDLE;
                  end
              //end
          end
          SNOOP:
          begin
              //if(ccif.dREN[0] || ccif.dREN[1])
              //begin
                  if(ccif.cctrans[snooped])
                  begin
                      nstate = CACHE0;
                  end
                  else
                  begin
                      nstate = LOAD0;
                  end
              /*end
              else
              begin
                  nstate = IDLE;
              end*/
          end
          CACHE0:
          begin
              if(ccif.ramstate == ACCESS)
              begin
                  nstate = CACHE1;
              end
          end
          CACHE1:
          begin
              if(ccif.ramstate == ACCESS)
              begin
                  nstate = IDLE;
              end
          end
          LOAD0:
          begin
              if(ccif.ramstate == ACCESS)
              begin
                  nstate = LOAD1;
              end
          end
          LOAD1:
          begin
              if(ccif.ramstate == ACCESS)
              begin
                  nstate = IDLE;
              end
          end
          WRITE0:
          begin
              if(ccif.ramstate == ACCESS)
              begin
                  nstate = WRITE1;
              end
          end
          WRITE1:
          begin
              if(ccif.ramstate == ACCESS)
              begin
                  nstate = IDLE;
              end
          end
          ICACHE:
          begin
              if(ccif.ramstate == ACCESS)
              begin
                  if(ccif.cctrans != 0)
                  begin
                      nstate = ARBIT;
                  end
                  else
                  begin
                      nstate = IDLE;
                  end
              end
              if(ccif.dWEN[0] || ccif.dWEN[1])
              begin
                  nstate = WRITE0;
              end
          end
      endcase  
  end
  
  
  always_comb
  begin      
      ccif.ramaddr = 0;
      ccif.ramstore = 0;
      ccif.ramREN = 0;
      ccif.ramWEN = 0;
      
      ccif.iwait[0] = 1;
      ccif.iload[0] = 0;
      ccif.dwait[0] = 1;
      ccif.dload[0] = 0;
      ccif.iwait[1] = 1;
      ccif.iload[1] = 0;
      ccif.dwait[1] = 1;
      ccif.dload[1] = 0;
      
      ccif.ccwait[0] = 0;
      ccif.ccwait[1] = 0;
      ccif.ccinv[0] = ccif.ccwrite[1];
      ccif.ccinv[1] = ccif.ccwrite[0];
      ccif.ccsnoopaddr[0] = '0;
      ccif.ccsnoopaddr[1] = '0;
      nlastcore = lastcore;
      
      case(state)
          ARBIT:
          begin
              ccif.ccwait[nsnooped] = 1;
              ccif.ccsnoopaddr[nsnooped] = ccif.daddr[snoop];
          end
          SNOOP:
          begin
              ccif.ccwait[snooped] = 1;
              ccif.ccsnoopaddr[snooped] = ccif.daddr[snoop];
          end
          CACHE0:
          begin
              ccif.ramWEN = 1;
              ccif.ramaddr = ccif.daddr[snooped];
              ccif.ramstore = ccif.dstore[snooped];
              ccif.dwait[snoop] = ccif.ramstate != ACCESS;
              ccif.dwait[snooped] = ccif.ramstate != ACCESS;
              ccif.dload[snoop] = ccif.dstore[snooped];
              ccif.ccsnoopaddr[snooped] = ccif.daddr[snoop];
              ccif.ccwait[snooped] = 1;
          end
          CACHE1:
          begin
              ccif.ramWEN = 1;
              ccif.ramaddr = ccif.daddr[snooped];
              ccif.ramstore = ccif.dstore[snooped];
              ccif.dwait[snoop] = ccif.ramstate != ACCESS;
              ccif.dwait[snooped] = ccif.ramstate != ACCESS;
              ccif.dload[snoop] = ccif.dstore[snooped];
              ccif.ccsnoopaddr[snooped] = ccif.daddr[snoop];
              ccif.ccwait[snooped] = 1;
          end
          LOAD0:
          begin
              ccif.dwait[snoop] = ccif.ramstate != ACCESS;
              ccif.dload[snoop] = ccif.ramload;
              ccif.ramREN = ccif.dREN[snoop];
              ccif.ramaddr = ccif.daddr[snoop];
              ccif.ccwait[snooped] = 1;
          end
          LOAD1:
          begin
              ccif.dwait[snoop] = ccif.ramstate != ACCESS;
              ccif.dload[snoop] = ccif.ramload;
              ccif.ramREN = ccif.dREN[snoop];
              ccif.ramaddr = ccif.daddr[snoop];
              ccif.ccwait[snooped] = 1;
          end
          WRITE0:
          begin
              if(ccif.dWEN[0])
              begin
                  ccif.dwait[0] = ccif.ramstate != ACCESS;
                  ccif.ramstore = ccif.dstore[0];
                  ccif.ramWEN = ccif.dWEN[0];
                  ccif.ramaddr = ccif.daddr[0];
                  ccif.ccwait[0] = 1;
              end
              else if(ccif.dWEN[1])
              begin
                  ccif.dwait[1] = ccif.ramstate != ACCESS;
                  ccif.ramstore = ccif.dstore[1];
                  ccif.ramWEN = ccif.dWEN[1];
                  ccif.ramaddr = ccif.daddr[1];
                  ccif.ccwait[1] = 0;
              end
          end
          WRITE1:
          begin
              if(ccif.dWEN[0])
              begin
                  ccif.dwait[0] = ccif.ramstate != ACCESS;
                  ccif.ramstore = ccif.dstore[0];
                  ccif.ramWEN = ccif.dWEN[0];
                  ccif.ramaddr = ccif.daddr[0];
                  ccif.ccwait[0] = 1;
              end
              else if(ccif.dWEN[1])
              begin
                  ccif.dwait[1] = ccif.ramstate != ACCESS;
                  ccif.ramstore = ccif.dstore[1];
                  ccif.ramWEN = ccif.dWEN[1];
                  ccif.ramaddr = ccif.daddr[1];
                  ccif.ccwait[1] = 0;
              end
          end
          ICACHE:
          begin
              if(ccif.iREN[0])// && !lastcore)
              begin
                  ccif.iwait[0] = ccif.ramstate != ACCESS;
                  ccif.iload[0] = ccif.ramload;
                  ccif.ramREN = ccif.iREN[0];
                  ccif.ramaddr = ccif.iaddr[0];
                  nlastcore = 1;
              end
              else if(ccif.iREN[1])
              begin
                  ccif.iwait[1] = ccif.ramstate != ACCESS;
                  ccif.iload[1] = ccif.ramload;
                  ccif.ramREN = ccif.iREN[1];
                  ccif.ramaddr = ccif.iaddr[1];
                  nlastcore = 1;
              end
          end
      endcase  
  end
  
  
endmodule
