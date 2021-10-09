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

entity ALU_LOGICO_tb is end;





-----------------------------
-- Architecture: Full Adder for N bits test bench


architecture  ALU_LOGICO_tb_arch of ALU_LOGICO_tb is

    --definicion de componentes
    component ALU_LOGICO is 

    generic(
        N: natural:= 8
    );
    port(
      --input 
          data_A:   in std_logic_vector(N-1 downto 0);     -- NUMERO A
          data_B:   in std_logic_vector(N-1 downto 0);     -- NUMERO B 
          control_i:      in std_logic_vector(1 downto 0); -- Habilitacion, or, and y xor                            --  acarreo de entrada
         
      --output
          data_o:  out std_logic_vector(N-1 downto 0)      --  nota el resultado puede desbordar los N bits   
         
      );
    end component;

-- definicion de signals

    signal data_a_tb : std_logic_vector(7 downto 0):= (others=>'0');
    signal data_b_tb : std_logic_vector(7 downto 0):=  (others=>'0');
    signal control_i_tb: std_logic_vector(1 downto 0) :="00";
    signal data_res_tb : std_logic_vector(7 downto 0):= (others=>'0');
   
   
  begin

    --  secuencia de pruebas 
    test_secuence : process

        begin
            ---------------------------
            -- inputs
            data_a_tb <= std_logic_vector(to_unsigned(2,8));
            data_b_tb <= std_logic_vector(to_unsigned(5,8));
             control_i_tb <="01";

             wait for 20 ns;
             
             ---------------------------
             ---------------------------
            -- inputs
           data_a_tb <= std_logic_vector(to_unsigned(16,8));
           data_b_tb <= std_logic_vector(to_unsigned(6,8));
            control_i_tb <="01";

            wait for 20 ns;
            
            ---------------------------
            ---------------------------
            -- inputs
           data_a_tb <= std_logic_vector(to_unsigned(8,8));
           data_b_tb <= std_logic_vector(to_unsigned(14,8));
            control_i_tb <="10";

            wait for 20 ns;
            
            ---------------------------
            ---------------------------
            -- inputs
           data_a_tb <= std_logic_vector(to_unsigned(10,8));
           data_b_tb <= std_logic_vector(to_unsigned(11,8));
            control_i_tb <="01";

            wait for 20 ns;
            
            ---------------------------
            ---------------------------
            -- inputs
           data_a_tb <= std_logic_vector(to_unsigned(10,8));
           data_b_tb <= std_logic_vector(to_unsigned(1,8));
            control_i_tb <="11";

            wait for 20 ns;
            
            ---------------------------
            ---------------------------
            -- inputs
           data_a_tb <= std_logic_vector(to_unsigned(21,8));
           data_b_tb <= std_logic_vector(to_unsigned(1,8));
            control_i_tb <="00";

            wait for 20 ns;
            
            ---------------------------
            ---------------------------
            -- inputs
           data_a_tb <= std_logic_vector(to_unsigned(2,8));
           data_b_tb <= std_logic_vector(to_unsigned(1,8));
            control_i_tb <="00";

            wait for 20 ns;
            
           
           

        end process;
    
    DUT: ALU_LOGICO


    port  map(
        --input 
       data_a =>data_a_tb,
       data_b =>data_b_tb,
    control_i  => control_i_tb,

    --output
        data_o =>data_res_tb
       
    );

end;