-- Name project: ALU. Buffer tristate   ( N bits)
-- Author: German Velardez
-- Date: 2/10/2021

-- Description: buffer en= 1 habilita datos, en=0 alta impedancia


--nota: Necesario para poder unir varias salidas (mutuamente excluyentes en un solo buffer de resultado)

---------------------------
-- Include
library IEEE;
use IEEE.std_logic_1164.all;


--------------------------
--Entity definition

entity Buffer_tristate is 

  generic(
      N: natural:= 4
  );
  port(
    --input 
        data_i: in std_logic_vector(N-1 downto 0);      
       
        en_i: in std_logic;                      --  en = 1 data_o => data , en = 0 data_o => ALTA impedancia 

    --output
        data_o: out std_logic_vector(N-1 downto 0)      --  el resultado puede desbordar los N bits   
      
    );
end Buffer_tristate;



---------------------------
-- Architecture


architecture Buffer_tristate_arch of Buffer_tristate is




begin
        -- Equivalent MUX using a case statement
    process(en_i) is
            begin
        
                case en_i is
                    when '1' =>

                       data_o <=data_i;               -- PASO DIRECTO SIN MODIFICAR
                    when '0' =>

                       
                   data_o <= (others => 'Z');              -- CONDICIONES INDEFINIDAS


                    when others => -- 'U', 'X', '-', etc.
                       data_o <= (others => 'Z');              -- CONDICIONES INDEFINIDAS

            end case;
        
    end process;


end;