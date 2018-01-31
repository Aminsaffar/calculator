library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;   
use ieee.numeric_std.all;	   

entity factorial is		
	 generic (size : Integer := 32);
  
	 port(numb :in std_logic_vector(0 to size-1);  
	
	 outPut :out std_logic_vector(0 downto size -1)
	 );
	
end factorial ;	

architecture factorial of factorial is   	

begin		 
	
	process(numb)
	variable max:integer:= to_integer(unsigned(numb));	  
	variable temp:integer:= 1;	  
	variable counter:integer:= 1;
	begin 
		while(counter< max)	loop
		temp:=temp*counter;	  
		counter:=counter+1;
		end loop; 				   --find power 
		
		 outPut<=std_logic_vector(to_unsigned(temp, outPut'length));--type casting
	end process;
	
end architecture; 
