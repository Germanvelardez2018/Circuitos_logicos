ghdl -a sumador_1b.vhd

echo "creando el sumador de 8 bits"
ghdl -a ALU_SUMADOR.vhd
echo "paso 2"
ghdl -a ALU_SUMADOR_tb.vhd

echo "paso 3"
ghdl -e ALU_SUMADOR_tb
echo "paso 4"
ghdl -r ALU_SUMADOR_tb --vcd=ALU_SUMADOR.vcd  --stop-time=1000ns

echo"gtkwarey init"
gtkwave ALU_SUMADOR.vcd