library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;   
use ieee.numeric_std.all;	   

entity power is		
	 generic (size : Integer := 32);
  
	 port(numb :in std_logic_vector(0 to size-1);  
	 pow  :in std_logic_vector(0 to size-1); 
	 outPut :out std_logic_vector(0 downto size -1)
	 );
	
end power ;	

architecture power of power is   	

begin		 
	
	process(numb, pow )
	variable max:integer:= to_integer(unsigned(pow));	  
	variable temp:integer:= 1;	  
	variable counter:integer:= 1;
	begin 
		while(counter< max)	loop
		temp:=temp*temp;	  
		counter:=counter+1;
		end loop; 				   --find power 
		
		 outPut<=std_logic_vector(to_unsigned(temp, outPut'length));--type casting
	end process;
	
end architecture; 
