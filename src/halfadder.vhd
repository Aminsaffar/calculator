
--*============================

-- At this point we construct the half adder 
-- using the AND and XOR gates
library ieee;
use ieee.std_logic_1164.all;

entity halfAdder is
   port( A, B : in std_logic;
    sum, Cout : out std_logic);
end halfAdder;

architecture halfAdder of halfAdder is	  

begin
   sum<=A xor B;
   Cout<=A and B;
end halfAdder;
