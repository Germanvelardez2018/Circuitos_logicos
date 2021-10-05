-- Name project: ALU. Buffer select (testbench)  ( N bits)
-- Author: German Velardez
-- Date: 2/10/2021

-- Description: Buffer para manipular los numeros que llegan a la ALU

---------------------------
-- Include
library IEEE;
use IEEE.std_logic_1164.all;




--------------------------
--Entity definition

entity  buffer_select_tb is end;



architecture buffer_select_tb of buffer_select_tb is


--------------------------
--Entity definition

component Buffer_select is 

  generic(
      N: natural:= 4
  );
  port(
    --input 
        num_i: in std_logic_vector(N-1 downto 0);
       
        en_i: in std_logic_vector( 1 downto 0); -- 4 opciones

    --output
        num_o: out std_logic_vector(N-1 downto 0) --el resultado puede desbordar los N bits   
      
    );
end component;


------------------------
--Signal 

signal num_i_tb: std_logic_vector(3 downto  0):="1010";
signal num_o_tb: std_logic_vector(3 downto  0);
signal en_i_tb:     std_logic_vector(1 downto 0) :="00";

begin

  ---------------------------
        -- Test Secuence
        test_secuence: process 
        begin
                -----------------
                --input
                
            en_i_tb      <="00";
                wait for 50 ns;
                -----------------
                -----------------
                --input
                
            en_i_tb      <="01";
                wait for 50 ns;
                -----------------
                -----------------
                --input
            
            en_i_tb      <="11";
                wait for 50 ns;
                -----------------
                -----------------
                --input            
            en_i_tb      <="10";
                wait for 50 ns;
                -----------------
                -----------------
        end process;



        -- Connection

        DUT: Buffer_select
        port map (
                 --input 
                num_i=> num_i_tb,              
                en_i =>en_i_tb,
                --output
                num_o => num_o_tb
              
            );


end;