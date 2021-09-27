## Comandos para compilar el codigo

ghdl -a counter.vhd
ghdl -a counter_tb.vhd
ghdl -e counter_tb
ghdl -r counter_tb --vcd=counter.vcd  --stop-time=1000ns
gtkwave counter.vcd