-- Name project: Test bench: Full Adder  ( 1 bit)
-- Author: German Velardez
-- Date: 2/10/2021


---------------------------
-- Include

library IEEE;
use IEEE.std_logic_1164.all;


--------------------------
-- Entity definition

entity Full_adder_tb is end;






---------------------------
-- Architecture: Full Adder tb


architecture Full_adder_tb_arch of Full_adder_tb is






    component Full_adder is 
    port(
      --input 
          bit1_i :  in std_logic;
          bit2_i: in std_logic;
          carry_i: in std_logic;
  
      --output
          bit_o  : out std_logic;
          carry_o: out std_logic
      );
    end component;
  

---------------------------
-- Signal

    --input

    
    signal bit1_tb :std_logic :='0';
    signal bit2_tb :std_logic :='0';
    signal carry_i_tb :std_logic :='0';


    --output
    signal bit_o_tb: std_logic;
    signal carry_o_tb :std_logic;

begin

---------------------------
-- Test Secuence
        test_secuence: process 
        begin
            -----------------
            --input
            bit1_tb     <='0';
            bit2_tb     <='0'; 
            carry_i_tb  <='0';
            wait for 50 ns;
            -----------------
            -----------------
            --input
            bit1_tb     <='0';
            bit2_tb     <='0'; 
            carry_i_tb  <='1';
            wait for 50 ns;
            -----------------
            -----------------
            --input
            bit1_tb     <='0';
            bit2_tb     <='1'; 
            carry_i_tb  <='0';
            wait for 50 ns;
            -----------------
            -----------------
            --input
            bit1_tb     <='0';
            bit2_tb     <='1'; 
            carry_i_tb  <='1';
            wait for 50 ns;
            -----------------
            -----------------
            --input
            bit1_tb     <='1';
            bit2_tb     <='0'; 
            carry_i_tb  <='0';
            wait for 50 ns;
            -----------------
            -----------------
            --input
            bit1_tb     <='1';
            bit2_tb     <='0'; 
            carry_i_tb  <='1';
            wait for 50 ns;
            -----------------
            -----------------
            --input
            bit1_tb     <='1';
            bit2_tb     <='1'; 
            carry_i_tb  <='0';
            wait for 50 ns;
            -----------------
            -----------------
            --input
            bit1_tb     <='1';
            bit2_tb     <='1'; 
            carry_i_tb  <='1';
            wait for 50 ns;
            -----------------
        end process;

    -----------------
    -- Connection
        DUT: Full_adder
        port map(
              --input 
          bit1_i    =>   bit1_tb,
          bit2_i    =>   bit2_tb, 
          carry_i   =>   carry_i_tb,
  
      --output
          bit_o     =>  bit_o_tb,
          carry_o   =>  carry_o_tb
        );

end;