ghdl -a full_adder.vhd

echo "creando el sumador de 4 bits"
ghdl -a fadd_nbits.vhd
echo "paso 2"
ghdl -a fadd_nbits_tb.vhd

echo "paso 3"
ghdl -e fadd_nbits_tb
echo "paso 4"
ghdl -r fadd_nbits_tb --vcd=fadd_nbits.vcd  --stop-time=1000ns

echo"gtkwarey init"
gtkwave fadd_nbits.vcd