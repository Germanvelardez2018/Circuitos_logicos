-- Nombre del elemento: ALU.Resgistro de desplazamiento   ( N bits)
-- Autor: German Velardez
-- Date: 2/10/2021

-- Descripcion: Registro de deslpazamiento de n bits

---------------------------
-- Include
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;



--------------------------
--Entity definition

entity Shifter_reg_tb is end;






-------------------------
-- Arquitectura
architecture Shifter_reg_tb_arch of Shifter_reg_tb is


-- definicion de componentes

  component Shifter_reg is
    generic(
        N: Natural:= 8   -- NUMERO 
                        
    );
    port(
    --input 
        num_i     : in std_logic_vector(N-1 downto 0);
        control_i : in std_logic_vector(3 downto 0);   -- BMS es = 1 desplazamiento a derecha        
        en_i: in std_logic; -- en_i = 0 pasa sin modificaciones, en_i = 1 , re realiza shifteo

    --output
        num_o: out std_logic_vector(N-1 downto 0) --el resultado puede desbordar los N bits   
    );
    end component;


-- signal 

signal  en_i_tb: std_logic  := '1';   
signal  num_i_tb:   std_logic_vector(7 downto 0) := "00000001";
signal  control_i_tb: std_logic_vector(3 downto 0) := "0000";

signal  num_o_tb:   std_logic_vector(7 downto 0);




begin



    -- control_i [4] = | right |b3 |b2 |b1 |
    --ejemplo:    0010  -- desplazamiento a izquierda 2 posiciones (010)


   ---------------------------
        -- Test Secuence
        test_secuence: process 
        begin
                -----------------
                --input
                num_i_tb <= "00000001";
                en_i_tb      <='1';
                control_i_tb <= "0000";   -- 2 desplazamiento a  izquierda
                wait for 50 ns;
                -----------------
                -----------------
                --input
                num_i_tb <= "00000001";
                control_i_tb <= "0001";   -- 2 desplazamiento a  izquierda
                wait for 50 ns;
                -----------------
                -----------------
                --input
                num_i_tb <= "00000001";            
                control_i_tb <= "0010";   -- 2 desplazamiento a  izquierda
                wait for 50 ns;
                -----------------
                -----------------

                --input
                num_i_tb <= "00000001";            
                control_i_tb <= "0011";   -- 2 desplazamiento a  izquierda
                wait for 50 ns;
                -----------------
                -----------------

                   
                --input 
                num_i_tb <= "10000000" ;          
                control_i_tb <= "1000";   -- 2 desplazamiento a  izquierda
                wait for 50 ns;
                -----------------
                -----------------

                --input 
                num_i_tb <= "10000000" ;          
                control_i_tb <= "1011";   -- 2 desplazamiento a  izquierda
                wait for 50 ns;
                -----------------
                -----------------

                --input            
                num_i_tb <= "10000000";
                control_i_tb <= "1100";   -- 2 desplazamiento a  izquierda
                wait for 50 ns;
                -----------------
                -----------------
                
                --input  
                num_i_tb <= "10000000" ;         
                control_i_tb <= "1101";   -- 2 desplazamiento a  izquierda
                wait for 50 ns;
                -----------------
                -----------------
               
        end process;



        -- Connection

        DUT: Shifter_reg
        port map (
            num_i      =>  num_i_tb,       -- 
            control_i  =>  control_i_tb,       --  -- BMS es = 1 desplazamiento a derecha        
            en_i =>     en_i_tb,    --  modificaciones, en_i = 1 , re realiza shifteo
    
        --output
            num_o =>        num_o_tb --  --el resultado puede desbordar los N bits   
              
            );





                    
                    
                  


end;