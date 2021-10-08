-- Name project: ALU. Buffer result   ( M entradas con N bits) 
-- Author: German Velardez
-- Date: 2/10/2021

-- Description: Buffer para gestionar los resultados

---------------------------
-- Include
library IEEE;
use IEEE.std_logic_1164.all;




--------------------------
--Entity definition

entity Buffer_result is 

  generic(
     
      N: natural:= 4 -- numero de bits de cada resultado
  );
  port(
    --input 

        result_sum : in std_logic_vector(N-1 downto 0);
        result_log: in std_logic_vector(N-1 downto 0);
        en_i : in std_logic;
     

    --output
        num_result_o: out std_logic_vector(N-1 downto 0) --el resultado puede desbordar los N bits   
      
    );
end Buffer_result;


-------------------------
-- Architecture

 


architecture Buffer_result_arch of Buffer_result is

begin

   


    


    
        -- Equivalent MUX using a case statement
        buffering :process(en_i) is
            
            case en_i is
                when '1' =>
                             buffer_loop : for i in 0 to (N-1) loop  -- SE INTEGRAN AMBOS RESULTADOS
                                                          
                            num_result_o(i) <= (result_log(i)  or  result_sum(i) );
                            end loop buffer_loop;
        
                   
                when others => -- 'U', 'X', '-', etc.
                             num_result_o <= (others => '0');              -- CONDICIONES INDEFINIDAS
        
            end case;
          
        
        end process;

end;