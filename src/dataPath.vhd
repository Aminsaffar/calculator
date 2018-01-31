-------------------------------------------------------------------------------
--
-- Title       : dataPath
-- Design      : calculator
-- Author      : saeid moradi
-- Company     : fum
--
-------------------------------------------------------------------------------
--
-- File        : d:\My_Designs\cal\calculator\src\dataPath.vhd
-- Generated   : Wed Jan 24 02:20:45 2018
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
--{entity {dataPath} architecture {dataPath}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity dataPath is	  	
	  generic (size : Integer := 32);
	port(clk :in std_logic ;
		reset :in std_logic ; 
		result:out std_logic_vector(size-1 downto 0);
	    insCode :in std_logic_vector(4 downto 0));
end dataPath;

--}} End of automatically maintained section

architecture dataPath of dataPath is  
  signal insType:std_logic_vector(1 downto 0) ;
  signal dataOutPut : string (1 to 1);	
  signal SignalOpSelect:std_logic_vector(0 to 3) ;	
  signal dataOne:std_logic_vector(size-1 downto 0);
  signal dataTwo:std_logic_vector(size-1 downto 0);
  ------- 

  	signal d:std_logic_vector(size-1 downto 0);

component subtractor is
     generic (size : Integer := 32);
    port(firstParam ,secondParam :in std_logic_vector(0 to size-1);
        sum :out  std_logic_vector(0 to size-1) );	
end component;

component instructionTranslator is
	port(clk :in std_logic;
		instructionCode :in std_logic_vector(0 to 4);
		instructionType:out std_logic_vector(1 downto 0) ;
		data :out string (1 to 1)
		);	
end component instructionTranslator;		
component fsm is
	  generic (size : Integer := 32);
		port(clk :in std_logic;
		instructionType:in std_logic_vector(1 downto 0) ;
		data :in string (1 to 1) ;
		reset :in std_logic ;
		opSelect:out std_logic_vector(0 to 3) ;	 
		value1:out std_logic_vector(size-1 downto 0);
		value2:out std_logic_vector(size-1 downto 0)
		);
end component fsm;

component adder is
     generic (size : Integer := 32);
    port(firstParam :in std_logic_vector(0 to size-1);
	secondParam :in std_logic_vector(0 to size-1);
        sum :out  std_logic_vector(0 to size-1) );		
end component adder;	
 	
begin
	
	it:	instructionTranslator port map(clk,insCode,insType,dataOutPut);--instruction Translator
	stateMachine:fsm port map (clk,insType,dataOutPut,reset,SignalOpSelect,dataOne,dataTwo);--state Machine  
	-------------------------------------------------
	addModule:adder port map(dataOne,dataTwo,result);
						  
end dataPath;
