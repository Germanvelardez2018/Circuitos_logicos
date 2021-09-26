library IEEE;
use IEEE.std_logic_1164.all;

entity negador is
	port(
		a_i: in std_logic;
		b_o: out std_logic
	);
end;

architecture negador_arq of negador is
begin
	b_o <= not a_i;
end;