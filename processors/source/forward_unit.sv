/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/

// interface include
`include "forward_unit_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module forward_unit (
  forward_unit_if.fu fuif
);
  // type import
  import cpu_types_pkg::*;


  always_comb
  begin
	fuif.port1 = 0;
	fuif.port2 = 0;
	fuif.port3 = 0;
	if(fuif.idex_instr[31:26] == BNE || fuif.idex_instr[31:26] == BEQ)
	begin
	    if(fuif.rdm == fuif.rs)
	    begin
	        fuif.port3 = 1;
	    end
	    else if(fuif.rdm == fuif.rt)
	    begin
	        fuif.port3 = 2;
	    end
	end
	
	if(fuif.exmemRW && fuif.rdm !=0 && fuif.rdm == fuif.rs && fuif.exmem_instr[31:26] == LUI) // exmem aluout
	begin
		fuif.port1 = 3;
		
	end
	else if(fuif.exmemRW && fuif.rdm !=0 && fuif.rdm == fuif.rs) // exmem aluout
	begin
		fuif.port1 = 1;
		
	end
	else if(fuif.memwbRW && fuif.rdw !=0 && fuif.rdw == fuif.rs) // memwb wdat
	begin
		fuif.port1 = 2;
	end

	if(fuif.exmemRW && fuif.rdm !=0 && fuif.rdm == fuif.rt && fuif.idex_instr[31:26] == SW) // exmem aluout
	begin
		fuif.port2 = 3;
		
	end
	else if(fuif.exmemRW && fuif.rdm !=0 && fuif.rdm == fuif.rt ) // exmem aluout
	begin
		fuif.port2 = 1;

	end
	else if(fuif.memwbRW && fuif.rdw !=0 && fuif.rdw == fuif.rt) // memwb wdat
	begin
		fuif.port2 = 2;
	end
	
	
	
  end
endmodule
