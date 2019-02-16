/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/

// interface include
`include "request_unit_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module request_unit (
  input logic CLK, nRST,
  request_unit_if.ru ruif
);
  // import types
  import cpu_types_pkg::*;

  assign ruif.imemREN = 1;
  always_ff @(posedge CLK, negedge nRST)
  begin
    if (!nRST)
    begin
      ruif.dmemREN <= 0;
      ruif.dmemWEN <= 0;
    end
    else if (ruif.ihit)
    begin
      ruif.dmemREN <= ruif.dREN;
      ruif.dmemWEN <= ruif.dWEN;
    end
    else if (ruif.dhit)
    begin
      ruif.dmemREN <= 0;
      ruif.dmemWEN <= 0;
    end
  end
endmodule
