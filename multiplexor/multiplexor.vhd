--- Author: German Velardez
--- Date: 25/09/2021
--- Description: Its a multiplexor with N input and one output.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity multiplexor is 
    port(

    -- inputs
    en_i:         in std_logic ;
    sel_i:        in std_logic_vector(1 downto 0);    -- enable
    entry_i :     in std_logic_vector( 3 downto 0);
  
   
    --outputs
     s_o: out std_logic

    );
end;
--------------
 -- Architecture
-------------

architecture multiplexor_arch of multiplexor is

signal aux_s:  std_logic;

    begin

        with sel_i select

          

        aux_s  <=     entry_i(0)        when  "00" ,
                      entry_i(1)        when  "01" ,
                      entry_i(2)        when  "10" ,
                      entry_i(3)        when  "11" ,
        '0'                             when others;



        s_o <= aux_s when en_i = '1' else '0';

                      
    end architecture multiplexor_arch;
