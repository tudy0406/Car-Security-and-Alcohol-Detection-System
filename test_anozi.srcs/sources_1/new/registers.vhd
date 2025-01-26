--Tat Dragos-Alexandru + all the smaller components from this component
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registers is
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
end registers;

architecture Behavioral of registers is
component registercatodes0 is
    Port ( data_in : in STD_LOGIC_VECTOR (0 to 7);
           right_reg : in std_logic_vector (0 to 7);
           data_out : out STD_LOGIC_VECTOR (0 to 7);
           ld : in STD_LOGIC;  --load
           backspace: in std_logic;
           enter: in std_logic;
           left: in std_logic;
           right: in std_logic;
           shift: in std_logic;
           clk : in STD_LOGIC;  --clock
           clear: in STD_LOGIC  --reset
           );
end component registercatodes0;
component registercatodes1 is
    Port ( data_in : in STD_LOGIC_VECTOR (0 to 7);
           right_reg : in std_logic_vector (0 to 7);
           data_out : out STD_LOGIC_VECTOR (0 to 7);
           ld : in STD_LOGIC;  --load
           backspace: in std_logic;
           enter: in std_logic;
           left: in std_logic;
           right: in std_logic;
           shift: in std_logic;
           clk : in STD_LOGIC;  --clock
           clear: in STD_LOGIC  --reset
           );
end component registercatodes1;
component registercatodes2 is
    Port ( data_in : in STD_LOGIC_VECTOR (0 to 7);
           right_reg : in std_logic_vector (0 to 7);
           data_out : out STD_LOGIC_VECTOR (0 to 7);
           ld : in STD_LOGIC;  --load
           backspace: in std_logic;
           enter: in std_logic;
           left: in std_logic;
           right: in std_logic;
           shift: in std_logic;
           clk : in STD_LOGIC;  --clock
           clear: in STD_LOGIC  --reset
           );
end component registercatodes2;
component registercatodes3 is
    Port ( data_in : in STD_LOGIC_VECTOR (0 to 7);
           data_out : out STD_LOGIC_VECTOR (0 to 7);
           ld : in STD_LOGIC;  --load
           backspace: in std_logic;
           enter: in std_logic;
           left: in std_logic;
           right: in std_logic;
           clk : in STD_LOGIC;  --clock
           clear: in STD_LOGIC; --reset
           full: out std_logic
           );
end component registercatodes3;

component DMUX1_4_load is
    Port ( sel : in STD_LOGIC_VECTOR (1 downto 0);
           data_in: in std_logic;
           data_out0 : out std_logic;
           data_out1 : out std_logic;
           data_out2 : out std_logic;
           data_out3 : out std_logic);
end component DMUX1_4_load;

component selections is
    Port ( sel : in STD_LOGIC_VECTOR (1 downto 0);
           data_in0 : in std_logic_vector(0 to 7);
           data_in1 : in std_logic_vector(0 to 7);
           data_in2 : in std_logic_vector(0 to 7);
           data_in3 : in std_logic_vector(0 to 7);
           data0 : out STD_LOGIC_VECTOR (0 to 7);
           data1 : out STD_LOGIC_VECTOR (0 to 7);
           data2 : out STD_LOGIC_VECTOR (0 to 7);
           data3 : out STD_LOGIC_VECTOR (0 to 7));
end component selections;

signal load0: std_logic;
signal load1: std_logic;
signal load2: std_logic;
signal load3: std_logic;
signal reg0_s: std_logic_vector(0 to 7);
signal reg1_s: std_logic_vector(0 to 7);
signal reg2_s: std_logic_vector(0 to 7);
signal reg3_s: std_logic_vector(0 to 7);

begin
--C1: DMUX1_4 port map(sel => sel, data_in => data_in, data_out0 => data0, data_out1 => data1, data_out2 => data2, data_out3 => data3);
C2: DMUX1_4_load port map(sel => sel, data_in => load, data_out0 => load0, data_out1 => load1, data_out2 => load2, data_out3 => load3);
C3: registercatodes0 port map(data_in => data_in, right_reg => reg1_s, data_out => reg0_s, ld => load0, backspace => backspace, enter => enter, left => left, right => right, shift => shift, clk => clk, clear => reset);
C4: registercatodes1 port map(data_in => data_in, right_reg => reg2_s, data_out => reg1_s, ld => load1, backspace => backspace, enter => enter, left => left, right => right, shift => shift, clk => clk, clear => reset);
C5: registercatodes2 port map(data_in => data_in, right_reg => reg3_s, data_out => reg2_s, ld => load2, backspace => backspace, enter => enter, left => left, right => right, shift => shift, clk => clk, clear => reset);
C6: registercatodes3 port map(data_in => data_in, data_out => reg3_s, ld => load3, backspace => backspace, enter => enter, left => left, right => right, clk => clk, clear => reset, full => full);
c7: selections port map(sel => sel, data_in0 => reg0_s, data_in1 => reg1_s, data_in2 => reg2_s, data_in3 => reg3_s, data0 => reg0, data1 => reg1, data2 => reg2, data3 => reg3);
end Behavioral;
