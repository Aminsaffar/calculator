library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder is
	generic (size : Integer := 32);
	port(firstParam  :in std_logic_vector(size-1 downto 0);	
		secondParam	   :in std_logic_vector(size-1 downto 0);	
		sum :out  std_logic_vector(size-1 downto 0));	
end entity;		  


ARCHITECTURE adder OF adder IS 
	COMPONENT
		fullAdder  
		   port( A, B, Cin : in std_logic;
         sum, Cout : out std_logic);
	END COMPONENT;   
	SIGNAL  t:  std_logic_vector(size downto 0); 
BEGIN   
	t(0)   <= '0';
	--Cout <= t(size);  	
	
	FA: for i in 0 to size-1 generate  
		FA_i: fullAdder PORT MAP (t(i), firstParam(i), secondParam(i), sum(i), t(i+1));    
	end generate; 
END;