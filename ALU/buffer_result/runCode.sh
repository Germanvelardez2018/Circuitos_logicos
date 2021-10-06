## Comandos para compilar el codigo

ghdl -a buffer_result.vhd
ghdl -a buffer_result_tb.vhd
ghdl -e buffer_result_tb
ghdl -r buffer_result_tb --vcd=buffer_result.vcd  --stop-time=1000ns
gtkwave buffer_result.vcd