library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity subtractor is
	generic (size : Integer := 32);
	port(firstParam  :in std_logic_vector(size-1 downto 0);	
		secondParam	   :in std_logic_vector(size-1 downto 0);	
		sum :out  std_logic_vector(size-1 downto 0));	
end entity;		  


ARCHITECTURE subtractor of subtractor IS 
	COMPONENT
		fullAdder  
		   port( A, B, Cin : in std_logic;
         sum, Cout : out std_logic);
	END COMPONENT;   
	signal twoCompelement: std_logic_vector(size-1 downto 0);
	SIGNAL  t:  std_logic_vector(size downto 0); 
BEGIN   
	t(0)   <= '1';
	--Cout <= t(size);  	
	twoCompelement<= not  secondParam	;
	FA: for i in 0 to size-1 generate  
		FA_i: fullAdder PORT MAP (t(i), firstParam(i), twoCompelement(i), sum(i), t(i+1));    
	end generate; 
END;