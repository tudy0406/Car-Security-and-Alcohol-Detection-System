library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity selections is
    Port ( sel : in STD_LOGIC_VECTOR (1 downto 0);
           data_in0 : in std_logic_vector(0 to 7);
           data_in1 : in std_logic_vector(0 to 7);
           data_in2 : in std_logic_vector(0 to 7);
           data_in3 : in std_logic_vector(0 to 7);
           data0 : out STD_LOGIC_VECTOR (0 to 7);
           data1 : out STD_LOGIC_VECTOR (0 to 7);
           data2 : out STD_LOGIC_VECTOR (0 to 7);
           data3 : out STD_LOGIC_VECTOR (0 to 7));
end selections;

architecture Behavioral of selections is

begin
    data0(0 to 6)<=data_in0(0 to 6);
    data1(0 to 6)<=data_in1(0 to 6);
    data2(0 to 6)<=data_in2(0 to 6);
    data3(0 to 6)<=data_in3(0 to 6);
    data0(7) <= sel(1) or sel(0);
    data1(7) <= sel(1) or (not sel(0));
    data2(7) <= (not sel(1)) or sel(0);
    data3(7) <= (not sel(1)) or (not sel(0));
end Behavioral;
