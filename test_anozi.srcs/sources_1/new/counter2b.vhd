library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter2b is
    Port ( clk : in STD_LOGIC;
            c_out : out std_logic_vector(0 to 1);
            rst : in std_logic);
end counter2b;

architecture Behavioral of counter2b is

    signal s_count : std_logic_vector(0 to 1) := "00";
begin

process(clk, rst)
begin
if rst = '0' then
    s_count <= (others => '0');
    elsif rising_edge(clk) then
        if s_count = "11" then
            s_count <= "00";
        else
            s_count <= s_count + 1;
        end if;
        end if;
end process;

c_out <= s_count;

end Behavioral;
