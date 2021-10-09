

echo "creando el sumador de 8 bits"
ghdl -a ALU_LOGICO.vhd
echo "paso 2"
ghdl -a ALU_LOGICO_tb.vhd

echo "paso 3"
ghdl -e ALU_LOGICO_tb
echo "paso 4"
ghdl -r ALU_LOGICO_tb --vcd=ALU_LOGICO.vcd  --stop-time=1000ns

echo"gtkwarey init"
gtkwave ALU_LOGICO.vcd