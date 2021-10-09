-- Name project: Test bench: ALU  ( N bits)
-- Author: German Velardez
-- Date: 2/10/2021


---------------------------
-- Include
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


---------------------------
-- Entity definition

entity ALU_tb is end;





-----------------------------
-- Architecture: Full Adder for N bits test bench


architecture  ALU_tb_arch of ALU_tb is

    --definicion de componentes
   
    component ALU is      -- ALU  ---> ALU basica de 8 bits

    generic(
        N: natural:= 8
    );
    port(
    --input 
        data_A:         in std_logic_vector(N-1 downto 0);     -- NUMERO A
        data_B:         in std_logic_vector(N-1 downto 0);     -- NUMERO B 
        control_in:      in std_logic_vector(7 downto 0); -- Habilitacion, or, and y xor                            --  acarreo de entrada
        
    --output
        data_out:  out std_logic_vector(N-1 downto 0)  ;    --  nota el resultado puede desbordar los N bits   
        res_overflow: out std_logic
    );
    end component;

    -- definicion de signals

        signal data_A_tb:       std_logic_vector(7 downto 0):= (others=>'0');     -- NUMERO A
        signal data_B_tb:       std_logic_vector(7 downto 0):= (others=>'0');     -- NUMERO B 
        signal control_in_tb:   std_logic_vector(7 downto 0):= "00100000";  

        --output
        signal data_res_tb:        std_logic_vector(7 downto 0);    --  nota el resultado puede desbordar los N bits   
        signal res_overflow_tb:  std_logic;

        -- opciones de control

        signal c_buffer_1: std_logic_vector(1 downto 0):= "00";  --buffer de numA
        signal c_buffer_2: std_logic_vector(1 downto 0):= "00";   --buffer de numB
        signal c_logic_function: std_logic_vector(1 downto 0):= "00"; --seleccion de funcion logica a realizar
        signal carri_in: std_logic :='0'; --habilita resultado logico
        signal en_result: std_logic :='1'; --habilita resultado aritmetico
        
        
    begin

    --  secuencia de pruebas 
    test_secuence : process

        begin
            ---------------------------
            -- inputs

            data_a_tb <= std_logic_vector(to_unsigned(6,8));
            data_b_tb <= std_logic_vector(to_unsigned(6,8));

            en_result <= '1'; -- pasa el resultado aritmetico
            carri_in <= '1' ; -- agrego un 1 de accarreo. Necesario para A - B
            c_logic_function <="00"; -- no interesa, esta bloqueado resultado logico
            c_buffer_1 <= "00"; -- pasa sin modificaciones
            c_buffer_1 <= "01"; -- se complementa NUMB
            control_in_tb <= en_result & carri_in & c_logic_function & c_buffer_1 & c_buffer_2;
            
        -- control_in
        --        7                            6             5              4                3                 2                 1             0
        -- |  btristate1/not btristate2   |  carri_in   | f_log(1)    |  f_log(0)   |  buffer_1(1)   |  buffer_1(0)   |  buffer_2(1)   |  buffer_2(0)   |
          --  control_in_tb <="11000001";   -- suma A- B

             wait for 20 ns;
             
             ---------------------------
             ---------------------------
            -- inputs
           data_a_tb <= std_logic_vector(to_unsigned(8,8));
           data_b_tb <= std_logic_vector(to_unsigned(6,8));
          -- control_in_tb <= en_result & carri_in & c_logic_function & c_buffer_1 & c_buffer_2;
         
            wait for 20 ns;
            
            ---------------------------
            ---------------------------
            -- inputs
           data_a_tb <= std_logic_vector(to_unsigned(15,8));
           data_b_tb <= std_logic_vector(to_unsigned(2,8));
           en_result <= '0'; -- pasa el resultado LOGICO
           carri_in <= '0' ; -- No agrego bit de accareo
           c_logic_function <="10"; -- 00 es clear (todo o) 01 AND 10 OR y 11 XOR
           c_buffer_1 <= "00"; -- pasa sin modificaciones
           c_buffer_1 <= "00"; -- se complementa NUMB
           control_in_tb <= en_result & carri_in & c_logic_function & c_buffer_1 & c_buffer_2;
            wait for 20 ns;
            
            ---------------------------
            ---------------------------
            -- inputs
           data_a_tb <= std_logic_vector(to_unsigned(16,8));
           data_b_tb <= std_logic_vector(to_unsigned(16,8));
        
          en_result <= '0'; -- pasa el resultado LOGICO
          carri_in <= '0' ; -- No agrego bit de accareo
          c_logic_function <="01"; -- 00 es clear (todo o) 01 AND 10 OR y 11 XOR
          c_buffer_1 <= "00"; -- pasa sin modificaciones
          c_buffer_1 <= "00"; -- se complementa NUMB
            wait for 20 ns;
            
            ---------------------------
            ---------------------------
            -- inputs
           data_a_tb <= std_logic_vector(to_unsigned(1,8));
           data_b_tb <= std_logic_vector(to_unsigned(1,8));
          -- control_in_tb <= en_result & carri_in & c_logic_function & c_buffer_1 & c_buffer_2;

            wait for 20 ns;
            
            ---------------------------
            ---------------------------
            -- inputs
           data_a_tb <= std_logic_vector(to_unsigned(1,8));
           data_b_tb <= std_logic_vector(to_unsigned(1,8));
          -- control_in_tb <= en_result & carri_in & c_logic_function & c_buffer_1 & c_buffer_2;

            wait for 20 ns;
            
            ---------------------------
            ---------------------------
            -- inputs
           data_a_tb <= std_logic_vector(to_unsigned(2,8));
           data_b_tb <= std_logic_vector(to_unsigned(1,8));
          -- control_in_tb <= en_result & carri_in & c_logic_function & c_buffer_1 & c_buffer_2;

            wait for 20 ns;
            
           
           

        end process;
    
    DUT: ALU


    port  map(
        --input 
       data_a         => data_a_tb,
       data_b         => data_b_tb,
       control_in     => control_in_tb,

    --output
       data_out         => data_res_tb,
       res_overflow   => res_overflow_tb
    );

end;