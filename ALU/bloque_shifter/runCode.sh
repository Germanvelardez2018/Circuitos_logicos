# Comandos para compilar el codigo
echo "compilando shifter reg"
ghdl -a shifter_reg.vhd
ghdl -a shifter_reg_tb.vhd
ghdl -e shifter_reg_tb
ghdl -r shifter_reg_tb --vcd=shifter_reg.vcd  --stop-time=1500ns
gtkwave shifter_reg.vcd