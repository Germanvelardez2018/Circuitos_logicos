## Comandos para compilar el codigo

ghdl -a buffer_tristate.vhd
ghdl -a buffer_tristate_tb.vhd
ghdl -e buffer_tristate_tb
ghdl -r buffer_tristate_tb --vcd=buffer_tristate.vcd  --stop-time=1000ns
gtkwave buffer_tristate.vcd