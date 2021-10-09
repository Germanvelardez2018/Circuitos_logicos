-- Name project: comparator  ( N bit)
-- Author: German Velardez
-- Date: 2/10/2021


---------------------------
-- Include
library IEEE;
use IEEE.std_logic_1164.all;



--------------------------
-- Entity definition


entity comparator_nbits is
        generic(
            N: NATURAL:=4
            );
        port ( 

        -- input
                num_a: in std_logic_vector(N-1 downto 0);
                num_b: in std_logic_vector( N-1 downto 0);
                en_i: in std_logic;                       --habilita con 1
        --output
                a_o:  out std_logic;
                b_o:  out std_logic;
                eq_o: out std_logic
        );
end ;



---------------------------
-- Architecture: comparator 1 bit


architecture comparator_nbits_arch of comparator_nbits is
begin
       

    a_o <= '1' when (num_a > num_b) else '0';  -- A>B
    b_o <= '1' when (num_a < num_b) else '0';  -- A<B
    eq_o<= '1' when (num_a = num_b) else '0';  -- A=B 


end architecture;


 

