## Comandos para compilar el codigo

ghdl -a multiplexor.vhd
ghdl -a multiplexor_tb.vhd
ghdl -e multiplexor_tb
ghdl -r multiplexor_tb --vcd=multiplexor.vcd  --stop-time=1000ns
gtkwave multiplexor.vcd