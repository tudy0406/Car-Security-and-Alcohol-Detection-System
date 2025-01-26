library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_4_1_anodes is
    Port ( sel : in STD_LOGIC_VECTOR (0 to 1);
           data_out : out STD_LOGIC_VECTOR (0 to 3));
end MUX_4_1_anodes;

architecture Behavioral of MUX_4_1_anodes is

begin
    process(sel)
    begin
    case sel is
    when "00" => data_out <= "1110";
    when "01" => data_out <= "1101";
    when "10" => data_out <= "1011";
    when "11" => data_out <= "0111";
    when others => data_out <= "1111";
    end case;
    end process;
end Behavioral;
