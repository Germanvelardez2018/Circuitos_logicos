-- Name project: testbench: neg block  ( N bits)
-- Author: German Velardez
-- Date: 2/10/2021


---------------------------
-- Include
library IEEE;
use IEEE.std_logic_1164.all;



--------------------------
-- Entity definition

entity neg_block_tb is end;





-------------------------------
-- Architecture: neg_block


architecture neg_block_tb of neg_block_tb is



    component Neg_block is 

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
     end component;


    ------------------------
    -- Signal

    signal num_i_tb: std_logic_vector(3 downto  0):="1010";
    signal num_o_tb: std_logic_vector(3 downto  0);
    signal en_i_tb:     std_logic :='0';

    begin


        ---------------------------
        -- Test Secuence
        test_secuence: process 
        begin
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
            --input
        
        en_i_tb      <='1';
            wait for 50 ns;
            -----------------
            -----------------
        end process;


        ----------------
        -- Connection

        DUT: neg_block
        port map (
            --input 
                num_i=> num_i_tb,              
                en_i =>en_i_tb,
                --output
                num_o => num_o_tb
              
            );
      
    end;