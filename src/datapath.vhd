-------------------------------------------------------------------------------
--
-- Title       : dataPath
-- Design      : calculator
-- Author      : nima moradi
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
  signal SignalOpSelect:std_logic_vector(4 downto 0) ;	
  signal dataOne:std_logic_vector(size-1 downto 0);
  signal dataTwo:std_logic_vector(size-1 downto 0);
  ------- 

  	signal d:std_logic_vector(size-1 downto 0);


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
		opSelect:out std_logic_vector(0 to 4);	 
		value1:out std_logic_vector(size-1 downto 0);
		value2:out std_logic_vector(size-1 downto 0);
		instructionCode :in std_logic_vector(0 to 4):="00000"
		);
end component fsm;

component adder is
     generic (size : Integer := 32);
    port(firstParam :in std_logic_vector(0 to size-1);
	secondParam :in std_logic_vector(0 to size-1);
        sum :out  std_logic_vector(0 to size-1) );		
end component adder;	

component mux8to1 is		 
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
        S: in  std_logic_vector(0 to 4);
       dataout: out   std_logic_vector(size-1 downto 0));
end component mux8to1;

component subtractor is
	generic (size : Integer := 32);
	port(firstParam  :in std_logic_vector(size-1 downto 0);	
		secondParam	   :in std_logic_vector(size-1 downto 0);	
		sum :out  std_logic_vector(size-1 downto 0));	
end component subtractor;					
component delay is
    
    port(data  :in std_logic_vector(0 to 4);  
		 clk :in std_logic;
        pre :buffer  std_logic_vector(0 to 4) );  	
end component delay;	  
signal addSig:std_logic_vector(size-1 downto 0);	   
signal subSig:std_logic_vector(size-1 downto 0);  
signal mulSig:std_logic_vector(size-1 downto 0); 

signal temp:std_logic_vector(size-1 downto 0); 

signal delaySignal :std_logic_vector(0 to 4);  

component  multiplier is
     generic (size : Integer := 32);
    port(
		firstParam :in std_logic_vector(15 downto 0);
	   	secondParam :in std_logic_vector(15 downto 0);	
        sum :out  std_logic_vector(size-1 downto 0));	 	
end component multiplier;	
component divider is
  generic (size: Integer := 32);
  port ( 
    A: in std_logic_vector(size-1 downto 0);
    B: in std_logic_vector(size-1 downto 0);
    Q: out std_logic_vector(size-1 downto 0);
    R: out std_logic_vector(size-1 downto 0));
end component divider;


signal divSig:std_logic_vector(size-1 downto 0);
signal reSig:std_logic_vector(size-1 downto 0);
begin
	
	it:	instructionTranslator port map(clk,insCode,insType,dataOutPut);--instruction Translator
	stateMachine:fsm port map (clk,insType,dataOutPut,reset,SignalOpSelect,dataOne,dataTwo,insCode);--state Machine  
	-------------------------------------------------------------------------------------------------
	addModule:adder port map(dataOne,dataTwo,addSig);
	------------------------------------------------------------------------------------------------	 
	subModule:subtractor port map(dataOne,dataTwo,subSig);
	------------------------------------------------------------------------------------------------  
	mulModule:multiplier port map(dataOne(15 downto 0),dataTwo(15 downto 0),mulSig);
	------------------------------------------------------------------------------------------------		   
	--divModule:divider port map(dataOne,dataTwo,divSig,reSig);
	------------------------------------------------------------------------------------------------
	muxi:mux8to1 port map(addSig,subSig,mulSig,divSig,
	reSig,temp,temp,temp,
	dataOne,dataTwo	,
	SignalOpSelect,result);	  
	------------------------------------------------------------------------------------------------
--	del: delay port map(insCode, clk,delaySignal  )	 ;
end dataPath;
