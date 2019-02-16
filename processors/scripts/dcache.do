onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dcache_tb/CLK
add wave -noupdate /dcache_tb/nRST
add wave -noupdate /dcache_tb/DUT/dcif/halt
add wave -noupdate /dcache_tb/DUT/dcif/dhit
add wave -noupdate /dcache_tb/DUT/dcif/datomic
add wave -noupdate /dcache_tb/DUT/dcif/dmemREN
add wave -noupdate /dcache_tb/DUT/dcif/dmemWEN
add wave -noupdate /dcache_tb/DUT/dcif/flushed
add wave -noupdate /dcache_tb/DUT/dcif/dmemload
add wave -noupdate /dcache_tb/DUT/dcif/dmemstore
add wave -noupdate /dcache_tb/DUT/dcif/dmemaddr
add wave -noupdate /dcache_tb/DUT/cif/dwait
add wave -noupdate /dcache_tb/DUT/cif/dREN
add wave -noupdate /dcache_tb/DUT/cif/dWEN
add wave -noupdate /dcache_tb/DUT/cif/dload
add wave -noupdate /dcache_tb/DUT/cif/dstore
add wave -noupdate /dcache_tb/DUT/cif/daddr
add wave -noupdate /dcache_tb/DUT/cif/ccsnoopaddr
add wave -noupdate /dcache_tb/DUT/index
add wave -noupdate /dcache_tb/DUT/block
add wave -noupdate /dcache_tb/DUT/miss
add wave -noupdate -expand /dcache_tb/DUT/df0
add wave -noupdate -expand /dcache_tb/DUT/df1
add wave -noupdate /dcache_tb/DUT/tag
add wave -noupdate /dcache_tb/DUT/state
add wave -noupdate /dcache_tb/DUT/next
add wave -noupdate /dcache_tb/DUT/hc
add wave -noupdate /dcache_tb/DUT/nhc
add wave -noupdate /dcache_tb/DUT/row
add wave -noupdate /dcache_tb/DUT/nextrow
add wave -noupdate /dcache_tb/DUT/currrow
add wave -noupdate /dcache_tb/DUT/cur
add wave -noupdate /dcache_tb/DUT/ncur
add wave -noupdate /dcache_tb/DUT/last
add wave -noupdate /dcache_tb/DUT/nlast
add wave -noupdate /dcache_tb/DUT/rdy0
add wave -noupdate /dcache_tb/DUT/rdy1
add wave -noupdate /dcache_tb/DUT/data0
add wave -noupdate /dcache_tb/DUT/data1
add wave -noupdate /dcache_tb/DUT/ndirty
add wave -noupdate /dcache_tb/DUT/nvalid
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {70 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 280
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
WaveRestoreZoom {0 ns} {593 ns}
