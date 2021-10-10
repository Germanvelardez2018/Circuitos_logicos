----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.10.2021 22:13:40
-- Design Name: 
-- Module Name: DEVICE - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DEVICE is
    Port ( clk_in : in STD_LOGIC);
end DEVICE;

architecture Behavioral of DEVICE is


-- componentes




COMPONENT vio_0
  PORT (
    clk : IN STD_LOGIC;
    probe_in0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    probe_out2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END COMPONENT;

component Shifter_reg 

  generic(
      N: Natural:= 8   -- NUMERO 
                        
  );
  port(
    --input 
        num_i     : in std_logic_vector(N-1 downto 0);
        control_i : in std_logic_vector(3 downto 0);   -- BMS es = 1 desplazamiento a derecha
      
       
        en_i: in std_logic; -- en_i = 0 pasa sin modificaciones, en_i = 1 , re realiza shifteo

    --output
        num_o: out std_logic_vector(N-1 downto 0) --el resultado puede desbordar los N bits   
      
    );
end component;






--signal

signal vnum_i, vnum_o: std_logic_vector(7 downto 0);
signal vcontrol: std_logic_vector (3 downto 0);
signal ven: std_logic_vector( 0 downto 0);



begin


vio_inst: vio_0
  port map(
    clk => clk_in,
    probe_in0  => vnum_o,
    probe_out0 =>vnum_i,
    probe_out1 => vcontrol,
    probe_out2 => ven
  );


reg:  Shifter_reg
port map(
         num_i     => vnum_i,
        control_i => vcontrol,
        num_o => vnum_o,
        en_i => ven(0)
);