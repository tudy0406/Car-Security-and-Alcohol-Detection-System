library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DMUX1_4 is
    Port ( sel : in STD_LOGIC_VECTOR (0 to 1);
           data_in : in std_logic_vector (0 to 7);
           data_out0 : out std_logic_vector (0 to 7);
           data_out1 : out std_logic_vector (0 to 7);
           data_out2 : out std_logic_vector (0 to 7);
           data_out3 : out std_logic_vector (0 to 7));
end DMUX1_4;

architecture Behavioral of DMUX1_4 is

begin
    process(sel, data_in)
    begin
    case sel is
    when "00" => data_out0 <= data_in;
    when "01" => data_out1 <= data_in;
    when "10" => data_out2 <= data_in;
    when "11" => data_out3 <= data_in;
    when others => data_out0 <= data_in;
    end case;
    end process;

end Behavioral;