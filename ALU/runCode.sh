
echo "compilando dependencias"
echo "compilando sumador 1 bit"
ghdl -a sumador_1b.vhd
echo "compilando buffer select"
ghdl -a buffer_select.vhd
echo "compilando buffer tristate"
ghdl -a buffer_tristate.vhd
echo "compilando ALU ARITMETICO"
ghdl -a ALU_SUMADOR.vhd
echo "compilando ALU DE FUNCIONES LOGICAS"
ghdl -a ALU_LOGICO.vhd

echo "creando el sumador de 8 bits"
ghdl -a ALU.vhd
echo "paso 2"
ghdl -a ALU_tb.vhd

echo "paso 3"
ghdl -e ALU_tb
echo "paso 4"
ghdl -r ALU_tb --vcd=ALU.vcd  --stop-time=1000ns

echo"gtkwarey init"
gtkwave ALU.vcd