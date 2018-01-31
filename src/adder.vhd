library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder is
     generic (size : Integer := 32);
    port(firstParam  :in std_logic_vector(0 to size-1);	
		secondParam	   :in std_logic_vector(0 to size-1);	
        sum :out  std_logic_vector(0 to size-1) );	
end entity;		  

architecture adder of adder is 

    begin 
        sum<=firstParam+secondParam;
		--  sum<="00000000000000000000000000001101" after 20ns;

end architecture adder;