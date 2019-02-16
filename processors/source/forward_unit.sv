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
	
	if(fuif.exmemRW && fuif.rdm !=0 && fuif.rdm == fuif.rs && fuif.exmem_instr[31:26] == LUI) // exmem aluout
	begin
		fuif.port1 = 3;
	end
	else if(fuif.exmemRW && fuif.rdm !=0 && fuif.rdm == fuif.rs && fuif.exmem_instr[31:26] == SC) // exmem aluout
	begin
		fuif.port1 = 4;
	end
	else if(fuif.exmemRW && fuif.rdm !=0 && fuif.rdm == fuif.rs) // exmem aluout
	begin
		fuif.port1 = 1;
	end
	else if(fuif.memwbRW && fuif.rdw !=0 && fuif.rdw == fuif.rs) // memwb wdat
	begin
		fuif.port1 = 2;
	end

  if(fuif.exmemRW && fuif.rdm !=0 && fuif.rdm == fuif.rt && (fuif.idex_instr[31:26] == SW || fuif.idex_instr[31:26] == SC) && fuif.exmem_instr[31:26] == SC || fuif.memwb_instr[31:26] == SC)
  begin
    fuif.port2 = 5;
  end
	else if(fuif.exmemRW && fuif.rdm !=0 && fuif.rdm == fuif.rt && (fuif.idex_instr[31:26] == SW || fuif.idex_instr[31:26] == SC)) // exmem aluout
	begin
		fuif.port2 = 3;
		
	end
	else if(fuif.memwbRW && fuif.rdw !=0 && fuif.rdw == fuif.rt && (fuif.idex_instr[31:26] == SW || fuif.idex_instr[31:26] == SC) && (fuif.memwb_instr[31:26] == LW || fuif.memwb_instr[31:26] == LL)) // exmem aluout
	begin
		fuif.port2 = 5;
		
	end
	else if(fuif.memwbRW && fuif.rdw !=0 && fuif.rdw == fuif.rt && (fuif.idex_instr[31:26] == SW || fuif.idex_instr[31:26] == SC)) // exmem aluout
	begin
		fuif.port2 = 4;
		
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
