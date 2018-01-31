library IEEE;														 
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;   
use ieee.numeric_std.all;	  
entity instructionTranslator is
	port(clk :in std_logic;
		instructionCode :in std_logic_vector(0 to 4):="00000";
		instructionType:out std_logic_vector(1 downto 0) ;
		data :out string (1 to 1)
		);
	
end instructionTranslator;	

architecture  Translator of instructionTranslator is 	
	type dataArray is array (0 to 14)of string(1 to 1);  
	signal da : dataArray:=("0","1","2","3","4","5","6","7","8","9","+","-","*","/","=");  
	
begin
	process(clk) begin	
		    report "sim start";
		data<=da(to_integer(unsigned(instructionCode)));
		if(instructionCode>9)then
			instructionType<="00";--for number	  		 
		elsif(instructionCode<14)then
			instructionType<="01";--for binaray oprator		
		elsif(instructionCode=14)then 	 
			instructionType<="11";--for = oprator
		end if;
	end process;
	
	
end architecture Translator;