-- Name project: Full Adder  ( 1 bit)
-- Author: German Velardez
-- Date: 2/10/2021


---------------------------
-- Include

library IEEE;
use IEEE.std_logic_1164.all;


--------------------------
-- Entity definition

entity Full_adder is 
  port(
    --input 
        bit1_i :  in std_logic;
        bit2_i: in std_logic;
        carry_i: in std_logic;

    --output
        bit_o  : out std_logic;
        carry_o: out std_logic
    );
end;





---------------------------
-- Architecture: Full Adder

architecture Full_adder_arch of Full_adder is


begin

    bit_o   <= bit1_i XOR bit2_i XOR carry_i;
    carry_o <= (bit1_i AND bit2_i) OR (carry_i AND bit1_i) OR (carry_i AND bit2_i);

end;