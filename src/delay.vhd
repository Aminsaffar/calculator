library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity delay is
    
    port(data  :in std_logic_vector(0 to 4);  
		 clk :in std_logic;
        pre :buffer  std_logic_vector(0 to 4) );  	
end entity;	   

architecture regFile of delay is 	

  begin
	 process(clk)begin 			 
		if(rising_edge(clk))then 
				pre<=data;	
			end if;    
	
	end process;	 

end architecture regFile;