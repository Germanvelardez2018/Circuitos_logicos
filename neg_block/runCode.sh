ghdl -a neg_block.vhd

echo "negador block: creando "
ghdl -a neg_block.vhd
echo "negador block: paso 2"
ghdl -a neg_block_tb.vhd

echo "negador block: paso 3"
ghdl -e neg_block_tb
echo "negador block: paso 4"
ghdl -r neg_block_tb --vcd=neg_block.vcd  --stop-time=1000ns

echo"gnegador block: tkwarey init"
gtkwave neg_block.vcd