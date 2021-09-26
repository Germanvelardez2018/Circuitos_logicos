

library IEEE;
use IEEE.std_logic_1164.all;

entity FFD is 
  port(
    --input 
        D_i :  in std_logic;
        ena_i: in std_logic;
        rst_i: in std_logic;
        clk_i: in std_logic;
    
    --output
        Q_o: out std_logic

    );
end;








--------------
 -- Architecture: FFS Async
-------------

architecture FFD_arch of FFD is 



begin

    process(clk_i,rst_i)                             ---init process
        begin
            if rst_i = '1' then                      ---if
                Q_o <='0';
            elsif  rising_edge(clk_i) then             ---else
                if ena_i = '1' then    
                    Q_o <= D_i;
                end if;
            end if;
            
        end process;                                 --- end process


end architecture FFD_arch;

--------------
 -- Architecture: FFS Async
-------------

architecture FFD_Async_arch of FFD is 

begin

    process(clk_i)                             ---init process
        begin
            if rising_edge(clk_i) then
                if rst_i = '1'    then                      ---if
                Q_o <='0';       
            elsif  ena_i = '1' then    
                    Q_o <= D_i;
                end if;
            end if;
            
        end process;                                 --- end process


end architecture FFD_Async_arch;



---the last architectura is for defautl