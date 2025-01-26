library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity DMUX1_4_load is
    Port ( sel : in STD_LOGIC_VECTOR (1 downto 0);
           data_in: in std_logic;
           data_out0 : out std_logic;
           data_out1 : out std_logic;
           data_out2 : out std_logic;
           data_out3 : out std_logic);
end DMUX1_4_load;

architecture Behavioral of DMUX1_4_load is
signal sel_s: std_logic_vector(1 downto 0) := "00";
begin
    process(sel_s, data_in)
    begin
    case sel_s is
    when "00" => 
        data_out0 <= data_in;
        data_out1 <= '0';
        data_out2 <= '0';
        data_out3 <= '0';
    when "01" =>
        data_out0 <= '0';
        data_out1 <= data_in;
        data_out2 <= '0';
        data_out3 <= '0';
    when "10" => 
        data_out0 <= '0';
        data_out1 <= '0';
        data_out2 <= data_in;
        data_out3 <= '0';
    when "11" =>
        data_out0 <= '0';
        data_out1 <= '0';
        data_out2 <= '0';
        data_out3 <= data_in;
    when others =>
        data_out0 <= '0';
        data_out1 <= '0';
        data_out2 <= '0';
        data_out3 <= '0';
    end case;
    end process;
sel_s <= sel;
end Behavioral;