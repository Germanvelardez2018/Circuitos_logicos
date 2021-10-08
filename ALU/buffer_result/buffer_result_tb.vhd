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

entity  buffer_result_tb is end;



architecture buffer_result_tb_arch of buffer_result_tb is



--------------------------
--Entity definition

component Buffer_result is 

  generic(
     
      N: natural:= 4 -- numero de bits de cada resultado
  );
  port(
    --input 

        result_sum : in std_logic_vector(N-1 downto 0);
        result_log: in std_logic_vector(N-1 downto 0);
        en_i: in std_logic;
     

    --output
        num_result_o: out std_logic_vector(N-1 downto 0) --el resultado puede desbordar los N bits   
      
    );
end component;


------------------------
--Signal 

signal result_sum_tb: std_logic_vector(3 downto  0):="0000";
signal result_log_tb: std_logic_vector(3 downto  0):="0000";
signal result_o_tb: std_logic_vector(3 downto  0):="0000";
signal en_i_tb : std_logic :='1';


begin

  ---------------------------
        -- Test Secuence
        test_secuence: process 
        begin
                -----------------
                --input
                
           result_sum_tb      <="0000";
           result_log_tb      <="0001";
           en_i_tb <='1';
                wait for 50 ns;
                -----------------
                -----------------
                --input
                
           result_sum_tb      <="0000";
           result_log_tb      <="0011";
           en_i_tb <='1';
                wait for 50 ns;
                -----------------
                -----------------
                --input
            
           result_sum_tb      <="0000";
           result_log_tb      <="0001";
           en_i_tb <='1';
                wait for 50 ns;
                -----------------
                -----------------
                --input            
           result_sum_tb      <="1100";
           result_log_tb      <="0011";
           en_i_tb <='1';
                wait for 50 ns;
                -----------------
                -----------------
        end process;



        -- Connection

        DUT: Buffer_result
        port map (
                 --input 
                result_sum => result_sum_tb,
                result_log=> result_log_tb,              
                en_i => en_i_tb,
                --output
                num_result_o => result_o_tb              
            );


end;