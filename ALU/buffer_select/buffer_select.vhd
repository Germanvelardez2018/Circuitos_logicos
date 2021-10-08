-- Name project: ALU. Buffer select   ( N bits)
-- Author: German Velardez
-- Date: 2/10/2021

-- Description: Buffer para manipular los numeros que llegan a la ALU

---------------------------
-- Include
library IEEE;
use IEEE.std_logic_1164.all;




--------------------------
--Entity definition

entity Buffer_select is 

  generic(
      N: natural:= 4
  );
  port(
    --input 
        num_i: in std_logic_vector(N-1 downto 0);
       
        en_i: in std_logic_vector( 1 downto 0); -- 4 opciones

    --output
        num_o: out std_logic_vector(N-1 downto 0) --el resultado puede desbordar los N bits   
      
    );
end Buffer_select;


-------------------------
-- Architecture

 


architecture Buffer_select_arch of Buffer_select is

begin

   
    
        -- Equivalent MUX using a case statement
        process(en_i,num_i) is
            begin
        
                case en_i is
                    when "00" =>

                        num_o <= num_i;                     -- PASO DIRECTO SIN MODIFICAR
                    when "01" =>

                        neg_loop : for i in 0 to (N-1) loop  -- SE COMPLEMENTA EL DATO
                        num_o(i) <= not num_i(i) ;
                        end loop neg_loop;


                    when "10" =>
                        num_o <= (others=>'0');                   --SALIDA CLEAR

                    when "11" =>                
                        num_o <= (others=>'1');                   -- SALIDA FULL

                    when others => -- 'U', 'X', '-', etc.
                        num_o <= (others => 'X');              -- CONDICIONES INDEFINIDAS

                end case;
        
        end process;

end;