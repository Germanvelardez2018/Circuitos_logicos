-- Name project: Test bench: Full Adder  ( N bits)
-- Author: German Velardez
-- Date: 2/10/2021


---------------------------
-- Include
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


---------------------------
-- Entity definition

entity fadd_nbits_tb is end;





-----------------------------
-- Architecture: Full Adder for N bits test bench


architecture  fadd_nbits_tb_arch of fadd_nbits_tb is


  component Full_adder_N is 

  generic(
      N: natural:= 4
  );
  port(
    --input 
        num_a: in std_logic_vector(N-1 downto 0);
        num_b: in std_logic_vector(N-1 downto 0);
        carry_in: in std_logic;

    --output
        num_o: out std_logic_vector(N-1 downto 0);
        carry_out: out std_logic
    );
   end component;

--signal definitions

    signal num_a_tb : std_logic_vector(3 downto 0):= "0000";
    signal num_b_tb : std_logic_vector(3 downto 0):= "0000";
    signal carry_y_tb: std_logic :='0';
    signal num_res_tb : std_logic_vector(3 downto 0):= "0000";
    signal carry_o_tb : std_logic :='0';
   
  begin
    -- test secuence  
    test_secuence : process

        begin
            ---------------------------
            -- inputs
             num_a_tb <= std_logic_vector(to_unsigned(1,4));
             num_b_tb <= std_logic_vector(to_unsigned(0,4));
             carry_y_tb <='0';

             wait for 20 ns;
             
             ---------------------------
             ---------------------------
            -- inputs
            num_a_tb <= std_logic_vector(to_unsigned(0,4));
            num_b_tb <= std_logic_vector(to_unsigned(1,4));
            carry_y_tb <='1';

            wait for 20 ns;
            
            ---------------------------
            ---------------------------
            -- inputs
            num_a_tb <= std_logic_vector(to_unsigned(1,4));
            num_b_tb <= std_logic_vector(to_unsigned(0,4));
            carry_y_tb <='0';

            wait for 20 ns;
            
            ---------------------------
            ---------------------------
            -- inputs
            num_a_tb <= std_logic_vector(to_unsigned(1,4));
            num_b_tb <= std_logic_vector(to_unsigned(0,4));
            carry_y_tb <='1';

            wait for 20 ns;
            
            ---------------------------
            ---------------------------
            -- inputs
            num_a_tb <= std_logic_vector(to_unsigned(1,4));
            num_b_tb <= std_logic_vector(to_unsigned(1,4));
            carry_y_tb <='0';

            wait for 20 ns;
            
            ---------------------------
            ---------------------------
            -- inputs
            num_a_tb <= std_logic_vector(to_unsigned(1,4));
            num_b_tb <= std_logic_vector(to_unsigned(1,4));
            carry_y_tb <='1';

            wait for 20 ns;
            
            ---------------------------
            ---------------------------
            -- inputs
            num_a_tb <= std_logic_vector(to_unsigned(2,4));
            num_b_tb <= std_logic_vector(to_unsigned(1,4));
            carry_y_tb <='0';

            wait for 20 ns;
            
           
           

        end process;
    
    DUT: Full_adder_N


    port  map(
        --input 
        num_a =>num_a_tb,
        num_b =>num_b_tb,
        carry_in => carry_y_tb,

    --output
        num_o => num_res_tb,
        carry_out => carry_o_tb
    );

end;