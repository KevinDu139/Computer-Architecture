/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/

// interface include
`include "hazard_unit_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module hazard_unit (
  hazard_unit_if.hu huif
);
  // type import
  import cpu_types_pkg::*;
  //r_t rtype_ifid, rtype_exmem, rtype_idex;
  /*rtype_ifid = r_t'(huif.ifid_instr);
  rtype_ifid = r_s'(huif.ifid_instr);
  rtype_idex = r_t'(huif.idex_instr);
  rtype_idex = r_s'(huif.idex_instr);
  rtype_exmem = r_t'(huif.exmem_instr);
  rtype_exmem = r_s'(huif.exmem_instr);*/
  
  always_comb
  begin
	huif.freeze = 0;
	huif.flush = 0;
	//if(huif.idex_instr != huif.ifid_instr && huif.idex_instr != huif.exmem_instr && huif.ifid_instr != huif.exmem_instr && huif.exmem_instr != 0 && huif.idex_instr != 0 && huif.ifid_instr !=0)
	//if(huif.idex_instr != huif.ifid_instr && huif.idex_instr != huif.exmem_instr && huif.ifid_instr != huif.exmem_instr)
	//if(huif.exmem_instr != 0 || huif.idex_instr != 0 || huif.ifid_instr !=0)
	//if(huif.start && (huif.exmem_instr != 0 || huif.idex_instr != 0))
	//if((huif.idex_instr[31:26] == LW || huif.idex_instr[31:26] == SW) && ~huif.dhit)
	if(huif.idex_instr[31:26] == LW )//|| huif.idex_instr[31:26] == SW)
	//if(huif.RegWEN)
	begin
		if((huif.idex_instr[20:16] == huif.ifid_instr[25:21] || huif.idex_instr[20:16] == huif.ifid_instr[20:16]))
		begin
 			huif.freeze = 1;
		end
		/*else if((huif.exmem_instr[20:16] == huif.ifid_instr[25:21] || huif.exmem_instr[20:16] == huif.ifid_instr[20:16]))
		begin
 			huif.freeze = 1;
		end
		else if(huif.idex_instr[31:26] != RTYPE && (huif.idex_instr[15:11] == huif.ifid_instr[25:21] || huif.idex_instr[15:11] == huif.ifid_instr[20:16] || huif.exmem_instr[15:11] == huif.ifid_instr[25:21] || huif.exmem_instr[15:11] == huif.ifid_instr[20:16]))
		begin
			huif.freeze = 1;
		end*/
	end
	//flush
	//if(huif.jsel <= 4 && huif.jsel != 0)
	if(huif.branchok || huif.jok || (huif.jsel <=3 && huif.jsel !=0))// && huif.jsel != 0 )
	begin
		huif.flush = 1;
		huif.freeze = 0;
	end
  end

endmodule
