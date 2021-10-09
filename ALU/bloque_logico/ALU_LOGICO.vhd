-- Name project: ALU.Funciones logicas N bits   ( N bits)
-- Author: German Velardez
-- Date: 2/10/2021

-- Description: RESUELVE funciones logicas entre 2 numeros data_A , data_B. 


---------------------------
-- Include
library IEEE;
use IEEE.std_logic_1164.all;


--------------------------
--Entity definition

entity ALU_LOGICO is      -- ALU_LOGICO  ---> Alu  bloque aritmetico

  generic(
      N: natural:= 8
  );
  port(
    --input 
        data_A:   in std_logic_vector(N-1 downto 0);     -- NUMERO A
        data_B:   in std_logic_vector(N-1 downto 0);     -- NUMERO B 
        control_i:      in std_logic_vector(1 downto 0); -- Habilitacion, or, and y xor                            --  acarreo de entrada
       
    --output
        data_o:  out std_logic_vector(N-1 downto 0);      --  nota el resultado puede desbordar los N bits   
       
    );
end ALU_LOGICO;



---------------------------
-- Arquitectura 


architecture ALU_LOGICO_arch of ALU_LOGICO is

        -- Equivalent MUX using a case statement
        process(control_i,data_A,data_B) is
            begin
        
                case en_i is
                    when "00" =>

                        data_o <= (others=>'0'); ;                 -- paso clear
                    when "01" =>

                        AND_loop : for i in 0 to (N-1) loop        --  data_A AND data_B
                        data_o(i) <= data_A(i) and data_B(i) ;
                        end loop AND_loop;


                    when "10" =>
                        OR_loop : for i in 0 to (N-1) loop        --  data_A OR data_B
                        data_o(i) <= data_A(i) or data_B(i) ;
                        end loop OR_loop;


                    when "11" =>                
                        XOR_loop : for i in 0 to (N-1) loop        --  data_A XOR data_B
                        data_o(i) <= data_A(i) XOR data_B(i) ;
                        end loop XOR_loop;
              -- SALIDA FULL

                    when others => -- 'U', 'X', '-', etc.
                        data_o <= (others => '0');              -- CONDICIONES INDEFINIDAS . Resultado cero

                end case;
        
        end process;



       



end;