

library IEEE;
use IEEE.std_logic_1164.all;

entity sreg_tb is end;


architecture sreg_tb_arch of sreg_tb is

    component shift_register is
        generic(
         N: natural := 4
        );
        port(
            rena_i   : in std_logic;
            rclk_i	 : in std_logic;
            rrst_i	 : in std_logic;
            rent_i	 : in std_logic;	
            r_o :      out std_logic
        );
    end component;


    --signal definition



   signal  rena_tb   : std_logic := '0' ;
   signal  rclk_tb	 : std_logic := '0';
   signal  rrst_tb	 : std_logic := '1';
   signal  rent_tb	 : std_logic := '0';	
   signal  r_tb      : std_logic;  -- salida


  

   begin

    rena_tb    <= '1' after 50 ns;
    rclk_tb	   <= not rclk_tb after 50 ns;
    rrst_tb	   <= '0' after 200 ns;
    rent_tb	   <= '1' after 50 ns;

    DUT :shift_register
    port map(
        rena_i   => rena_tb,
        rclk_i	 => rclk_tb,
        rrst_i	 => rrst_tb,
        rent_i	 => rent_tb,
        r_o      => r_tb
    );



end;