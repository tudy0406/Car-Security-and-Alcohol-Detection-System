library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity freq_div is
    Port ( clk : in STD_LOGIC;
           clk_d : out STD_LOGIC);
end freq_div;

architecture Behavioral of freq_div is
signal clk_v : std_logic;
begin
    fDivider: process(clk)
    variable counter: integer :=0;
    begin
        if (clk = '1' and clk'event) then
            counter := counter + 1;
            if counter = 100000 then
                clk_d <= not clk_v;
                clk_v <= not clk_v; 
                counter := 0;
            end if;
        end if;
    end process;
end Behavioral;
