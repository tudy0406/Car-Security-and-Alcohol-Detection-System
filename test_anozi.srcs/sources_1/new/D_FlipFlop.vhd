Library IEEE;
USE IEEE.Std_logic_1164.all;

entity RisingEdge_DFlipFlop_AsyncResetLow is 
   port(
      Q : out std_logic;    
      Clk :in std_logic;  
      async_reset: in std_logic;  
      D :in  std_logic    
   );
end RisingEdge_DFlipFlop_AsyncResetLow;
architecture Behavioral of RisingEdge_DFlipFlop_AsyncResetLow is  
begin  
 process(Clk,async_reset)
 begin 
     if(async_reset='0') then 
   Q <= '0';
     elsif(Clk = '0' and Clk'event) then
   Q <= D; 
  end if;      
 end process;  
end Behavioral;