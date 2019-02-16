/*
  Eric Villasenor
  evillase@gmail.com

  datapath contains register file, control, hazard,
  muxes, and glue logic for processor
*/

// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"

module dcache (
  input logic CLK, nRST,
  datapath_cache_if.dcache dcif,
  caches_if.dcache cif
);
  // import types
  import cpu_types_pkg::*;

  dcache_frame [7:0] df0;
  dcache_frame [7:0] df1;
  logic [2:0] index;
  logic block;
  logic miss;
  logic [25:0] tag;
  
  assign block = dcif.dmemaddr[2];
  assign index = dcif.dmemaddr[5:3];
  assign tag = dcif.dmemaddr[31:6];
  
  typedef enum logic[3:0] {IDLE, WRITE0, WRITE1, FETCH0, FETCH1, DIRTY, FLUSH0, FLUSH1, HCOUNT} stateT;
  stateT state, next;
  //logic available[7:0], next_available[7:0];
  //integer i;
  word_t hc, nhc;
  logic [3:0] row, nextrow;
  logic [2:0] currrow;
  logic [1:0] last, nlast;
  logic cur, ncur, rdy0, rdy1;
  word_t data0, data1;
  logic ndirty, nvalid;
  
  
  always_ff @(posedge CLK or negedge nRST)
  begin 
      if(~nRST)
      begin
          df0 <= '0;
          df1 <= '0;
          //cur <= '0;
          state <= IDLE;
          hc <= 0;
          row <= 0;
          cur <= 0;
          last <= 0;
      end
      else
      begin
          //if(cur[index] == 0 && (rdy0 || rdy1))
          if(nlast == 1 && (rdy0 || rdy1))
          begin
              df0[index].tag <= tag;
              if(rdy0)
              begin
                  df0[index].data[0] <= data0;
                  df0[index].valid <= nvalid;
                  df0[index].dirty <= ndirty;
              end
              if(rdy1)
              begin
                  df0[index].data[1] <= data1;
                  df0[index].valid <= nvalid;
                  df0[index].dirty <= ndirty;
              end
          end
          //else if(cur[index] == 1 && (rdy0 || rdy1))
          else if(nlast == 2 && (rdy0 || rdy1))
          begin
              df1[index].tag <= tag;
              if(rdy0)
              begin
                  df1[index].data[0] <= data0;
                  df1[index].valid <= nvalid;
                  df1[index].dirty <= ndirty;
              end
              if(rdy1)
              begin
                  df1[index].data[1] <= data1;
                  df1[index].valid <= nvalid;
                  df1[index].dirty <= ndirty;
              end
          end
          else if(cur == 0 && (rdy0 || rdy1))
          begin
              df0[index].tag <= tag;
              if(rdy0)
              begin
                  df0[index].data[0] <= data0;
                  df0[index].valid <= nvalid;
                  df0[index].dirty <= ndirty;
              end
              if(rdy1)
              begin
                  df0[index].data[1] <= data1;
                  df0[index].valid <= nvalid;
                  df0[index].dirty <= ndirty;
              end
          end
          //else if(cur[index] == 1 && (rdy0 || rdy1))
          else if(cur == 1 && (rdy0 || rdy1))
          begin
              df1[index].tag <= tag;
              if(rdy0)
              begin
                  df1[index].data[0] <= data0;
                  df1[index].valid <= nvalid;
                  df1[index].dirty <= ndirty;
              end
              if(rdy1)
              begin
                  df1[index].data[1] <= data1;
                  df1[index].valid <= nvalid;
                  df1[index].dirty <= ndirty;
              end
          end
          state <= next;
          hc <= nhc;
          row <= nextrow;
          cur <= ncur;
	        //for (i = 0; i < 8; i++)
	       	//  available[i] <= next_available[i];
      end
  end
  
  
  always_comb
  begin
      currrow = nextrow;
      next = state;
      nextrow = row;
      case(state)
          IDLE:
          begin
              if(dcif.halt)
              begin
                  next = DIRTY;
              end
              else if(miss)
              begin
                  //if(cur[index] == 0) begin
                  if(df0[index].dirty && cur == 0)
                  begin
                      next = WRITE0;
                  end
                  else if (df1[index].dirty && cur == 1)
                  begin
                      next = WRITE0;
                  end
                  else
                  begin
                      next = FETCH0;
                  end
                  //end
              end
          end
          WRITE0:
          begin
              if(~cif.dwait)
              begin
                  next = WRITE1;
              end
          end
          WRITE1:
          begin
              if(~cif.dwait)
              begin
                  next = FETCH0;
              end
          end
          FETCH0:
          begin
              if(~cif.dwait)
              begin
                  next = FETCH1;
              end
          end
          FETCH1:
          begin
              if(~cif.dwait)
              begin
                  next = IDLE;
              end
          end
          DIRTY:
          begin
              if(row < 8)
              begin
                  currrow = nextrow;
                  if(df0[currrow].dirty)
                  begin
                      next = FLUSH0;
                  end
                  if(df1[currrow].dirty)
                  begin
                      next = FLUSH0;
                  end
              end
              nextrow = row + 1;
              if(row == 9)
              begin
                  next = HCOUNT;
              end
          end
          FLUSH0:
          begin
              next = FLUSH1;
          end
          FLUSH1:
          begin
              next = DIRTY;
          end
          HCOUNT:
          begin
          
          end
      endcase
  end
  
  always_comb
  begin
      dcif.dhit = 0;
      dcif.dmemload = '0;
      data0 = 0;
      data1 = 0;
      cif.dREN = 0;
      cif.dWEN = 0;
      cif.daddr = 0;
      cif.dstore = 0;
      ndirty = 0;
      nvalid = 0;
      
      ncur = cur;
      nlast = 0;
      miss = 0;
      nhc = hc;
      rdy0 = 0;
      rdy1 = 0;
	    //for(j = 0; j < 8; j++) next_cur[j] = cur[j];
        case(state)
          IDLE:
          begin
              if(dcif.halt)
              begin
                  //do nothing
              end
              else if(dcif.dmemREN)
              begin
                  if(df0[index].tag == tag && df0[index].valid)
                  begin
                      dcif.dmemload = df0[index].data[block];
                      dcif.dhit = 1;
                      nhc = hc + 1;
                      ncur = 1;
					            //next_cur[index] = 1;
                  end
                  else if (df1[index].tag == tag && df1[index].valid)
                  begin
                      dcif.dmemload = df1[index].data[block];
                      dcif.dhit = 1;
                      nhc = hc + 1;
                      ncur = 0;
					            //next_cur[index] = 0;
                  end
                  else 
                  begin
                      miss = 1;
                      nhc = hc - 1;
                  end
              end
              if(dcif.dmemWEN)
              begin
                  if(df0[index].tag == tag)
                  begin
                      dcif.dhit = 1;
                      ndirty = 1;
                      nvalid = 1;
                      nhc = hc + 1;
                      nlast = 1;
                      ncur = 1;
					            //next_cur[index] = 1;
                      if(block == 0)
                      begin
                          rdy0 = 1;
                          data0 = dcif.dmemstore;
                      end
                      else
                      begin
                          rdy1 = 1;
                          data1 = dcif.dmemstore;
                      end
                  end
                  else if(df1[index].tag == tag)
                  begin
                      dcif.dhit = 1;
                      ndirty = 1;
                      nvalid = 1;
                      nhc = hc + 1;
                      nlast = 2;
                      ncur = 0;
					            //next_cur[index] = 0;
                      if(block == 0)
                      begin
                          rdy0 = 1;
                          data0 = dcif.dmemstore;
                      end
                      else
                      begin
                          rdy1 = 1;
                          data1 = dcif.dmemstore;
                      end
                  end
                  else 
                  begin
                      miss = 1;
                      nhc = hc - 1;
                  end
              end
          end
          WRITE0:
          begin
              cif.dWEN = 1;
              //if(next_cur[index] == 0)
              if(cur == 0)
              begin
                  cif.dstore = df0[index].data[0];
                  cif.daddr = {tag, index, 3'b000};
              end
              else
              begin
                  cif.dstore = df1[index].data[0];
                  cif.daddr = {tag, index, 3'b000};
              end
          end
          WRITE1:
          begin
              cif.dWEN = 1;
              //if(next_cur[index] == 0)
              if(cur == 0)
              begin
                  cif.dstore = df0[index].data[1];
                  cif.daddr = {tag, index, 3'b100};
              end
              else
              begin
                  cif.dstore = df1[index].data[1];
                  cif.daddr = {tag, index, 3'b100};
              end
          end
          FETCH0:
          begin
              rdy0 = 1;
              cif.dREN = 1;
              data0 = cif.dload;
              nvalid = 1;
              cif.daddr = {tag, index, 3'b000};
          end
          FETCH1:
          begin
              rdy1 = 1;
              cif.dREN = 1;
              data1 = cif.dload;
              nvalid = 1;
              cif.daddr = {tag, index, 3'b100};
          end
          DIRTY:
          begin
          
          end
          FLUSH0:
          begin
              cif.dWEN = 1;
              if(currrow < 8)
              begin
                  cif.dstore = df0[currrow].data[0];
                  cif.daddr = {df0[currrow].tag, currrow, 3'b000};
              end
              else
              begin
                  cif.dstore = df1[currrow].data[0];
                  cif.daddr = {df0[currrow].tag, currrow, 3'b000};
              end
          end
          FLUSH1:
          begin
              cif.dWEN = 1;
              if(currrow < 8)
              begin
                  cif.dstore = df0[currrow].data[1];
                  cif.daddr = {df0[currrow].tag, currrow, 3'b100};
              end
              else
              begin
                  cif.dstore = df1[currrow].data[1];
                  cif.daddr = {df0[currrow].tag, currrow, 3'b100};
              end
          end
          HCOUNT:
          begin
              cif.dWEN = 1;
              cif.dstore = hc;
              cif.daddr = 32'h00003100;
          end
      endcase
  end

endmodule

