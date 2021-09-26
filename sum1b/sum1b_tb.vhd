library IEEE;
use IEEE.std_logic_1164.all;

entity sum1b_tb is
end;

architecture sum1b_tb_arch of sum1b_tb is
    -- Component Declaration --
    component sum1b is
        port(
            ci_i: in std_logic;
            a_i: in std_logic;
            b_i: in std_logic;
            s_o: out std_logic;
            co_o: out std_logic 
        );
    end component;

    -- Signals Definition --
    signal a_tb: std_logic := '0';
    signal b_tb: std_logic := '0';
    signal ci_tb: std_logic := '0';
    signal s_tb: std_logic;
    signal co_tb: std_logic;

begin

    a_tb <= '1' after 600 ns;
    b_tb <= '1' after 300 ns;
    ci_tb <= '1' after 150 ns;

    DUT: sum1b
        port map(
            a_i => a_tb,
            b_i => b_tb,
            ci_i => ci_tb,
            s_o => s_tb,
            co_o => co_tb
        );
end;