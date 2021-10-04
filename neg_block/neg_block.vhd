-- Name project:neg block  ( N bits)
-- Author: German Velardez
-- Date: 2/10/2021


---------------------------
-- Include
library IEEE;
use IEEE.std_logic_1164.all;




--------------------------
--Entity definition

entity Neg_block is 

  generic(
      N: natural:= 4
  );
  port(
    --input 
        num_i: in std_logic_vector(N-1 downto 0);
       
        en_i: in std_logic;

    --output
        num_o: out std_logic_vector(N-1 downto 0) --el resultado puede desbordar los N bits   
      
    );
end Neg_block;


-------------------------
-- Architecture

 


architecture Neg_block_arch of Neg_block is

begin

    negation_process: process(en_i)
    begin
        if en_i = '0' then
            num_o <= num_i;
        else
            neg_loop : for i in 0 to (N-1) loop
                num_o(i) <= not num_i(i) ;
            end loop neg_loop;
        end if;
     end process;
    
end;