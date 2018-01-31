library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplier is
     generic (size : Integer := 32);
    port(firstParam :in std_logic_vector(15 downto 0);
		secondParam :in std_logic_vector(15 downto 0);	
        sum :out  std_logic_vector(size-1 downto 0));
	
	
end entity;	
architecture Behavioral of multiplier is 

    begin 
        sum<=firstParam*secondParam;


end architecture   Behavioral;