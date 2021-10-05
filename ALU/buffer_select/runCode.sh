## Comandos para compilar el codigo

ghdl -a buffer_select.vhd
ghdl -a buffer_select_tb.vhd
ghdl -e buffer_select_tb
ghdl -r buffer_select_tb --vcd=buffer_select.vcd  --stop-time=1000ns
gtkwave buffer_select.vcd