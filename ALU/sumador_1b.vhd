-- Name project: Sumador completo de 1 bit  
-- Author: German Velardez
-- Date: 2/10/2021


---------------------------
-- Include
library IEEE;
use IEEE.std_logic_1164.all;

entity sumador_1b is
    port(
        c_i: in std_logic;
        a_i: in std_logic;
        b_i: in std_logic;
        s_o: out std_logic;
        c_o: out std_logic 
    );
end;

architecture sumador_1b_arch of sumador_1b is
    begin
        s_o <= a_i xor b_i xor c_i;
        c_o <= (a_i and b_i) or (c_i and (a_i xor b_i));
    end;