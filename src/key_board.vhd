library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;
													 
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;   
use ieee.numeric_std.all;	 


 

entity matrix_keypad is

port(

clock: in std_logic;

col_line : in   std_logic_vector(3 downto 0);

row_line : in std_logic_vector(3 downto 0);

keyboard : in std_logic;

data :out string (1 to 1)

);

end matrix_keypad;

 

architecture Behavioral of matrix_keypad is
      signal rowselected :std_logic_vector(0 to 4):="00000";
      signal selected : std_logic_vector(0 to 3):="0000";
      signal nothing_selected : std_logic := '0';
      type dataArray is array (0 to 15)of string(1 to 1);  
      signal keyboard1 : dataArray:=("7","8","9","+",
                                    "4","5","6","-",
                                    "1","2","3","*",
                                    "r","0","=","/");  

      signal keyboard2 : dataArray:=("0","1","2","3",
                                    "4","5","6","7",
                                    "8","9","+","-",
                                    "*","/","=","r");
begin

test: process(clock,row_line,col_line) is
      variable selrow: std_logic_vector(0 to 1):= "00";
      variable selcol: std_logic_vector(0 to 1):= "00";
begin

nothing_selected <= '0' ;   

case row_line is

      when "1110" =>
            selrow := "00";
      when "1101" =>
            selrow := "01";
      when "1011" =>
            selrow := "10";
      when "0111" =>
            selrow := "11";
      when others => nothing_selected <= '1' ;

end case;


case col_line is
      when "1110" =>
            selcol := "00";
            nothing_selected <= '0' ;
      when "1101" =>
            selcol := "01";
            nothing_selected <= '0' ;
      when "1011" =>
            selcol := "10";
            nothing_selected <= '0' ;
      when "0111" =>
            selcol := "11";
            nothing_selected <= '0' ;
      when others => nothing_selected <= '1' ;


end case;

if (nothing_selected = '0')then
      if(keyboard = '0')then
            data<=keyboard1(to_integer(unsigned(selrow & selcol)));
      else 
            data<=keyboard2(to_integer(unsigned(selrow & selcol)));
      end if;
end if;

end process;

end Behavioral;