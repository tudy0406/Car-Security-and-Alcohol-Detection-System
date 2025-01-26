--Rad Tudor-Andrei + all the smaller components from this component
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity keyboard_input is
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
end keyboard_input;

architecture Behavioral of keyboard_input is

component ser_to_string is
    generic (N : integer := 10);
    Port ( serial_in : in STD_LOGIC;
           reset: in std_logic;
           data : out STD_LOGIC_VECTOR (7 downto 0);
           parity_bit : out STD_LOGIC;
           clk_key: in std_logic);
end component ser_to_string;

component counter_mod11 is
    Port ( 
        clk_in : in STD_LOGIC;
        auto : out std_logic;
        load : out std_logic;
        data_received : out std_logic;
        reset : in STD_LOGIC
    );
end component counter_mod11;

component decoder is
  Port ( data : in STD_LOGIC_VECTOR (7 downto 0);
         catodes : out STD_LOGIC_VECTOR (0 to 7)
         );
end component decoder;

component check_release is
    Port ( data_1 : in STD_LOGIC_VECTOR (7 downto 0);
           data_2 : in std_logic_vector (7 downto 0);
           release : out STD_LOGIC;
           backspace : out std_logic;
           enter : out std_logic;
           left : out std_logic;
           right : out std_logic;
           special : out std_logic);
end component check_release;

component restrictions is
    Port ( checked : in std_logic;
           release : in STD_LOGIC;
           special : in std_logic;
           data_received : in std_logic;
           auto_si : in std_logic;
           load_si : in std_logic;
           backspace_si : in std_logic;
           enter_si : in std_logic;
           left_si : in std_logic;
           right_si : in std_logic;
           auto : out STD_LOGIC;
           load : out STD_LOGIC;
           backspace : out std_logic;
           enter : out std_logic;
           left : out std_logic;
           right : out std_logic;
           sel : in std_logic_vector(1 downto 0);
           full : in std_logic;
           shift : out std_logic);
end component restrictions;

component release_reg is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           ld : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           data_out: out STD_LOGIC_VECTOR (7 downto 0));
end component release_reg;

component parity_check is
    Port ( data : in STD_LOGIC_VECTOR (7 downto 0);
           parity_bit : in STD_LOGIC;
           good : out STD_LOGIC);
end component parity_check;

signal data: std_logic_vector(7 downto 0);
signal data_received_s: std_logic := '0';
signal parity_bit_s: std_logic := '0';
signal auto_s: std_logic := '0';
signal load_s: std_logic := '0';
signal backspace_s: std_logic := '0';
signal enter_s: std_logic := '0';
signal left_s: std_logic := '0';
signal right_s: std_logic := '0';
signal release_s: std_logic := '0';
signal special_s: std_logic := '0';
signal checked_s: std_logic := '0';
signal data1_s: std_logic_vector(7 downto 0);
signal data2_s: std_logic_vector(7 downto 0);
--signal data_received_s: std_logic;
begin
C1: ser_to_string port map (serial_in => serial_in, reset => reset, data => data, parity_bit => parity_bit_s, clk_key => clk_k);
C2: parity_check port map (data => data, parity_bit => parity_bit_s, good => checked_s);
C3: counter_mod11 port map (clk_in => clk_k, auto => auto_s, load => load_s, data_received => data_received_s, reset => reset);
C4: decoder port map (data => data, catodes => catodes_out);
C5: release_reg port map(clk => clk_k, reset => reset, ld => load_s, data_in => data, data_out => data2_s);
C6: check_release port map(data_1 => data, data_2 => data2_s, release => release_s, backspace => backspace_s, enter => enter_s, left => left_s, right => right_s, special => special_s);
C7: restrictions port map(checked => checked_s, release => release_s, special => special_s, data_received => data_received_s, auto_si => auto_s, load_si => load_s, backspace_si => backspace_s, enter_si => enter_s, left_si => left_s, right_si => right_s, auto => auto, load => load, backspace => backspace, enter => enter, left => left, right => right, sel => sel, full => full, shift => shift);
end Behavioral;
