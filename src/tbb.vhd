library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tbb is 
generic (size : Integer := 32);	
end entity;

architecture tbbbb of tbb is 	 
  
  
	
	component adder is	  	
		generic (size : Integer := 32);
		port(firstParam  :in std_logic_vector(0 to size-1);  
			secondParam	  :in std_logic_vector(0 to size-1);  
	        sum :out  std_logic_vector(0 to size-1) );
			
	end component;

	signal resetT :  std_logic_vector(0 to 4):=(others=>'0');
	signal res: std_logic_vector(0 to size-1):=(others=>'1');
	signal insCodeT: std_logic_vector(0 to 4):=(others=>'0');
	begin	  	 	
				  
	   mapping :adder port map (resetT,insCodeT,res);	
	 
	   
		resetT<="00011";
	  -- clk_gen(clkT, 125.000E6);  -- 125.000 MHz clock
	   insCodeT<="00011";
	   
	 

end architecture;
