library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity load_enable is
    Port ( catodes_in : in STD_LOGIC_VECTOR (0 to 7);
           load : out STD_LOGIC;
           hold: out std_logic;
           clr: in std_logic);
end load_enable;

architecture Behavioral of load_enable is

begin
    process(catodes_in)
    variable load_v: std_logic := '0';
    begin   
    if catodes_in = x"ff" then
        load<='0';
    else
        load<='1';
    end if;
    end process;
end Behavioral;
