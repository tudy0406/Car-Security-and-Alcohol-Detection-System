library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity display is
    Port ( catodes_in: in std_logic_vector(0 to 7);
           --anodes_in: in std_logic_vector(0 to 3);
           catodes_out: out std_logic_vector(0 to 7);
           anodes_out: out std_logic_vector(0 to 3);
           clk : in STD_LOGIC);
end display;

architecture Behavioral of display is
signal anodess: std_logic_vector(0 to 3) := "1111";
begin
    div: process (clk)
    begin
      if rising_edge(clk) then
        case anodess is
            when "1111" => anodess <= "1110";
            when "1110" => anodess <= "1101";
            when "1101" => anodess <= "1011";
            when "1011" => anodess <= "0111";
            when "0111" => anodess <= "1111";
            when others => anodess <= "1111";
        end case;
      end if;
    end process;
    anodes_out <= anodess;
    catodes_out <= catodes_in;
end Behavioral;
