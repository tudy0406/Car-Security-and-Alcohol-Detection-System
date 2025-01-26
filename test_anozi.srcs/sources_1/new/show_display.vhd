library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity show_display is
    Port ( clk : in STD_LOGIC;
           catodes_out : out STD_LOGIC_VECTOR (0 to 7);
           anodes_out : out STD_LOGIC_VECTOR (0 to 3);
           catodes_in : in std_logic_vector (0 to 7)
           --anodes_in : in std_logic_vector (0 to 3)
           );
end show_display;

architecture Behavioral of show_display is
component display is
    Port ( catodes_in: in std_logic_vector(0 to 7);
           --anodes_in: in std_logic_vector(0 to 3);
           catodes_out: out std_logic_vector(0 to 7);
           anodes_out: out std_logic_vector(0 to 3);
           clk : in STD_LOGIC);
end component display;

component freq_div is
    Port ( clk : in STD_LOGIC;
           clk_d : out STD_LOGIC);
end component freq_div;

signal clk_div: std_logic;
begin
C1: freq_div port map (clk => clk, clk_d => clk_div);
C2: display port map (catodes_in => catodes_in, catodes_out => catodes_out, anodes_out => anodes_out, clk=>clk_div); 
end Behavioral;
