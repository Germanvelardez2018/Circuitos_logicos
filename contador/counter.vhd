--- German Velardez
--- Its a counter from 0 to 16


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

    entity Counter is 
        port(

        --input 
        clk,rst,init : in std_logic;
        init_value_i : in std_logic_vector(3 downto 0);

        --output
        count_o : out std_logic_vector(3 downto 0)
        );
    end;



-----------------------
 -- Architecture: Counter from 0 to 16
 ----------------------

 architecture counter_arch of Counter is



    begin
        process(clk)
        variable counter_i: integer range 0 to 16;  --int(init_value_i)
        begin
            if rising_edge(clk) then
                if (init = '1') then
                    counter_i := to_integer(unsigned(init_value_i));
                else
                    counter_i := counter_i + 1;
                    if( counter_i = 16) then
                        counter_i := 0;          --reset counter
                    end if;
                end if;
            end if;
                    count_o <= std_logic_vector(to_unsigned(counter_i,4));
        end process;

    end architecture;