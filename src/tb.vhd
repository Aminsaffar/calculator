library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb is 
	
end entity;

architecture tb of tb is 	 
 -- Procedure for clock generation
  procedure clk_gen(signal clk : out std_logic; constant FREQ : real) is
    constant PERIOD    : time := 1 sec / FREQ;        -- Full period
    constant HIGH_TIME : time := PERIOD / 2;          -- High time
    constant LOW_TIME  : time := PERIOD - HIGH_TIME;  -- Low time; always >= HIGH_TIME
  begin
    -- Check the arguments
    assert (HIGH_TIME /= 0 fs) report "clk_plain: High time is zero; time resolution to large for frequency" severity FAILURE;
    -- Generate a clock cycle
    loop
      clk <= '1';
      wait for HIGH_TIME;
      clk <= '0';
      wait for LOW_TIME;
    end loop;
  end procedure;

component dataPath is	  	
	  generic (size : Integer := 32);
	port(clk :in std_logic ;
		reset :in std_logic ; 
		result:out std_logic_vector(size-1 downto 0);
	    insCode :in std_logic_vector(4 downto 0));
end component dataPath;	 
constant size : Integer := 32;
	signal clkT   : std_logic ;
	signal resetT : std_logic :='0'; 
	signal resultT: std_logic_vector(size-1 downto 0);
	signal insCodeT:std_logic_vector(4 downto 0);
	
	
	
	begin	  	 	
			resetT<='0','1'after 30ns;
	   clk_gen(clkT, 125.000E6);  -- 125.000 MHz clock
	   insCodeT<="00011","00010" after 10ns,"01011" after 20ns,-- +
	   "00011"after 30ns,"00010" after 40ns;		  
	   dataP:dataPath port map (clk=>clkT,reset=>resetT,result=>resultT,insCode=>insCodeT);
end architecture;
	