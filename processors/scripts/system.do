onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/CLK
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/nRST
add wave -noupdate -expand -group d0 -expand /system_tb/DUT/CPU/CM0/DCACHE/df0
add wave -noupdate -expand -group d0 -expand /system_tb/DUT/CPU/CM0/DCACHE/df1
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/index
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/snoopindex
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/block
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/miss
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/tag
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/snooptag
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/state
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/next
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/available
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/next_available
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/i
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/hc
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/nhc
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/row
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/nextrow
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/currrow
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/last
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/nlast
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/cur
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/ncur
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/rdy0
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/rdy1
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/data0
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/data1
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/ndirty
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/nvalid
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/snoopdirty
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/snoophit0
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/snoophit1
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/nsnoophit0
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/nsnoophit1
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/snoopinvalid
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/isflush
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/link
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/nextlink
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/linkvalid
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/nlinkvalid
add wave -noupdate -expand -group d0 /system_tb/DUT/CPU/CM0/DCACHE/j
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/CLK
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/nRST
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/df0
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/df1
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/index
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/snoopindex
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/block
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/miss
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/tag
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/snooptag
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/state
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/next
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/available
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/next_available
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/i
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/hc
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/nhc
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/row
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/nextrow
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/currrow
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/last
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/nlast
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/cur
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/ncur
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/rdy0
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/rdy1
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/data0
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/data1
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/ndirty
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/nvalid
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/snoopdirty
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/snoophit0
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/snoophit1
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/nsnoophit0
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/nsnoophit1
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/snoopinvalid
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/isflush
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/link
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/nextlink
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/linkvalid
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/nlinkvalid
add wave -noupdate -group d1 /system_tb/DUT/CPU/CM1/DCACHE/j
add wave -noupdate -group cc /system_tb/DUT/CPU/CC/CLK
add wave -noupdate -group cc /system_tb/DUT/CPU/CC/nRST
add wave -noupdate -group cc /system_tb/DUT/CPU/CC/state
add wave -noupdate -group cc /system_tb/DUT/CPU/CC/nstate
add wave -noupdate -group cc /system_tb/DUT/CPU/CC/snoop
add wave -noupdate -group cc /system_tb/DUT/CPU/CC/snooped
add wave -noupdate -group cc /system_tb/DUT/CPU/CC/nsnoop
add wave -noupdate -group cc /system_tb/DUT/CPU/CC/nsnooped
add wave -noupdate -group cc /system_tb/DUT/CPU/CC/snoopaddr
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
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/ccif/iwait
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/ccif/dwait
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/ccif/iREN
add wave -noupdate -group ccif -expand /system_tb/DUT/CPU/CC/ccif/dREN
add wave -noupdate -group ccif -expand /system_tb/DUT/CPU/CC/ccif/dWEN
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/ccif/iload
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/ccif/dload
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/ccif/dstore
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/ccif/iaddr
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/ccif/daddr
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/ccif/ccwait
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/ccif/ccinv
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/ccif/ccwrite
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/ccif/cctrans
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/ccif/ccsnoopaddr
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/ccif/ramWEN
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/ccif/ramREN
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/ccif/ramstate
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/ccif/ramaddr
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/ccif/ramstore
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/ccif/ramload
add wave -noupdate -expand -group dpif0 /system_tb/DUT/CPU/DP0/dpif/halt
add wave -noupdate -expand -group dpif0 /system_tb/DUT/CPU/DP0/dpif/ihit
add wave -noupdate -expand -group dpif0 /system_tb/DUT/CPU/DP0/dpif/imemREN
add wave -noupdate -expand -group dpif0 /system_tb/DUT/CPU/DP0/dpif/imemload
add wave -noupdate -expand -group dpif0 /system_tb/DUT/CPU/DP0/dpif/imemaddr
add wave -noupdate -expand -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dhit
add wave -noupdate -expand -group dpif0 /system_tb/DUT/CPU/DP0/dpif/datomic
add wave -noupdate -expand -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dmemREN
add wave -noupdate -expand -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dmemWEN
add wave -noupdate -expand -group dpif0 /system_tb/DUT/CPU/DP0/dpif/flushed
add wave -noupdate -expand -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dmemload
add wave -noupdate -expand -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dmemstore
add wave -noupdate -expand -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dmemaddr
add wave -noupdate -group dp0 /system_tb/DUT/CPU/DP0/CLK
add wave -noupdate -group dp0 /system_tb/DUT/CPU/DP0/nRST
add wave -noupdate -group dp0 /system_tb/DUT/CPU/DP0/Imm
add wave -noupdate -group dp0 /system_tb/DUT/CPU/DP0/pc
add wave -noupdate -group dp0 /system_tb/DUT/CPU/DP0/npc
add wave -noupdate -group dp0 /system_tb/DUT/CPU/DP0/newpc
add wave -noupdate -group dp0 /system_tb/DUT/CPU/DP0/branch
add wave -noupdate -group dp0 /system_tb/DUT/CPU/DP0/jump
add wave -noupdate -group dp0 /system_tb/DUT/CPU/DP0/portB
add wave -noupdate -group dp0 /system_tb/DUT/CPU/DP0/port1
add wave -noupdate -group dp0 /system_tb/DUT/CPU/DP0/port2
add wave -noupdate -group dp0 /system_tb/DUT/CPU/DP0/temp
add wave -noupdate -group dp0 /system_tb/DUT/CPU/DP0/exmeminstruction
add wave -noupdate -group dp0 /system_tb/DUT/CPU/DP0/branchok
add wave -noupdate -group dp0 /system_tb/DUT/CPU/DP0/jok
add wave -noupdate -group rfif0 /system_tb/DUT/CPU/DP0/RF/rfif/WEN
add wave -noupdate -group rfif0 /system_tb/DUT/CPU/DP0/RF/rfif/wsel
add wave -noupdate -group rfif0 /system_tb/DUT/CPU/DP0/RF/rfif/rsel1
add wave -noupdate -group rfif0 /system_tb/DUT/CPU/DP0/RF/rfif/rsel2
add wave -noupdate -group rfif0 /system_tb/DUT/CPU/DP0/RF/rfif/wdat
add wave -noupdate -group rfif0 /system_tb/DUT/CPU/DP0/RF/rfif/rdat1
add wave -noupdate -group rfif0 /system_tb/DUT/CPU/DP0/RF/rfif/rdat2
add wave -noupdate -group rfif0 /system_tb/DUT/CPU/DP0/RF/register
add wave -noupdate -group alu0 /system_tb/DUT/CPU/DP0/ALU/aluif/aluop
add wave -noupdate -group alu0 /system_tb/DUT/CPU/DP0/ALU/aluif/negative
add wave -noupdate -group alu0 /system_tb/DUT/CPU/DP0/ALU/aluif/zero
add wave -noupdate -group alu0 /system_tb/DUT/CPU/DP0/ALU/aluif/overflow
add wave -noupdate -group alu0 /system_tb/DUT/CPU/DP0/ALU/aluif/portA
add wave -noupdate -group alu0 /system_tb/DUT/CPU/DP0/ALU/aluif/portB
add wave -noupdate -group alu0 /system_tb/DUT/CPU/DP0/ALU/aluif/outputPort
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CU/cuif/instruction
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CU/cuif/dWEN
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CU/cuif/dREN
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CU/cuif/RegWEN
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CU/cuif/MemtoReg
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CU/cuif/halt
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CU/cuif/jal
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CU/cuif/bne
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CU/cuif/ALUsrc
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CU/cuif/Regdst
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CU/cuif/jsel
add wave -noupdate -group cuif0 /system_tb/DUT/CPU/DP0/CU/cuif/aluop
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/instructionin
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/instructionout
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/pcin
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/pcout
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/ihit
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/dhit
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/freeze
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/flush
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/dWEN
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/dREN
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/rdat1_in
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/rdat2_in
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/npcin
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/newpcin
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/dWEN_in
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/dREN_in
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/RegWEN_in
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/MemtoReg_in
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/halt_in
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/jal_in
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/bne_in
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/imemren_in
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/ALUsrc_in
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/Regdst_in
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/jsel_in
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/aluop_in
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/rdat1_out
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/rdat2_out
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/npcout
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/newpcout
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/dWEN_out
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/dREN_out
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/RegWEN_out
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/MemtoReg_out
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/halt_out
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/jal_out
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/bne_out
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/imemren_out
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/ALUsrc_out
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/Regdst_out
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/jsel_out
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/aluop_out
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/outputPort_in
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/outputPort_out
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/zero_in
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/zero_out
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/dmemload_in
add wave -noupdate -group ifid0 /system_tb/DUT/CPU/DP0/IFID/ifidif/dmemload_out
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/instructionin
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/instructionout
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/pcin
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/pcout
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/ihit
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/dhit
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/freeze
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/flush
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/dWEN
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/dREN
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/rdat1_in
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/rdat2_in
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/npcin
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/newpcin
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/dWEN_in
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/dREN_in
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/RegWEN_in
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/MemtoReg_in
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/halt_in
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/jal_in
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/bne_in
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/imemren_in
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/ALUsrc_in
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/Regdst_in
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/jsel_in
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/aluop_in
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/rdat1_out
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/rdat2_out
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/npcout
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/newpcout
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/dWEN_out
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/dREN_out
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/RegWEN_out
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/MemtoReg_out
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/halt_out
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/jal_out
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/bne_out
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/imemren_out
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/ALUsrc_out
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/Regdst_out
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/jsel_out
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/aluop_out
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/outputPort_in
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/outputPort_out
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/zero_in
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/zero_out
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/dmemload_in
add wave -noupdate -group idex0 /system_tb/DUT/CPU/DP0/IDEX/idexif/dmemload_out
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/instructionin
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/instructionout
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/pcin
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/pcout
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/ihit
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/dhit
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/freeze
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/flush
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/dWEN
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/dREN
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/rdat1_in
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/rdat2_in
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/npcin
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/newpcin
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/dWEN_in
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/dREN_in
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/RegWEN_in
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/MemtoReg_in
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/halt_in
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/jal_in
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/bne_in
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/imemren_in
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/ALUsrc_in
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/Regdst_in
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/jsel_in
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/aluop_in
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/rdat1_out
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/rdat2_out
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/npcout
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/newpcout
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/dWEN_out
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/dREN_out
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/RegWEN_out
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/MemtoReg_out
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/halt_out
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/jal_out
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/bne_out
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/imemren_out
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/ALUsrc_out
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/Regdst_out
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/jsel_out
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/aluop_out
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/outputPort_in
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/outputPort_out
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/zero_in
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/zero_out
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/dmemload_in
add wave -noupdate -group exmem0 /system_tb/DUT/CPU/DP0/EXMEM/exmemif/dmemload_out
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/instructionin
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/instructionout
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/pcin
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/pcout
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/ihit
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/dhit
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/freeze
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/flush
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/dWEN
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/dREN
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/rdat1_in
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/rdat2_in
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/npcin
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/newpcin
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/dWEN_in
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/dREN_in
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/RegWEN_in
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/MemtoReg_in
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/halt_in
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/jal_in
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/bne_in
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/imemren_in
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/ALUsrc_in
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/Regdst_in
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/jsel_in
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/aluop_in
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/rdat1_out
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/rdat2_out
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/npcout
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/newpcout
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/dWEN_out
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/dREN_out
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/RegWEN_out
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/MemtoReg_out
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/halt_out
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/jal_out
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/bne_out
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/imemren_out
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/ALUsrc_out
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/Regdst_out
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/jsel_out
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/aluop_out
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/outputPort_in
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/outputPort_out
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/zero_in
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/zero_out
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/dmemload_in
add wave -noupdate -group memwb0 /system_tb/DUT/CPU/DP0/MEMWB/memwbif/dmemload_out
add wave -noupdate -expand -group hu0 /system_tb/DUT/CPU/DP0/HU/huif/ifid_instr
add wave -noupdate -expand -group hu0 /system_tb/DUT/CPU/DP0/HU/huif/idex_instr
add wave -noupdate -expand -group hu0 /system_tb/DUT/CPU/DP0/HU/huif/exmem_instr
add wave -noupdate -expand -group hu0 /system_tb/DUT/CPU/DP0/HU/huif/freeze
add wave -noupdate -expand -group hu0 /system_tb/DUT/CPU/DP0/HU/huif/flush
add wave -noupdate -expand -group hu0 /system_tb/DUT/CPU/DP0/HU/huif/RegWEN
add wave -noupdate -expand -group hu0 /system_tb/DUT/CPU/DP0/HU/huif/dhit
add wave -noupdate -expand -group hu0 /system_tb/DUT/CPU/DP0/HU/huif/start
add wave -noupdate -expand -group hu0 /system_tb/DUT/CPU/DP0/HU/huif/branchok
add wave -noupdate -expand -group hu0 /system_tb/DUT/CPU/DP0/HU/huif/jok
add wave -noupdate -expand -group hu0 /system_tb/DUT/CPU/DP0/HU/huif/jsel
add wave -noupdate -group fu0 /system_tb/DUT/CPU/DP0/FU/fuif/rs
add wave -noupdate -group fu0 /system_tb/DUT/CPU/DP0/FU/fuif/rt
add wave -noupdate -group fu0 /system_tb/DUT/CPU/DP0/FU/fuif/rdm
add wave -noupdate -group fu0 /system_tb/DUT/CPU/DP0/FU/fuif/rdw
add wave -noupdate -group fu0 /system_tb/DUT/CPU/DP0/FU/fuif/exmemRW
add wave -noupdate -group fu0 /system_tb/DUT/CPU/DP0/FU/fuif/memwbRW
add wave -noupdate -group fu0 /system_tb/DUT/CPU/DP0/FU/fuif/port1
add wave -noupdate -group fu0 /system_tb/DUT/CPU/DP0/FU/fuif/port2
add wave -noupdate -group fu0 /system_tb/DUT/CPU/DP0/FU/fuif/port3
add wave -noupdate -group fu0 /system_tb/DUT/CPU/DP0/FU/fuif/idex_instr
add wave -noupdate -group fu0 /system_tb/DUT/CPU/DP0/FU/fuif/exmem_instr
add wave -noupdate -group fu0 /system_tb/DUT/CPU/DP0/FU/fuif/memwb_instr
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/halt
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/ihit
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/imemREN
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/imemload
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/imemaddr
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dhit
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/datomic
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dmemREN
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dmemWEN
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/flushed
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dmemload
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dmemstore
add wave -noupdate -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dmemaddr
add wave -noupdate -group dp1 /system_tb/DUT/CPU/DP1/CLK
add wave -noupdate -group dp1 /system_tb/DUT/CPU/DP1/nRST
add wave -noupdate -group dp1 /system_tb/DUT/CPU/DP1/Imm
add wave -noupdate -group dp1 /system_tb/DUT/CPU/DP1/pc
add wave -noupdate -group dp1 /system_tb/DUT/CPU/DP1/npc
add wave -noupdate -group dp1 /system_tb/DUT/CPU/DP1/newpc
add wave -noupdate -group dp1 /system_tb/DUT/CPU/DP1/branch
add wave -noupdate -group dp1 /system_tb/DUT/CPU/DP1/jump
add wave -noupdate -group dp1 /system_tb/DUT/CPU/DP1/portB
add wave -noupdate -group dp1 /system_tb/DUT/CPU/DP1/port1
add wave -noupdate -group dp1 /system_tb/DUT/CPU/DP1/port2
add wave -noupdate -group dp1 /system_tb/DUT/CPU/DP1/temp
add wave -noupdate -group dp1 /system_tb/DUT/CPU/DP1/branchok
add wave -noupdate -group dp1 /system_tb/DUT/CPU/DP1/jok
add wave -noupdate -group rfif1 /system_tb/DUT/CPU/DP1/rfif/WEN
add wave -noupdate -group rfif1 /system_tb/DUT/CPU/DP1/rfif/wsel
add wave -noupdate -group rfif1 /system_tb/DUT/CPU/DP1/rfif/rsel1
add wave -noupdate -group rfif1 /system_tb/DUT/CPU/DP1/rfif/rsel2
add wave -noupdate -group rfif1 /system_tb/DUT/CPU/DP1/rfif/wdat
add wave -noupdate -group rfif1 /system_tb/DUT/CPU/DP1/rfif/rdat1
add wave -noupdate -group rfif1 /system_tb/DUT/CPU/DP1/rfif/rdat2
add wave -noupdate -group rfif1 -expand /system_tb/DUT/CPU/DP1/RF/register
add wave -noupdate -group alu1 /system_tb/DUT/CPU/DP1/aluif/aluop
add wave -noupdate -group alu1 /system_tb/DUT/CPU/DP1/aluif/negative
add wave -noupdate -group alu1 /system_tb/DUT/CPU/DP1/aluif/zero
add wave -noupdate -group alu1 /system_tb/DUT/CPU/DP1/aluif/overflow
add wave -noupdate -group alu1 /system_tb/DUT/CPU/DP1/aluif/portA
add wave -noupdate -group alu1 /system_tb/DUT/CPU/DP1/aluif/portB
add wave -noupdate -group alu1 /system_tb/DUT/CPU/DP1/aluif/outputPort
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/instruction
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/dWEN
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/dREN
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/RegWEN
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/MemtoReg
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/halt
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/jal
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/bne
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/ALUsrc
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/Regdst
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/jsel
add wave -noupdate -group cuif1 /system_tb/DUT/CPU/DP1/cuif/aluop
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/instructionin
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/instructionout
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/pcin
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/pcout
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/ihit
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/dhit
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/freeze
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/flush
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/dWEN
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/dREN
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/rdat1_in
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/rdat2_in
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/npcin
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/newpcin
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/dWEN_in
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/dREN_in
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/RegWEN_in
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/MemtoReg_in
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/halt_in
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/jal_in
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/bne_in
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/imemren_in
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/ALUsrc_in
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/Regdst_in
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/jsel_in
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/aluop_in
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/rdat1_out
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/rdat2_out
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/npcout
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/newpcout
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/dWEN_out
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/dREN_out
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/RegWEN_out
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/MemtoReg_out
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/halt_out
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/jal_out
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/bne_out
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/imemren_out
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/ALUsrc_out
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/Regdst_out
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/jsel_out
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/aluop_out
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/outputPort_in
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/outputPort_out
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/zero_in
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/zero_out
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/dmemload_in
add wave -noupdate -group ifid1 /system_tb/DUT/CPU/DP1/ifid/dmemload_out
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/instructionin
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/instructionout
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/pcin
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/pcout
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/ihit
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/dhit
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/freeze
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/flush
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/dWEN
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/dREN
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/rdat1_in
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/rdat2_in
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/npcin
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/newpcin
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/dWEN_in
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/dREN_in
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/RegWEN_in
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/MemtoReg_in
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/halt_in
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/jal_in
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/bne_in
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/imemren_in
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/ALUsrc_in
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/Regdst_in
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/jsel_in
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/aluop_in
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/rdat1_out
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/rdat2_out
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/npcout
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/newpcout
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/dWEN_out
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/dREN_out
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/RegWEN_out
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/MemtoReg_out
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/halt_out
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/jal_out
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/bne_out
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/imemren_out
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/ALUsrc_out
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/Regdst_out
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/jsel_out
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/aluop_out
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/outputPort_in
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/outputPort_out
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/zero_in
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/zero_out
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/dmemload_in
add wave -noupdate -group idex1 /system_tb/DUT/CPU/DP1/idex/dmemload_out
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/instructionin
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/instructionout
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/pcin
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/pcout
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/ihit
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/dhit
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/freeze
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/flush
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/dWEN
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/dREN
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/rdat1_in
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/rdat2_in
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/npcin
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/newpcin
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/dWEN_in
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/dREN_in
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/RegWEN_in
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/MemtoReg_in
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/halt_in
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/jal_in
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/bne_in
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/imemren_in
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/ALUsrc_in
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/Regdst_in
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/jsel_in
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/aluop_in
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/rdat1_out
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/rdat2_out
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/npcout
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/newpcout
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/dWEN_out
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/dREN_out
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/RegWEN_out
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/MemtoReg_out
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/halt_out
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/jal_out
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/bne_out
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/imemren_out
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/ALUsrc_out
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/Regdst_out
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/jsel_out
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/aluop_out
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/outputPort_in
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/outputPort_out
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/zero_in
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/zero_out
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/dmemload_in
add wave -noupdate -group exmem1 /system_tb/DUT/CPU/DP1/exmem/dmemload_out
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/instructionin
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/instructionout
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/pcin
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/pcout
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/ihit
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/dhit
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/freeze
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/flush
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/dWEN
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/dREN
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/rdat1_in
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/rdat2_in
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/npcin
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/newpcin
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/dWEN_in
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/dREN_in
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/RegWEN_in
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/MemtoReg_in
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/halt_in
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/jal_in
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/bne_in
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/imemren_in
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/ALUsrc_in
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/Regdst_in
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/jsel_in
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/aluop_in
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/rdat1_out
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/rdat2_out
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/npcout
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/newpcout
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/dWEN_out
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/dREN_out
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/RegWEN_out
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/MemtoReg_out
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/halt_out
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/jal_out
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/bne_out
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/imemren_out
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/ALUsrc_out
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/Regdst_out
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/jsel_out
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/aluop_out
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/outputPort_in
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/outputPort_out
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/zero_in
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/zero_out
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/dmemload_in
add wave -noupdate -group memwb1 /system_tb/DUT/CPU/DP1/memwb/dmemload_out
add wave -noupdate -group huif1 /system_tb/DUT/CPU/DP1/huif/ifid_instr
add wave -noupdate -group huif1 /system_tb/DUT/CPU/DP1/huif/idex_instr
add wave -noupdate -group huif1 /system_tb/DUT/CPU/DP1/huif/exmem_instr
add wave -noupdate -group huif1 /system_tb/DUT/CPU/DP1/huif/freeze
add wave -noupdate -group huif1 /system_tb/DUT/CPU/DP1/huif/flush
add wave -noupdate -group huif1 /system_tb/DUT/CPU/DP1/huif/RegWEN
add wave -noupdate -group huif1 /system_tb/DUT/CPU/DP1/huif/dhit
add wave -noupdate -group huif1 /system_tb/DUT/CPU/DP1/huif/start
add wave -noupdate -group huif1 /system_tb/DUT/CPU/DP1/huif/branchok
add wave -noupdate -group huif1 /system_tb/DUT/CPU/DP1/huif/jok
add wave -noupdate -group huif1 /system_tb/DUT/CPU/DP1/huif/jsel
add wave -noupdate -group fu1 /system_tb/DUT/CPU/DP1/fuif/rs
add wave -noupdate -group fu1 /system_tb/DUT/CPU/DP1/fuif/rt
add wave -noupdate -group fu1 /system_tb/DUT/CPU/DP1/fuif/rdm
add wave -noupdate -group fu1 /system_tb/DUT/CPU/DP1/fuif/rdw
add wave -noupdate -group fu1 /system_tb/DUT/CPU/DP1/fuif/exmemRW
add wave -noupdate -group fu1 /system_tb/DUT/CPU/DP1/fuif/memwbRW
add wave -noupdate -group fu1 /system_tb/DUT/CPU/DP1/fuif/port1
add wave -noupdate -group fu1 /system_tb/DUT/CPU/DP1/fuif/port2
add wave -noupdate -group fu1 /system_tb/DUT/CPU/DP1/fuif/port3
add wave -noupdate -group fu1 /system_tb/DUT/CPU/DP1/fuif/idex_instr
add wave -noupdate -group fu1 /system_tb/DUT/CPU/DP1/fuif/exmem_instr
add wave -noupdate -group fu1 /system_tb/DUT/CPU/DP1/fuif/memwb_instr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {977108 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 284
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
WaveRestoreZoom {0 ps} {1442 ns}
