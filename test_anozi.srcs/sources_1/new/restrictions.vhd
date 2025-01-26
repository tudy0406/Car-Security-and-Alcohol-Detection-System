library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity restrictions is
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
end restrictions;

architecture Behavioral of restrictions is

begin
    auto <= auto_si and (not release) and checked and (not special);
    load <= load_si and (not release) and checked and (not special);
    backspace <= backspace_si and (not release) and checked;
    enter <= enter_si and (not release) and data_received and checked;
    left <= left_si and (not release) and checked;
    right <= right_si and (not release) and checked;
    shift <= sel(1) and sel(0) and full and (not release) and data_received and (not backspace_si) and (not special) and checked;
end Behavioral;
