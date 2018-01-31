library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
   port( A, B, Cin : in std_logic;
         sum, Cout : out std_logic);
end fullAdder;
--
architecture FullAdder of FullAdder is

   component halfAdder is --import Half Adder entity
      port( A, B  : in std_logic;
        sum, Cout : out std_logic);
   end component;
	
   signal halfTohalf, halfToOr1, halfToOr2: std_logic;

begin
   G1: halfAdder port map(A, B, halfTohalf, halfToOr1);
   G2: halfAdder port map(halfTohalf, Cin, sum, halfToOr2);
   Cout<= halfToOr1 or halfToOr2;
end FullAdder;