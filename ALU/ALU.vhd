-- Name project: ALU   ( N bits)
-- Author: German Velardez
-- Date: 2/10/2021

-- Description: Recibe 2 operandos de N bits y resuleve operaciones aritmeticas y logicas.




---------------------------
-- Include
library IEEE;
use IEEE.std_logic_1164.all;


--------------------------

--Definicion de entidad


entity ALU is      -- ALU  ---> ALU basica de 8 bits

  generic(
      N: natural:= 8
  );
  port(
    --input 
        data_A:          in std_logic_vector(N-1 downto 0);     -- NUMERO A
        data_B:          in std_logic_vector(N-1 downto 0);     -- NUMERO B 
        control_in:      in std_logic_vector(7 downto 0); -- Habilitacion, or, and y xor                            --  acarreo de entrada
       
    --output
        data_out:  out std_logic_vector(N-1 downto 0)  ;    --  nota el resultado puede desbordar los N bits   
        res_overflow: out std_logic
    );
end ALU;


--------------------------
-- Arquitectura


architecture ALU_arch of ALU is

--definicion de entidades a utilizar







---------------------------------
-- Buffer tristado, para unir dos salida (mutuamente excluyentes) en el resultado
component Buffer_tristate is 

  generic(
      N: natural:= 8
  );
  port(
    --input 
        data_i: in std_logic_vector(N-1 downto 0);      
       
        en_i: in std_logic;                      --  en = 1 ut => data , en = 0 data_o => ALTA impedancia 

    --output
        data_o: out std_logic_vector(N-1 downto 0)      --  el resultado puede desbordar los N bits   
      
    );
end component;






--------------------------
-- Buffer_select
-- Descripcion: Modulo para gestionar las entradas de 8 bits
component Buffer_select is 

  generic(
      N: natural:= 8
  );
  port(
    --input 
        num_i: in std_logic_vector(N-1 downto 0);
       
        en_i: in std_logic_vector( 1 downto 0); -- 4 opciones

    --output
        num_o: out std_logic_vector(N-1 downto 0) --el resultado puede desbordar los N bits   
      
    );
end component;
-------------------------
----------------------------------------------------------------------------------------------
--------------------------
-- ALU_SUMADOR
-- Descripcion: SUMADOR DE N BITS con carry de entrada para restas y carry de salida para overflow
component ALU_SUMADOR is      -- ALU_SUMADOR  ---> Alu  bloque aritmetico

  generic(
      N: natural:= 8
  );
  port(
    --input 
        data_A:   in std_logic_vector(N-1 downto 0);     -- NUMERO A
        data_B:   in std_logic_vector(N-1 downto 0);     -- NUMERO B 
        c_i:      in std_logic;                             --  acarreo de entrada
       
    --output
        data_o:  out std_logic_vector(N-1 downto 0);      --  nota el resultado puede desbordar los N bits   
        c_o:     out std_logic                            -- c_o= 1 desbordo resultado
    );
end component;
---------------------------
------------------------------------------------------------------------------------------------
------------------------
-- ALU LOGICO
-- Descripcion: BLOQUE PARA REALIZAR FUNCIONES LOGICAS CON 2 OPERANDOS DE N BITS
component ALU_LOGICO is      -- ALU_LOGICO  ---> Alu  bloque aritmetico

  generic(
      N: natural:= 8
  );
  port(
    --input 
        data_A:       in std_logic_vector(N-1 downto 0);     -- NUMERO A
        data_B:       in std_logic_vector(N-1 downto 0);     -- NUMERO B 
        control_i:    in std_logic_vector(1 downto 0); -- Habilitacion, or, and y xor                            --  acarreo de entrada
       
    --output
        data_o:  out std_logic_vector(N-1 downto 0)      --  nota el resultado puede desbordar los N bits   
       
    );
end component;





---------------------------
--signals
 
signal c_in_sum : std_logic;

signal EN_tristate_1_aritmetic:        std_logic;
signal EN_tristate_2_logic:    std_logic;
signal control_logic_function: std_logic_vector(1 downto 0);
signal control_buffer_1:       std_logic_vector(1 downto 0);
signal control_buffer_2:       std_logic_vector(1 downto 0);





signal result_ari: std_logic_vector(N-1 downto 0 ); 
signal result_log: std_logic_vector(N-1 downto 0 ); 


