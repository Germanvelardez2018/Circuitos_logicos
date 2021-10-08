-- Name project: Test bench: ALU_SUMADOR_N_BITS  ( N bits)
-- Author: German Velardez
-- Date: 2/10/2021


---------------------------
-- Include
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


---------------------------
-- Entity definition

entity ALU_SUMADOR_tb is end;





-----------------------------
-- Architecture: Full Adder for N bits test bench


architecture  ALU_SUMADOR_tb_arch of ALU_SUMADOR_tb is

    --definicion de componentes
    component ALU_SUMADOR is 

    generic(
        N: natural:= 8
    );
    port(
        --input 
            data_a: in std_logic_vector(N-1 downto 0);
            data_b: in std_logic_vector(N-1 downto 0);
            c_i: in std_logic;
        

        --output
            data_o: out std_logic_vector(N downto 0);
            c_o: out std_logic
        );
    end component;

-- definicion de signals

    signal data_a_tb : std_logic_vector(7 downto 0):= (others=>'0');
    signal data_b_tb : std_logic_vector(7 downto 0):=  (others=>'0');
    signal c_y_tb: std_logic :='0';
    signal data_res_tb : std_logic_vector(8 downto 0):= (others=>'0');
    signal c_o_tb : std_logic :='0';
   
  begin

    --  secuencia de pruebas 
    test_secuence : process

        begin
            ---------------------------
            -- inputs
            data_a_tb <= std_logic_vector(to_unsigned(5,8));
            data_b_tb <= std_logic_vector(to_unsigned(5,8));
             c_y_tb <='0';

             wait for 20 ns;
             
             ---------------------------
             ---------------------------
            -- inputs
           data_a_tb <= std_logic_vector(to_unsigned(6,8));
           data_b_tb <= std_logic_vector(to_unsigned(6,8));
            c_y_tb <='1';

            wait for 20 ns;
            
            ---------------------------
            ---------------------------
            -- inputs
           data_a_tb <= std_logic_vector(to_unsigned(10,8));
           data_b_tb <= std_logic_vector(to_unsigned(10,8));
            c_y_tb <='0';

            wait for 20 ns;
            
            ---------------------------
            ---------------------------
            -- inputs
           data_a_tb <= std_logic_vector(to_unsigned(16,8));
           data_b_tb <= std_logic_vector(to_unsigned(16,8));
            c_y_tb <='1';

            wait for 20 ns;
            
            ---------------------------
            ---------------------------
            -- inputs
           data_a_tb <= std_logic_vector(to_unsigned(1,8));
           data_b_tb <= std_logic_vector(to_unsigned(1,8));
            c_y_tb <='0';

            wait for 20 ns;
            
            ---------------------------
            ---------------------------
            -- inputs
           data_a_tb <= std_logic_vector(to_unsigned(1,8));
           data_b_tb <= std_logic_vector(to_unsigned(1,8));
            c_y_tb <='1';

            wait for 20 ns;
            
            ---------------------------
            ---------------------------
            -- inputs
           data_a_tb <= std_logic_vector(to_unsigned(2,8));
           data_b_tb <= std_logic_vector(to_unsigned(1,8));
            c_y_tb <='0';

            wait for 20 ns;
            
           
           

        end process;
    
    DUT: ALU_SUMADOR


    port  map(
        --input 
       data_a =>data_a_tb,
       data_b =>data_b_tb,
        c_i  => c_y_tb,

    --output
       data_o =>data_res_tb,
        c_o   => c_o_tb
    );

end;