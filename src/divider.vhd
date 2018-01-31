library IEEE;
   use IEEE.std_logic_1164.all;
   use ieee.numeric_std.all;
   --use ieee.std_logic_arith.all;
   use Ieee.std_logic_unsigned.all;

entity divider is
    generic (size : Integer := 32);
  Port (dividend, divisor : in std_logic_vector(size-1 downto 0);
        RSTb, CLK : in std_logic;
        quotient, remainder : out std_logic_vector(size-1 downto 0));
end divider;

architecture div_arch of divider is
  
  type STATE_TYPE is (s0, s1, s2);

  signal CURRENT_STATE, NEXT_STATE: STATE_TYPE;
  signal ONE : unsigned (size-1 downto 0):=( 0 => '1', others => '0');
  signal next_dividend, current_dividend, next_remainder, next_quotient, current_quotient : std_logic_vector (size-1 downto 0):=(others => '0');
  
begin
    
-- Process to hold combinational logic
 process(clk,rstb,dividend,divisor,next_remainder,next_quotient,Next_state,next_dividend, CURRENT_STATE)
 begin
 

case current_state is
when s0 =>  if(unsigned(current_dividend) > unsigned(divisor)) then
              next_state <= s1;
            elsif(unsigned(current_dividend) = unsigned(divisor))then
              next_remainder <= (others => '0');
              next_state <= s0; 
            elsif (unsigned(current_dividend) < unsigned(divisor))then
              next_remainder <= (others => '0'); 
              next_state <= s0;             
            else
             next_state <= s0;
            end if;
            current_dividend<=dividend;
            next_dividend <= dividend;  
            next_quotient <= (others => '0');
            current_quotient <= (others => '0');
            next_remainder <=(others => '0'); 
               
when s1 =>  if(unsigned(current_dividend) >= unsigned(divisor)) then
              next_state <= s1;

              
                  next_dividend <= std_logic_vector(unsigned(current_dividend) - unsigned(divisor)); 
                  next_quotient <= std_logic_vector(unsigned(current_quotient) + unsigned(one));
                 
            else
             next_remainder <= current_dividend;
              next_state <= s2;
                 
            end if;

when s2 =>  --dead state to wait for reset. Not really needed.
               
  end case; 

    --asynchronous, active low    
    if(rstb = '0') then
      current_state <= s0;
      quotient <= (others => '0'); 
      remainder <= (others => '0'); 
      current_dividend <= dividend;
      next_dividend <= dividend;
    elsif(clk'event and clk = '1') then
      current_state <= next_state;
      current_dividend<=next_dividend;      
      current_quotient <= next_quotient;
      quotient <= current_quotient;  
      remainder <= next_remainder;
    end if;  
    
end process;        
end div_arch;



configuration div_arch_cfg of divider is
  for div_arch
  end for;
end div_arch_cfg;