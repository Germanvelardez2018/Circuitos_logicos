## Comandos para compilar el codigo

ghdl -a sum1b.vhd
ghdl -a sum1b_tb.vhd
ghdl -e sum1b_tb
ghdl -r sum1b_tb --vcd=sum1b.vcd  --stop-time=1000ns
gtkwave sum1b.vcd