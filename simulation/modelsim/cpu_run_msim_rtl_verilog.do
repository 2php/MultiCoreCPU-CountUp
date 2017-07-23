transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/KoheiYamamoto/Desktop/KoheiYamamoto-FPGA/M-CPU-Fin {C:/Users/KoheiYamamoto/Desktop/KoheiYamamoto-FPGA/M-CPU-Fin/count16rle.v}
vlog -vlog01compat -work work +incdir+C:/Users/KoheiYamamoto/Desktop/KoheiYamamoto-FPGA/M-CPU-Fin {C:/Users/KoheiYamamoto/Desktop/KoheiYamamoto-FPGA/M-CPU-Fin/cpu.v}
vlog -vlog01compat -work work +incdir+C:/Users/KoheiYamamoto/Desktop/KoheiYamamoto-FPGA/M-CPU-Fin {C:/Users/KoheiYamamoto/Desktop/KoheiYamamoto-FPGA/M-CPU-Fin/regfile.v}
vlog -vlog01compat -work work +incdir+C:/Users/KoheiYamamoto/Desktop/KoheiYamamoto-FPGA/M-CPU-Fin {C:/Users/KoheiYamamoto/Desktop/KoheiYamamoto-FPGA/M-CPU-Fin/sm.v}
vlog -vlog01compat -work work +incdir+C:/Users/KoheiYamamoto/Desktop/KoheiYamamoto-FPGA/M-CPU-Fin {C:/Users/KoheiYamamoto/Desktop/KoheiYamamoto-FPGA/M-CPU-Fin/reg16.v}
vlog -vlog01compat -work work +incdir+C:/Users/KoheiYamamoto/Desktop/KoheiYamamoto-FPGA/M-CPU-Fin {C:/Users/KoheiYamamoto/Desktop/KoheiYamamoto-FPGA/M-CPU-Fin/muxreg16.v}
vlog -vlog01compat -work work +incdir+C:/Users/KoheiYamamoto/Desktop/KoheiYamamoto-FPGA/M-CPU-Fin {C:/Users/KoheiYamamoto/Desktop/KoheiYamamoto-FPGA/M-CPU-Fin/cputop.v}
vlog -vlog01compat -work work +incdir+C:/Users/KoheiYamamoto/Desktop/KoheiYamamoto-FPGA/M-CPU-Fin {C:/Users/KoheiYamamoto/Desktop/KoheiYamamoto-FPGA/M-CPU-Fin/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/KoheiYamamoto/Desktop/KoheiYamamoto-FPGA/M-CPU-Fin {C:/Users/KoheiYamamoto/Desktop/KoheiYamamoto-FPGA/M-CPU-Fin/imem.v}
vlog -vlog01compat -work work +incdir+C:/Users/KoheiYamamoto/Desktop/KoheiYamamoto-FPGA/M-CPU-Fin {C:/Users/KoheiYamamoto/Desktop/KoheiYamamoto-FPGA/M-CPU-Fin/dmem.v}

vlog -vlog01compat -work work +incdir+C:/Users/KoheiYamamoto/Desktop/KoheiYamamoto-FPGA/M-CPU-Fin {C:/Users/KoheiYamamoto/Desktop/KoheiYamamoto-FPGA/M-CPU-Fin/cpu2_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  cpu_tb

add wave *
view structure
view signals
run -all
