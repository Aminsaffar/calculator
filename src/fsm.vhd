-------------------------------------------------------------------------------
--
-- Title       : fsm
-- Design      : calculator
-- Author      : nima moradi
-- Company     : fum
--
-------------------------------------------------------------------------------
--
-- File        : d:\My_Designs\cal\calculator\src\fsm.vhd
-- Generated   : Wed Jan 24 04:57:52 2018
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {fsm} architecture {fsm}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
  use ieee.numeric_std.all;
   --use ieee.std_logic_arith.all;
   use Ieee.std_logic_unsigned.all;
entity fsm is
	  generic (size : Integer := 32);
		port(   clk :in std_logic;
				instructionType:in std_logic_vector(1 downto 0) ;
				data :in string (1 to 1) ;
				reset :in std_logic ;
				opSelect:out std_logic_vector(0 to 3) ;	 
				value1:out std_logic_vector(size-1 downto 0);
				value2:out std_logic_vector(size-1 downto 0)
		);
end fsm;

--}} End of automatically maintained section

architecture fsm of fsm is	 
type state is (rst,oprand0,oprand1,oprand2,result);	  


signal curent :state :=rst; 
begin

	process(clk)  	
		variable val1: integer:=0;
		variable val2: integer:=0;
	   
     begin	 
		 if(reset='1')then
			curent <=rst;
			val1:= 0; 
			val2:= 0;
		elsif(rising_edge(clk))then	 
			if(curent=rst)then	  --state rst	 
					report "state is rst";
				if(instructionType="00")then--number 
					curent<=oprand0;
					val1:=integer'value(data); 
					 report " val1 " & integer'image(val1);
			    end if;	
				
			elsif(curent=oprand0)then	--state op0	 
					report "state is op0";
				if(instructionType="00")then--number 
					curent<=oprand0;
					val1:=integer'value(data)+val1*10;
			   		 
				elsif(instructionType="01")then--oprator
					curent<=oprand1;
			    end if;
				
		elsif(curent=oprand1)then	--state op1
				if(instructionType="00")then--number 
					curent<=oprand2;
					val2:=integer'value(data);
			   		
				elsif(instructionType="01")then--oprator
					curent<=oprand1;
			    end if;
		
		elsif(curent=oprand1)then	--state op2
				if(instructionType="00")then--number 
					curent<=oprand2;
					val2:=integer'value(data)+val2*10;
			   	
				elsif(instructionType="11")then--oprator
					curent<=result;
			    end if;
			end if;	
		end	if;	
		value1<=std_logic_vector(to_unsigned(val1,size-1));  
		value2<=std_logic_vector(to_unsigned(val2,size-1));
	end process;
	
end fsm;
