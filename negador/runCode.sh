## Comandos para compilar el codigo

ghdl -a negador.vhd
ghdl -a negador_tb.vhd
ghdl -e negador_tb
ghdl -r negador_tb --vcd=negador.vcd
gtkwave negador.vcd