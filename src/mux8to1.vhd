library IEEE;
   use IEEE.std_logic_1164.all;
   use ieee.numeric_std.all;
   --use ieee.std_logic_arith.all;
   use Ieee.std_logic_unsigned.all;

entity mux8to1 is		 
   generic (size : Integer := 32);
   port (
   X0: in  std_logic_vector(size-1 downto 0); 
   X1: in  std_logic_vector(size-1 downto 0);
   X2: in  std_logic_vector(size-1 downto 0);
   X3: in  std_logic_vector(size-1 downto 0);
   
   X4: in  std_logic_vector(size-1 downto 0);
   X5: in  std_logic_vector(size-1 downto 0);
   X6: in  std_logic_vector(size-1 downto 0);
   X7: in  std_logic_vector(size-1 downto 0);
   
   value1:in std_logic_vector(size-1 downto 0);
   value2:in std_logic_vector(size-1 downto 0);	
   
   S: in  std_logic_vector(4 downto 0) ;	
   dataout: out   std_logic_vector(size-1 downto 0));
end mux8to1;

architecture RTL of mux8to1 is 

begin
  
  
  process (S, X0, X1, X2, X3,X4,X5,X6,X7)
		begin
		case S is 
			when "00000" => dataout <= X0; 
			when "00001" => dataout <= X1;
			when "00010" => dataout <= X2;
			when "00011" => dataout <= X3;	  
			
			when "00100" => dataout <= X4; 
			when "00101" => dataout <= X5;
			when "00110" => dataout <= X6;
			when "00111" => dataout <= X7;	 
			
			when "01000" => dataout <= value1;
			when "01001" => dataout <= value2;
			when others => dataout <= (others=>'0');
		end case;
	end process;


end RTL;