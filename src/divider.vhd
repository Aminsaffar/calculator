library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity divider is
  generic (size: Integer := 32);
  port ( 
    A: in std_logic_vector(size-1 downto 0);
    B: in std_logic_vector(size-1 downto 0);
    Q: out std_logic_vector(size-1 downto 0);
    R: out std_logic_vector(size-1 downto 0));
end entity;

architecture direct of divider is 
  signal Auns, Buns, Quns, Runs: unsigned(size-1 downto 0);
begin 

  --Convert inputs to unsigned:
  Auns <= unsigned(A);
  Buns <= unsigned(B);

  --Do the division:
  Quns <= Auns/Buns;
  Runs <= Auns rem Buns; --Or: Runs <= Auns - resize(Quns*Buns, size);

  --Covert results to std_logic_vector:
  Q <= std_logic_vector(Quns);
  R <= std_logic_vector(Runs);  

end architecture   ;