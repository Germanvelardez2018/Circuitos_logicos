-- Name project: tesbench: Multiplicador  ( N bit)
-- Author: German Velardez
-- Date: 2/10/2021


---------------------------
-- Include
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


--------------------------
-- Entity definition

entity multi_tb is end;





-------------------------------
-- Architecture: multi


architecture multi_tb of multi_tb is



    component multi is 

    generic(
        N: natural:= 4
    );
    port(
      --input 
          a_i: in std_logic_vector(N-1 downto 0);
         
          b_i: in std_logic_vector(N-1 downto 0);
  
      --output
          res_o: out std_logic_vector((2*N)-1 downto 0) --el resultado puede desbordar los N bits   
        
      );
     end component;


    ------------------------
    -- Signal definition

    signal a_i_tb:    std_logic_vector(3 downto  0):="0000";
    signal b_i_tb:    std_logic_vector(3 downto  0):= "0000";
    signal res_o_tb:  std_logic_vector(7 downto 0 );

    begin


        ---------------------------
        -- Test Secuence
        test_secuence: process 
        begin
            -----------------
            --input
            
             a_i_tb <= std_logic_vector(to_unsigned(0,4));
             b_i_tb <= std_logic_vector(to_unsigned(1,4));
            wait for 50 ns;
            -----------------
            -----------------
            --input
            
            a_i_tb <= std_logic_vector(to_unsigned(1,4));
            b_i_tb <= std_logic_vector(to_unsigned(1,4));
            wait for 50 ns;
            -----------------
            -----------------
            --input
        
            a_i_tb <= std_logic_vector(to_unsigned(2,4));
            b_i_tb <= std_logic_vector(to_unsigned(1,4));
            wait for 50 ns;
            -----------------
            -----------------

             
            a_i_tb <= std_logic_vector(to_unsigned(2,4));
            b_i_tb <= std_logic_vector(to_unsigned(3,4));
            wait for 50 ns;
            -----------------
            -----------------


             
            a_i_tb <= std_logic_vector(to_unsigned(4,4));
            b_i_tb <= std_logic_vector(to_unsigned(4,4));
            wait for 50 ns;
            -----------------
            -----------------
        end process;


        ----------------
        -- Connection

        DUT: multi
        port map (
            --input 
                a_i=> a_i_tb,              
                b_i =>b_i_tb,
                --output
                res_o => res_o_tb
            );
      
    end;