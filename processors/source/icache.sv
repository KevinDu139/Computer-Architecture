/*
  Eric Villasenor
  evillase@gmail.com

  datapath contains register file, control, hazard,
  muxes, and glue logic for processor
*/

// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"

module icache (
  input logic CLK, nRST,
  datapath_cache_if dcif,
  caches_if.icache icif
);
  // import types
  import cpu_types_pkg::*;
  
  icache_frame [15:0] iframe;
  logic [25:0] tag;
  logic [3:0] index;
  logic miss;
  
  assign tag = dcif.imemaddr[31:6];
  assign index = dcif.imemaddr[5:2];
  
  always_ff @(posedge CLK or negedge nRST)
  begin 
      if(~nRST)
      begin
          iframe <= '0;   
      end
      else if(~icif.iwait && miss)
      begin
          iframe[index].tag <= dcif.imemaddr[31:6];  
          iframe[index].valid <= 1;  
          iframe[index].data <= icif.iload;  
      end
  end
  
  always_comb
  begin
      icif.iREN = 0;
      icif.iaddr = 0;
      dcif.ihit = 0;
      dcif.imemload = 0;
      miss = 0;
      if(dcif.imemREN && !dcif.dmemWEN && !dcif.dmemREN)
      begin
          if(iframe[index].valid && tag == iframe[index].tag)
          begin
              dcif.imemload = iframe[index].data;
              dcif.ihit = 1;
          end
          else
          begin
              miss = 1;
              dcif.imemload = icif.iload;
              icif.iREN = dcif.imemREN;
              icif.iaddr = dcif.imemaddr;
              dcif.ihit = ~icif.iwait;
          end  
      end
  end
  

endmodule

