-- Name project: Full Adder  ( N bits)
-- Author: German Velardez
-- Date: 2/10/2021


---------------------------
-- Include
library IEEE;
use IEEE.std_logic_1164.all;




--------------------------
--Entity definition

entity Full_adder_N is 

  generic(
      N: natural:= 4
  );
  port(
    --input 
        num_a: in std_logic_vector(N-1 downto 0);
        num_b: in std_logic_vector(N-1 downto 0);
        carry_in: in std_logic;

    --output
        num_o: out std_logic_vector(N downto 0); --el resultado puede desbordar los N bits   
        carry_out: out std_logic
    );
end Full_adder_N;


-------------------------
-- Architecture

architecture Full_adder_N_arch of Full_adder_N is

    --instances
    --Full adder one bit
    component Full_adder is 
    port(
      --input 
          bit1_i :  in std_logic;
          bit2_i:  in std_logic;
          carry_i: in std_logic;
  
      --output
          bit_o  : out std_logic;
          carry_o: out std_logic
      );
    end component;

    --signals

  

    signal wire_c:    std_logic_vector(0 to N);
  


begin

    


    s_adders: for i in 0 to N-1 generate

        bit_adder : Full_adder
        port map(
            --input 
            bit1_i  =>  num_a(i),    -- elementA to bit1
            bit2_i  =>  num_b(i),    -- elementB to bit2
            carry_i =>  wire_c(i),   
    
        --output
            bit_o   => num_o(i),

            carry_o => wire_c(i+1)         
            );
    end generate;

         wire_c(0)  <= carry_in;   -- connect the first carry in
         num_o(N)   <= wire_c(N);
         carry_out  <= wire_c(N);  -- connect the last carry out



end;