library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity regFile is
     generic (size : Integer := 32);
    port(data  :in std_logic_vector(0 to size-1);  
		 clk,rst,increment,decrement  :in std_logic;
        pre :buffer  std_logic_vector(0 to size-1) );
	
	
end entity;	   

architecture regFile of regFile is 	
constant zeros : std_logic_vector(0 to size-1):= (others => '0');
  begin
	 process(clk,rst)begin 
		if(rst='1')then
			pre<=(others=>'0');	 
		elsif(rising_edge(clk))then
			if(increment='1')then
			  pre<=pre+1;
			elsif(decrement='1'and pre/=zeros)then
			   pre<=pre-1;
			else
				pre<=(others=>'0');	
			end if;  
		end if; 
	end process;	 

end architecture regFile;