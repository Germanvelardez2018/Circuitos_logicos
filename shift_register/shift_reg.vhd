library IEEE;
use IEEE.std_logic_1164.all;

entity shift_register is
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
end;

architecture shift_register_arq of shift_register is
    --definitions

    component ffd
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

    signal d: std_logic_vector(0 to N);



begin

	s_register: for i in 0  to N-1 generate

    ffd_inst: ffd 
    port map(
        D_i   => d(i),  
        ena_i => rena_i, 
        rst_i => rrst_i,
        clk_i => rclk_i, --ALL CLOCK CONNECT
        Q_o   => d(i+1)
        );
        end generate;
        d(0) <=rent_i;
        r_o <= d(N);   --salida
    
        

    

end;