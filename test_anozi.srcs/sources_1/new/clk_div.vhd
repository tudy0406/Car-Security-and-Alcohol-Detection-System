--Tat Dragos Alexandru
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity clk_div is
    Port ( clk_in : in STD_LOGIC;   --100MHz clock input
           reset : in STD_LOGIC;
           clk_out : out STD_LOGIC);    --25Khz clock output
end clk_div;

architecture Behavioral of clk_div is

    signal count : INTEGER := 0;
    signal clk: std_logic := '0';

begin

    process(clk_in, reset)
    begin
        if reset = '0' then
            count <= 0;
            clk <= '1';      
        elsif falling_edge(clk_in) then
            if count = 2000 then
                count <= 0;
                clk <= NOT clk;
            else 
                count <= count + 1;
            end if;
       end if;  
    end process;
     clk_out <= clk;
end Behavioral;
