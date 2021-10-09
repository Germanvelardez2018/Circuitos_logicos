
echo "creando multiplicador"
ghdl -a multi.vhd
echo "paso 2"
ghdl -a multi_tb.vhd

echo "paso 3"
ghdl -e multi_tb
echo "paso 4"
ghdl -r multi_tb --vcd=multi.vcd  --stop-time=1000ns

echo"gtkwarey init"
gtkwave multi.vcd