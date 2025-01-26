library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX4_1 is
    Port ( sel : in STD_LOGIC_VECTOR (1 downto 0);
           data_in0 : in std_logic_vector (0 to 7);
           data_in1 : in std_logic_vector (0 to 7);
           data_in2 : in std_logic_vector (0 to 7);
           data_in3 : in std_logic_vector (0 to 7);
           data_out : out std_logic_vector (0 to 7));
end MUX4_1;

architecture Behavioral of MUX4_1 is

begin
    process(sel, data_in0, data_in1, data_in2, data_in3)
    begin
    case sel is
    when "00" => data_out <= data_in0;
    when "01" => data_out <= data_in1;
    when "10" => data_out <= data_in2;
    when "11" => data_out <= data_in3;
    when others => data_out <= data_in0;
    end case;
    end process;
end Behavioral;
