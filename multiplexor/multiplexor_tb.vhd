library IEEE;
use IEEE.std_logic_1164.all;

entity multiplexor_tb is
end;

architecture mul_tb_arch of multiplexor_tb is
    -- Component Declaration --


    component multiplexor is 
    port(

    -- inputs
    en_i:         in std_logic ;
    sel_i:        in std_logic_vector(1 downto 0);    -- enable
    entry_i :     in std_logic_vector( 3 downto 0);
  
   
    --outputs
     s_o: out std_logic

    );
    end component;





    -- Signals Definition --
    signal en_i_tb: std_logic := '0';
    signal sel_i_tb: std_logic_vector(1 downto 0) := "00";
    signal entry_i_tb: std_logic_vector(3 downto 0):="1111" ;
    signal s_o_tb: std_logic;
  

begin

    en_i_tb <= '1' after 100 ns;

    sel_i_tb(0) <= '1' after 150 ns, '0' after 300 ns;  --- 01
    sel_i_tb(1) <= '1' after 250 ns, '0' after 500 ns;  --- 11
  
   


    
    entry_i_tb <= "0000" after 800 ns, "1111" after 900 ns;


    DUT: multiplexor
        port map(
            en_i    => en_i_tb,
            sel_i   => sel_i_tb,
            entry_i => entry_i_tb,
            s_o => s_o_tb            
        );
end;