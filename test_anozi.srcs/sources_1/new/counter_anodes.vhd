--Rad Tudor + all the smaller components
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_anodes is
    Port ( reg0 : in STD_LOGIC_VECTOR (0 to 7);
           reg1 : in STD_LOGIC_VECTOR (0 to 7);
           reg2 : in STD_LOGIC_VECTOR (0 to 7);
           reg3 : in STD_LOGIC_VECTOR (0 to 7);
           catodes_out : out STD_LOGIC_VECTOR (0 to 7);
           anodes_out : out STD_LOGIC_VECTOR (0 to 3);
           clk : in STD_LOGIC;
           reset: in std_logic);
end counter_anodes;

architecture Behavioral of counter_anodes is
component MUX4_1 is
    Port ( sel : in STD_LOGIC_VECTOR (0 to 1);
           data_in0 : in std_logic_vector (0 to 7);
           data_in1 : in std_logic_vector (0 to 7);
           data_in2 : in std_logic_vector (0 to 7);
           data_in3 : in std_logic_vector (0 to 7);
           data_out : out std_logic_vector (0 to 7));
end component MUX4_1;

component MUX_4_1_anodes is
    Port ( sel : in STD_LOGIC_VECTOR (0 to 1);
           data_out : out STD_LOGIC_VECTOR (0 to 3));
end component MUX_4_1_anodes;

component counter2b is
    Port ( clk : in STD_LOGIC;
            c_out : out std_logic_vector(0 to 1);
            rst : in std_logic);
end component counter2b;

signal sel_s: std_logic_vector (0 to 1) := "00";
begin
C1: counter2b port map(clk => clk, c_out => sel_s, rst => reset);
C2: MUX4_1 port map(sel => sel_s, data_in0 => reg0, data_in1 => reg1, data_in2 => reg2, data_in3 => reg3, data_out => catodes_out);
C3: MUX_4_1_anodes port map(sel => sel_s, data_out => anodes_out);

end Behavioral;
