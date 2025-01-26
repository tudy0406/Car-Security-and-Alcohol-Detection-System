--Rad Tudor-Andrei
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( clk_b : in STD_LOGIC;
           clk_k : in STD_LOGIC;
           serial_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           catodes_out : out std_logic_vector (0 to 7);
           anodes_out : out std_logic_vector (0 to 3);
           full: out std_logic);
end main;

architecture Behavioral of main is

component clk_div is
    Port ( clk_in : in STD_LOGIC;   --100MHz clock input
           reset : in STD_LOGIC;
           clk_out : out STD_LOGIC);    --25Khz clock output
end component clk_div;

component keyboard_input is
    Port ( clk_k : in STD_LOGIC;
           serial_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           catodes_out : out std_logic_vector (0 to 7);
           load: out std_logic;
           auto: out std_logic;
           backspace: out std_logic;
           enter: out std_logic;
           left: out std_logic;
           right: out std_logic;
           sel: in std_logic_vector(1 downto 0);
           full: in std_logic;
           shift: out std_logic
           );
end component keyboard_input;

component sum is
    Port ( clk_k : in std_logic;
           reset : in std_logic;
           right : in STD_LOGIC;
           left : in std_logic;
           backspace : in std_logic;
           enter : in std_logic;
           sel : out std_logic_vector(1 downto 0);
           auto : in std_logic
           );
end component sum;

component registers is
Port(  clk: in std_logic;
       reset: in std_logic;
       load: in std_logic;
       backspace: in std_logic;
       enter: in std_logic;
       left: in std_logic;
       right: in std_Logic;
       shift: in std_logic;
       sel: in std_logic_vector (1 downto 0);
       data_in: in std_logic_vector (0 to 7);
       reg0: out std_logic_vector (0 to 7);
       reg1: out std_logic_vector (0 to 7);
       reg2: out std_logic_vector (0 to 7);
       reg3: out std_logic_vector (0 to 7);
       full: out std_logic);
end component registers;

component counter_anodes is
    Port ( reg0 : in STD_LOGIC_VECTOR (0 to 7);
           reg1 : in STD_LOGIC_VECTOR (0 to 7);
           reg2 : in STD_LOGIC_VECTOR (0 to 7);
           reg3 : in STD_LOGIC_VECTOR (0 to 7);
           catodes_out : out STD_LOGIC_VECTOR (0 to 7);
           anodes_out : out STD_LOGIC_VECTOR (0 to 3);
           clk : in STD_LOGIC;
           reset: in std_logic);
end component counter_anodes;


signal clk_b_div_s: std_logic;
signal right_s: std_logic := '0';
signal left_s: std_logic := '0';
signal auto_s: std_logic := '0';
signal load_s: std_logic := '0';
signal backspace_s : std_logic := '0';
signal enter_s : std_logic := '0';
signal shift_s : std_logic := '0';
signal full_s : std_logic := '0';
signal ssd_data_s: std_logic_vector(0 to 7);
signal sel_s: std_logic_vector(1 downto 0) := "00";
signal reg0_s: std_logic_vector(0 to 7) := (others => '1');
signal reg1_s: std_logic_vector(0 to 7) := (others => '1');
signal reg2_s: std_logic_vector(0 to 7) := (others => '1');
signal reg3_s: std_logic_vector(0 to 7) := (others => '1');


begin
C1: clk_div port map(clk_in => clk_b, reset => reset, clk_out => clk_b_div_s);
C2: keyboard_input port map(clk_k => clk_k, serial_in => serial_in, reset => reset, catodes_out => ssd_data_s, load => load_s, auto => auto_s, backspace => backspace_s, enter => enter_s, left => left_s, right => right_s, sel => sel_s, full => full_s, shift => shift_s);
C3: sum port map(clk_k => clk_k, reset => reset, right => right_s, left => left_s, backspace => backspace_s, enter => enter_s, sel => sel_s, auto => auto_s);
C4: registers port map(clk => clk_k, reset => reset, load => load_s, backspace => backspace_s, enter => enter_s, left => left_s, right => right_s, shift => shift_s, sel => sel_s, data_in => ssd_data_s, reg0 => reg0_s, reg1 => reg1_s, reg2 => reg2_s, reg3 => reg3_s, full => full_s);
C5: counter_anodes port map(reg0 => reg0_s, reg1 => reg1_s, reg2 => reg2_s, reg3 => reg3_s ,catodes_out => catodes_out, anodes_out => anodes_out, clk => clk_b_div_s, reset => reset);
full <= full_s;
end Behavioral;
