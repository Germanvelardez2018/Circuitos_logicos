-- Name project: ALU. Sumador N bits   ( N bits)
-- Author: German Velardez
-- Date: 2/10/2021

-- Description: RESUELVE numA + numB. Con soporte para numA - numB


--nota: Necesario para poder unir varias salidas (mutuamente excluyentes en un solo buffer de resultado)

---------------------------
-- Include
library IEEE;
use IEEE.std_logic_1164.all;


--------------------------
--Entity definition

entity ALU_SUMADOR is      -- ALU_SUMADOR  ---> Alu  bloque aritmetico

  generic(
      N: natural:= 8
  );
  port(
    --input 
        data_A:   in std_logic_vector(N-1 downto 0);     -- NUMERO A
        data_B:   in std_logic_vector(N-1 downto 0);     -- NUMERO B 
        c_i:      in std_logic;                             --  acarreo de entrada
       
    --output
        data_o:  out std_logic_vector(N downto 0);      --  nota el resultado puede desbordar los N bits   
        c_o:     out std_logic                            -- c_o= 1 desbordo resultado
    );
end ALU_SUMADOR;



---------------------------
-- Arquitectura 


architecture ALU_SUMADOR_arch of ALU_SUMADOR is

-- definicion de componentes

        -- sumador completo un bit
        component sumador_1b is 
        port(
            --entradas
            c_i: in std_logic;
            a_i: in std_logic;
            b_i: in std_logic;

            --salidas
            s_o: out std_logic;
            c_o: out std_logic 
        );
        end component;



        --signals
 

        signal wire_c:    std_logic_vector(0 to N);
       


        begin
        
            s_adders: for i in 0 to N-1 generate
        
                bit_adder : sumador_1b
                port map(
                    --input 
                    a_i  =>  data_a(i),    -- DATOS A conectados a bitA
                    b_i  =>  data_b(i),    -- DATOS B conectados a bitB
                    c_i =>  wire_c(i),   
            
                --output
                    s_o   => data_o(i),  -- bit resultado conectado a DATA O
        
                    c_o => wire_c(i+1)         
                    );
            end generate;
        
                 wire_c(0) <= c_i;   
                 data_o(N) <= wire_c(N);
                 c_o       <= wire_c(N);

end;