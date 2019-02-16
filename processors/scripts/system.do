onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -expand -group hu /system_tb/DUT/CPU/DP/huif/ifid_instr
add wave -noupdate -expand -group hu /system_tb/DUT/CPU/DP/huif/idex_instr
add wave -noupdate -expand -group hu /system_tb/DUT/CPU/DP/huif/exmem_instr
add wave -noupdate -expand -group hu /system_tb/DUT/CPU/DP/huif/freeze
add wave -noupdate -expand -group hu /system_tb/DUT/CPU/DP/huif/flush
add wave -noupdate -expand -group hu /system_tb/DUT/CPU/DP/huif/RegWEN
add wave -noupdate -expand -group hu /system_tb/DUT/CPU/DP/huif/jsel
add wave -noupdate -expand -group dpif /system_tb/DUT/CPU/DP/dpif/halt
add wave -noupdate -expand -group dpif /system_tb/DUT/CPU/DP/dpif/ihit
add wave -noupdate -expand -group dpif /system_tb/DUT/CPU/DP/dpif/imemREN
add wave -noupdate -expand -group dpif /system_tb/DUT/CPU/DP/dpif/imemload
add wave -noupdate -expand -group dpif /system_tb/DUT/CPU/DP/dpif/imemaddr
add wave -noupdate -expand -group dpif /system_tb/DUT/CPU/DP/dpif/dhit
add wave -noupdate -expand -group dpif /system_tb/DUT/CPU/DP/dpif/dmemREN
add wave -noupdate -expand -group dpif /system_tb/DUT/CPU/DP/dpif/dmemWEN
add wave -noupdate -expand -group dpif /system_tb/DUT/CPU/DP/dpif/flushed
add wave -noupdate -expand -group dpif /system_tb/DUT/CPU/DP/dpif/dmemload
add wave -noupdate -expand -group dpif /system_tb/DUT/CPU/DP/dpif/dmemstore
add wave -noupdate -expand -group dpif /system_tb/DUT/CPU/DP/dpif/dmemaddr
add wave -noupdate -expand -group dp /system_tb/DUT/CPU/DP/CLK
add wave -noupdate -expand -group dp /system_tb/DUT/CPU/DP/nRST
add wave -noupdate -expand -group dp /system_tb/DUT/CPU/DP/branchok
add wave -noupdate -expand -group dp /system_tb/DUT/CPU/DP/jok
add wave -noupdate -expand -group dp /system_tb/DUT/CPU/DP/Imm
add wave -noupdate -expand -group dp /system_tb/DUT/CPU/DP/pc
add wave -noupdate -expand -group dp /system_tb/DUT/CPU/DP/npc
add wave -noupdate -expand -group dp /system_tb/DUT/CPU/DP/newpc
add wave -noupdate -expand -group dp /system_tb/DUT/CPU/DP/branch
add wave -noupdate -expand -group dp /system_tb/DUT/CPU/DP/jump
add wave -noupdate -expand -group dp /system_tb/DUT/CPU/DP/temp
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/aluop
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/negative
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/zero
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/overflow
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/portA
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/portB
add wave -noupdate -group aluif /system_tb/DUT/CPU/DP/aluif/outputPort
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/instruction
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/dWEN
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/dREN
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/RegWEN
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/MemtoReg
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/halt
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/jal
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/bne
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/ALUsrc
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/Regdst
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/jsel
add wave -noupdate -expand -group cuif /system_tb/DUT/CPU/DP/cuif/aluop
add wave -noupdate -expand -group rfif -radix hexadecimal -childformat {{{/system_tb/DUT/CPU/DP/RF/register[31]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[30]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[29]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[28]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[27]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[26]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[25]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[24]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[23]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[22]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[21]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[20]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[19]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[18]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[17]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[16]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[15]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[14]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[13]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[12]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[11]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[10]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[9]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[8]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[7]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[6]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[5]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[4]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[3]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[2]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[1]} -radix hexadecimal} {{/system_tb/DUT/CPU/DP/RF/register[0]} -radix hexadecimal}} -subitemconfig {{/system_tb/DUT/CPU/DP/RF/register[31]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[30]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[29]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[28]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[27]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[26]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[25]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[24]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[23]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[22]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[21]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[20]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[19]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[18]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[17]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[16]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[15]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[14]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[13]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[12]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[11]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[10]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[9]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[8]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[7]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[6]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[5]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[4]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[3]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[2]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[1]} {-height 17 -radix hexadecimal} {/system_tb/DUT/CPU/DP/RF/register[0]} {-height 17 -radix hexadecimal}} /system_tb/DUT/CPU/DP/RF/register
add wave -noupdate -expand -group rfif /system_tb/DUT/CPU/DP/rfif/WEN
add wave -noupdate -expand -group rfif /system_tb/DUT/CPU/DP/rfif/wsel
add wave -noupdate -expand -group rfif /system_tb/DUT/CPU/DP/rfif/rsel1
add wave -noupdate -expand -group rfif /system_tb/DUT/CPU/DP/rfif/rsel2
add wave -noupdate -expand -group rfif -radix hexadecimal /system_tb/DUT/CPU/DP/rfif/wdat
add wave -noupdate -expand -group rfif -radix hexadecimal /system_tb/DUT/CPU/DP/rfif/rdat1
add wave -noupdate -expand -group rfif -radix hexadecimal /system_tb/DUT/CPU/DP/rfif/rdat2
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/ifid/instructionin
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/ifid/instructionout
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/ifid/npcin
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/ifid/npcout
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/ifid/ihit
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/instructionin
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/instructionout
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/ihit
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/rdat1_in
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/rdat2_in
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/npcin
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/newpcin
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/dWEN_in
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/dREN_in
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/RegWEN_in
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/MemtoReg_in
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/halt_in
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/jal_in
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/bne_in
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/imemren_in
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/ALUsrc_in
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/Regdst_in
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/jsel_in
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/aluop_in
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/rdat1_out
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/rdat2_out
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/npcout
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/newpcout
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/dWEN_out
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/dREN_out
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/RegWEN_out
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/MemtoReg_out
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/halt_out
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/jal_out
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/bne_out
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/imemren_out
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/ALUsrc_out
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/Regdst_out
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/jsel_out
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/aluop_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/instructionin
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/instructionout
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/dmemload_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/dmemload_in
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/ihit
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/npcin
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/RegWEN_in
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/MemtoReg_in
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/Regdst_in
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/jsel_in
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/aluop_in
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/npcout
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/RegWEN_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/MemtoReg_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/Regdst_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/jsel_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/outputPort_in
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/outputPort_out
add wave -noupdate -group cif /system_tb/DUT/CPU/CM/cif/iwait
add wave -noupdate -group cif /system_tb/DUT/CPU/CM/cif/dwait
add wave -noupdate -group cif /system_tb/DUT/CPU/CM/cif/iREN
add wave -noupdate -group cif /system_tb/DUT/CPU/CM/cif/dREN
add wave -noupdate -group cif /system_tb/DUT/CPU/CM/cif/dWEN
add wave -noupdate -group cif /system_tb/DUT/CPU/CM/cif/iload
add wave -noupdate -group cif /system_tb/DUT/CPU/CM/cif/dload
add wave -noupdate -group cif /system_tb/DUT/CPU/CM/cif/dstore
add wave -noupdate -group cif /system_tb/DUT/CPU/CM/cif/iaddr
add wave -noupdate -group cif /system_tb/DUT/CPU/CM/cif/daddr
add wave -noupdate -group cif /system_tb/DUT/CPU/CM/cif/ccwait
add wave -noupdate -group cif /system_tb/DUT/CPU/CM/cif/ccinv
add wave -noupdate -group cif /system_tb/DUT/CPU/CM/cif/ccwrite
add wave -noupdate -group cif /system_tb/DUT/CPU/CM/cif/cctrans
add wave -noupdate -group cif /system_tb/DUT/CPU/CM/cif/ccsnoopaddr
add wave -noupdate -group ram /system_tb/DUT/RAM/ramif/ramREN
add wave -noupdate -group ram /system_tb/DUT/RAM/ramif/ramWEN
add wave -noupdate -group ram /system_tb/DUT/RAM/ramif/ramaddr
add wave -noupdate -group ram /system_tb/DUT/RAM/ramif/ramstore
add wave -noupdate -group ram /system_tb/DUT/RAM/ramif/ramload
add wave -noupdate -group ram /system_tb/DUT/RAM/ramif/ramstate
add wave -noupdate -group ram /system_tb/DUT/RAM/ramif/memREN
add wave -noupdate -group ram /system_tb/DUT/RAM/ramif/memWEN
add wave -noupdate -group ram /system_tb/DUT/RAM/ramif/memaddr
add wave -noupdate -group ram /system_tb/DUT/RAM/ramif/memstore
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/instructionin
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/instructionout
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/dmemload_in
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/dmemload_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/ihit
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/dhit
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/rdat1_in
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/rdat2_in
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/npcin
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/newpcin
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/dWEN_in
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/dREN_in
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/RegWEN_in
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/MemtoReg_in
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/jal_in
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/bne_in
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/Regdst_in
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/jsel_in
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/aluop_in
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/rdat1_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/rdat2_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/npcout
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/newpcout
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/dWEN_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/dREN_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/RegWEN_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/MemtoReg_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/jal_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/bne_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/Regdst_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/jsel_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/aluop_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/outputPort_in
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/outputPort_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/zero_in
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/zero_out
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/iwait
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/dwait
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/iREN
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/dREN
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/dWEN
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/iload
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/dload
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/dstore
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/iaddr
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/daddr
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/ccwait
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/ccinv
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/ccwrite
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/cctrans
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/ccsnoopaddr
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/ramWEN
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/ramREN
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/ramstate
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/ramaddr
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/ramstore
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/ramload
add wave -noupdate -expand -group fuif /system_tb/DUT/CPU/DP/fuif/rs
add wave -noupdate -expand -group fuif /system_tb/DUT/CPU/DP/fuif/rt
add wave -noupdate -expand -group fuif /system_tb/DUT/CPU/DP/fuif/rdm
add wave -noupdate -expand -group fuif /system_tb/DUT/CPU/DP/fuif/rdw
add wave -noupdate -expand -group fuif /system_tb/DUT/CPU/DP/fuif/exmemRW
add wave -noupdate -expand -group fuif /system_tb/DUT/CPU/DP/fuif/memwbRW
add wave -noupdate -expand -group fuif /system_tb/DUT/CPU/DP/fuif/port1
add wave -noupdate -expand -group fuif /system_tb/DUT/CPU/DP/fuif/port3
add wave -noupdate -expand -group fuif /system_tb/DUT/CPU/DP/fuif/port2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {857949 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {532 ns} {1092 ns}
