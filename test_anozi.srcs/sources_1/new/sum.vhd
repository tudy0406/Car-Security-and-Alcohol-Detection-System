--Tat Dragos Alexandru
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sum is
    Port ( clk_k : in std_logic;
           reset : in std_logic;
           right : in STD_LOGIC;
           left : in std_logic;
           backspace : in std_logic;
           enter : in std_logic;
           sel : out std_logic_vector(1 downto 0);
           auto : in std_logic
           );
end sum;

architecture Behavioral of sum is
    signal s : std_logic_vector (1 downto 0) := "00";
begin

    process(clk_k, reset)
    begin
        if reset = '0' then
            s <= "00";
        elsif falling_edge(clk_k) then 
            if enter = '1' then
                s <= "00";
            elsif (left = '1' or backspace = '1') and auto = '1' then
                if s = "00" then
                    s <= "00";
                else
                    s <= s - 1;-- Subtract 1 instead of adding 1
                end if;
            elsif (right = '1' and auto = '1') or auto = '1' then
                if s = "11" then
                    s <= "11";
                else
                    s <= s + 1;  
                end if;
            end if;
        end if;
    end process;

    sel <= s;
end Behavioral;

