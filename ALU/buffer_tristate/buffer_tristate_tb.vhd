-- Name project: ALU. Buffer tristate (testbench)  ( N bits)
-- Author: German Velardez
-- Date: 2/10/2021

-- Description: Testbench

---------------------------
-- Include
library IEEE;
use IEEE.std_logic_1164.all;




--------------------------
--Entity definition

entity  buffer_tristate_tb is end;



architecture buffer_tristate_tb of buffer_tristate_tb is


--------------------------
--Entity definition

component Buffer_tristate is 

  generic(
      N: natural:= 4
  );
  port(
    --input 
        data_i: in std_logic_vector(N-1 downto 0);
       
        en_i: in std_logic;

    --output
        data_o: out std_logic_vector(N-1 downto 0) --el resultado puede desbordar los N bits   
      
    );
end component;


------------------------
--Signal 

signal data_i_tb: std_logic_vector(3 downto  0):="1010";
signal data_o_tb: std_logic_vector(3 downto  0);
signal en_i_tb:     std_logic:='1';

begin

  ---------------------------
        -- Test Secuence
        test_secuence: process 
        begin
                -----------------
                --input
                
            en_i_tb      <='0';
                wait for 50 ns;
                -----------------
                -----------------
                --input
                
            en_i_tb      <='1';
                wait for 50 ns;
                -----------------
                -----------------
                --input
            
            en_i_tb      <='1';
                wait for 50 ns;
                -----------------
                -----------------
                --input            
            en_i_tb      <='0';
                wait for 50 ns;
                -----------------
                -----------------
        end process;



        -- Connection

        DUT: Buffer_tristate
        port map (
                 --input 
                data_i=> data_i_tb,              
                en_i =>en_i_tb,
                --output
                data_o => data_o_tb
              
            );


end;