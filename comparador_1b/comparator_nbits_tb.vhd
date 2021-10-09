-- Name project: tesbench: comparator  ( N bit)
-- Author: German Velardez
-- Date: 2/10/2021


---------------------------
-- Include
library IEEE;
use IEEE.std_logic_1164.all;



--------------------------
-- Entity definition

entity comparator_nbits_tb is end;



---------------------------
-- Architecture: comparator 1 bit


architecture comparator_nbits_tb_arch of comparator_nbits_tb is


    component comparator_nbits
    generic(
            N: NATURAL:=4
            );
        port ( 

        -- input
                num_a: in std_logic_vector(N-1 downto 0);
                num_b: in std_logic_vector( N-1 downto 0);
                en_i: in std_logic;                       --habilita con 1
        --output
                a_o: out std_logic;
                b_o: out std_logic;
                eq_o: out std_logic
        );
    end component;

-- definicion de señales

        signal  num_a_tb : std_logic_vector(3 downto 0) :="0000";
        signal  num_b_tb: std_logic_vector(3 downto 0) :="0000";
        signal en_i_tb , a_o_tb, b_o_tb, eq_o_tb : std_logic;
       

begin


        ---------------------------
        -- Test Secuence
        test_secuence: process 
        begin
            -----------------
            --input
        num_a_tb  <="1000";
        num_b_tb  <="0010";
        en_i_tb      <='1';
            wait for 50 ns;
            -----------------
            -----------------
            --input

        num_a_tb <="1000";
        num_b_tb <="0010";    
        en_i_tb      <='0';
            wait for 50 ns;
            -----------------
            -----------------
            --input
        num_a_tb  <="1010";
        num_b_tb  <="1010";
        en_i_tb    <='1';
            wait for 50 ns;
           


        end process;

------------------------
--Connection
        DUT:  comparator_nbits


        port map(

                -- input
                num_a => num_a_tb,
                num_b => num_b_tb,
                en_i  => en_i_tb,                       --habilita con 1
                --output
                a_o     => a_o_tb,
                b_o     => b_o_tb,
                eq_o    => eq_o_tb
        );

END;