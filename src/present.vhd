library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity present is
	generic (size : Integer := 32);
	port(firstParam ,secondParam :in std_logic_vector(0 to size-1);
		sum :out  std_logic_vector(0 to size-1) );
	
	
end entity;	
architecture Behavioral of present is 	 
	component  divider is
		generic (size : Integer := 32);
		Port (dividend, divisor : in std_logic_vector(size-1 downto 0);
			RSTb, CLK : in std_logic;
			quotient, remainder : out std_logic_vector(size-1 downto 0));
	end component divider;	
	
	signal temp  :std_logic_vector(0 to size-1) ;  
	signal temp2  :std_logic_vector(0 to size-1) ;
	begin 	   
	 
			div: divider port map ( firstParam,secondParam,temp);
			
			div2:divider( secondParam,firstParam,temp2); 
	process (firstParam,secondParam)
		begin 
			
			
			if(firstParam> secondParam) then 
				
			else				  
				
			end if;	 
			
			sum<=not temp ;
		end process;
end architecture Behavioral;