

library IEEE;
use IEEE.std_logic_1164.all;

entity ffd_tb is end;



architecture ffd_tb of ffd_tb is   


    component FFD is 
        port(
        --input 
            D_i :  in std_logic;
            ena_i: in std_logic;
            rst_i: in std_logic;
            clk_i: in std_logic;
        
        --output
            Q_o: out std_logic

        );
    end component;

     --signal definition

    --input 
    signal D_tb_i :   std_logic :='1';
    signal ena_tb_i:  std_logic :='0';
    signal rst_tb_i:  std_logic :='0';
    signal clk_tb_i:  std_logic :='0';
    

    --output
    signal Q_tb_o:  std_logic:='0';
begin
   

     --signal definition

    --input 
     D_tb_i   <='1' after 50 ns ;
     ena_tb_i <='1' after 50 ns;
     rst_tb_i <='1' after 120 ns, '0' after 500 ns;
     clk_tb_i <='1' after 50 ns, '0' after 100 ns, '1' after 150 ns, '0' after 200 ns, '1' after 250 ns, '0' after 300 ns;

    DUT: FFD
        port map(
            D_i => D_tb_i,
            ena_i => ena_tb_i,
            rst_i => rst_tb_i,
            clk_i => clk_tb_i,
            Q_o => Q_tb_o
        );

end ;
