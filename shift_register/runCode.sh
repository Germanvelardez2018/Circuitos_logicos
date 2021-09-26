## Comandos para compilar el codigo

ghdl -a ffd.vhd
ghdl -a shift_reg.vhd
ghdl -a sreg_tb.vhd
ghdl -e sreg_tb
ghdl -r sreg_tb --vcd=shift_reg.vcd  --stop-time=1000ns
gtkwave shift_reg.vcd