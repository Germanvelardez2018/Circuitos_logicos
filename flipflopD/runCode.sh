## Comandos para compilar el codigo

ghdl -a ffd.vhd
ghdl -a ffd_tb.vhd
ghdl -e ffd_tb
ghdl -r ffd_tb --vcd=ffd.vcd  --stop-time=1000ns
gtkwave ffd.vcd