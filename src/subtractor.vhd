library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity subtractor is
     generic (size : Integer := 32);
    port(firstParam ,secondParam :in std_logic_vector(0 to size-1);
        sum :out  std_logic_vector(0 to size-1) );	
end entity;	
architecture Behavioral of subtractor is 

    begin 
        sum<=firstParam-secondParam;


end architecture   Behavioral;