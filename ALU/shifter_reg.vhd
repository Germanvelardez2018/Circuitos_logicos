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

entity Shifter_reg is 

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
end Shifter_reg;


-------------------------
-- Architecture

 


architecture Shifter_reg_arch of Shifter_reg is


-- signal 

   
signal buffer_o: std_logic_vector(7 downto 0);



begin

   
    
        
        process(en_i,control_i,num_i) is
            

        -- control_i [4] = | right |b3 |b2 |b1 |
        --ejemplo:    0010  -- desplazamiento a izquierda 2 posiciones (010)

            begin

                if en_i = '1' then
        
                    case ( control_i) is
                        --  corrimientos a la derecha
                        when "1000" =>
                            num_o <=      std_logic_vector(unsigned(num_i) SRL 1);                    -- PASO DIRECTO SIN MODIFICAR
                        when "1001" =>
                            num_o <=     std_logic_vector(unsigned(num_i) SRL 2);
                        when "1010" =>
                            num_o <=     std_logic_vector(unsigned(num_i) SRL 3);
                        when "1011" =>
                            num_o <=     std_logic_vector(unsigned(num_i) SRL 4);
                        when "1100" =>
                            num_o <=     std_logic_vector(unsigned(num_i) SRL 5);
                        when "1101" =>
                            num_o <=     std_logic_vector(unsigned(num_i) SRL 6);
                        when "1110" =>
                            num_o <=     std_logic_vector(unsigned(num_i) SRL 7);
                        when "1111" =>
                            num_o <=     std_logic_vector(unsigned(num_i) SRL 8);

                        -- corrimiento a la izquierda
                        when "0000" =>
                            num_o <=   std_logic_vector(unsigned(num_i) SLL 1);                     -- PASO DIRECTO SIN MODIFICAR
                        when "0001" =>
                            num_o <=   std_logic_vector(unsigned(num_i) SLL 2);
                        when "0010" =>
                            num_o <=   std_logic_vector(unsigned(num_i) SLL 3);
                        when "0011" =>
                            num_o <=   std_logic_vector(unsigned(num_i) SLL 4);
                        when "0100" =>
                            num_o <=   std_logic_vector(unsigned(num_i) SLL 5);
                        when "0101" =>
                            num_o <=   std_logic_vector(unsigned(num_i) SLL 6);
                        when "0110" =>
                            num_o <=   std_logic_vector(unsigned(num_i) SLL 7);
                        when "0111" =>
                            num_o <=   std_logic_vector(unsigned(num_i) SLL 8);
                
                        -- opciones no definidas: pasa sin modificaciones
                        when others => -- 'U', 'X', '-', etc.
                            num_o <= num_i;              -- CONDICIONES INDEFINIDAS

                    end case;
                       
                else 
                num_o <=  num_i ;  -- si esta deshabilitado paso directo el numero

                end if;

                

                 
        
        end process;





                    
                    
                  


end;