library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;   
use ieee.numeric_std.all;	   

entity mode is		
	 generic (size : Integer := 32);
  
	 port(numb :in std_logic_vector(0 to size-1);  
	 divider  :in std_logic_vector(0 to size-1); 
	 outPut :out std_logic_vector(0 downto size -1)
	 );
	
end mode ;	

architecture mode of mode is   	

begin		 
	
	process(numb, divider )
	variable temp:integer:= to_integer(unsigned(numb));	  
	variable div:integer:= to_integer(unsigned(divider));
	begin 
		while(div< temp)	loop
		temp:=temp-div;
		end loop; 				   --find mod  
		
		 outPut<=std_logic_vector(to_unsigned(temp, outPut'length));--type casting
	end process;
	
end architecture; 
