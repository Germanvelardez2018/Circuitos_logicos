-- Name project:  Multiplicador  ( N bit)
-- Author: German Velardez
-- Date: 2/10/2021


---------------------------
-- Include

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--------------------------
-- Entity definition


entity multi is 
    Generic(N: natural:= 4);
    port(
        --input
            a_i: in std_logic_vector(N-1 downto 0);
            b_i: in std_logic_vector(N-1 downto 0);
        --output
            res_o: out std_logic_vector((2*N) -1 downto 0)
            );
    end entity multi;

------------------------------
--Architecture


architecture multi_arch of multi is 
begin
    res_o <= std_logic_vector((signed(a_i) * signed(b_i)));
  --  res_o <= (others=>'0');
end architecture;
