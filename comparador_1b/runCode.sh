## Comandos para compilar el codigo

ghdl -a comparator_nbits.vhd
ghdl -a comparator_nbits_tb.vhd
ghdl -e comparator_nbits_tb
ghdl -r comparator_nbits_tb --vcd=comparator_nbits.vcd  --stop-time=1000ns
gtkwave comparator_nbits.vcd