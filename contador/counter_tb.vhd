
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Counter_tb is end;


architecture Counter_tb_arch of Counter_tb is 


    component Counter is 
        port(

        --input 
        clk,rst,init : in std_logic;
        init_value_i : in std_logic_vector(3 downto 0);

        --output
        count_o : out std_logic_vector(3 downto 0)
        );
    end component ;


    --signal definition


    signal clk_tb : std_logic :='0';
    signal init_tb : std_logic := '0';
    signal rst_tb : std_logic := '0';
    signal init_value_tb: std_logic_vector(3 downto 0):= "0000";
    signal count_tb : std_logic_vector(3 downto 0);

 begin

    ---secuence

     clk_tb <= not clk_tb after 50 ns;
     init_tb <= '1' after 60 ns, '0' after 70 ns;
     rst_tb <= '1' after 500 ns ; 
     
     DUT: Counter
        port map(
             clk =>  clk_tb ,
             init => init_tb ,
             init_value_i => init_value_tb,
             rst =>  rst_tb ,
             count_o => count_tb 
        );

end ;