signal ALU_INPUT_1 : std_logic_vector(N-1 downto 0 );   -- entrada de numero A a sumador
signal ALU_INPUT_2 : std_logic_vector(N-1 downto 0 );   -- entrada de numero B a sumador

signal AR_1 : std_logic_vector(N-1 downto 0 );   -- entrada de numero A a sumador
signal AR_2 : std_logic_vector(N-1 downto 0 );   -- entrada de numero B a sumador
signal AL_1 : std_logic_vector(N-1 downto 0 );   -- entrada de numero A a flogica
signal AL_2 : std_logic_vector(N-1 downto 0 );   -- entrada de numero B a flogica
signal result:   std_logic_vector(N-1 downto 0 );   

 -------inicio las instanciaciones  
begin


       
       


        B1: Buffer_select    -- buffer del numero A
        port map(
           
            
              --input 
                  num_i =>data_A,   --numero A a buffer1(B1)
                  en_i => control_buffer_1,
                 
              --output
                  num_o =>ALU_INPUT_1 
                      
              
        );


        B2: Buffer_select   --buffer del numero B
        port map(
           
            
              --input 
                  num_i=> data_B, -- numero B a buffer2 (B2)
                  en_i => control_buffer_2,
              --output
                 
                  num_o =>ALU_INPUT_2
              
        );



        ARITMETICA: ALU_SUMADOR
        port map
        (
            
            
              --input 
                  data_A =>  ALU_INPUT_1 ,   -- NUMERO A
                  data_B =>  ALU_INPUT_2 ,    -- NUMERO B 
                  c_i    => c_in_sum ,                  --  acarreo de entrada
                 
              --output
                  data_o => result_ari ,        
                  c_o    => res_overflow
              
        );
    
            LOGICA: ALU_LOGICO
            port map(
            
                --input 
                    data_A =>    ALU_INPUT_1  ,   -- NUMERO A
                    data_B =>    ALU_INPUT_2  ,   -- NUMERO B 
                    control_i => control_logic_function,  --ELIJO LA FUNCION LOGICA A EJECUTAR
                      
                    
                --output
                    data_o => result_log     --  nota el resultado puede desbordar los N bits   
                
                    );



            RESULTADO_ARITMETICO:  Buffer_tristate    -- buffer 1 tristate


            port map(
            --input 
    
    
                data_i =>result_ari,     
                
                en_i =>  EN_tristate_1_aritmetic,                       --  en = 1 data_o => data , en = 0 data_o => ALTA impedancia 
    
            --output
                data_o => result    -- resultado aritmetico   
                
            );
    
            RESULTADO_FLOGICO:  Buffer_tristate    --buffer 2 tristate
    
    
            port map(
            --input 
    
    
                data_i =>result_log,     
                en_i => EN_tristate_2_logic,
                                   --  en = 1 data_o => data , en = 0 data_o => ALTA impedancia 
    
            --output
                data_o => result    --  resultado de funcion logica   
                
            );

            --finalizando
          
          
        -- control_in
        --        7                            6             5              4                3                 2                 1             0
        -- |  btristate1/not btristate2   |  carri_in   | f_log(1)    |  f_log(0)   |  buffer_1(1)   |  buffer_1(0)   |  buffer_2(1)   |  buffer_2(0)   |
          

         --BIT 7: manejo de tristate buffers
          EN_tristate_1_aritmetic   <=  control_in(7);    -- PASA RESULTADO ARITMETICO
          EN_tristate_2_logic       <=  not control_in(7);        -- PASA RESULTADO LOGICO
        

        -- BIT6: bit de acarreo de entrada en sumado. Necesario para realizar A-B
          c_in_sum <= control_in(6);  -- envia el bit de acarreo para sumar NUMA - NUMB

          -- BIT 6/4 selector de funcion logica a utilizar

          control_logic_function(1) <= control_in(5);
          control_logic_function(0) <= control_in(4);

          -- bit 3/2 buffer_1 selector
          control_buffer_1(1) <= control_in(3);
          control_buffer_1(0) <= control_in(2);
          -- bit 1/0 buffer_2 selector . si buffer_2 = "10", se complementa B. Necesario para A - B
          control_buffer_2(1) <= control_in(1);
          control_buffer_2(0) <= control_in(0);
          
       
         
          
          
          data_out <= result;    --envio resultados de AR y AL a salida
          

end;