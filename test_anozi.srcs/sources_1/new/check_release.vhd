library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity check_release is
    Port ( data_1 : in STD_LOGIC_VECTOR (7 downto 0);
           data_2 : in std_logic_vector (7 downto 0);
           release : out STD_LOGIC;
           backspace : out std_logic;
           enter : out std_logic;
           left : out std_logic;
           right : out std_logic;
           special : out std_logic);
end check_release;

architecture Behavioral of check_release is
signal release_s1: std_logic := '0';
signal release_s2: std_logic := '0';
begin
process(data_1)
begin
    case data_1  is 
        when X"f0" => release_s1 <= '1'; --key release
                      backspace <= '0';
                      enter <= '0';
                      left <= '0';
                      right <= '0';
                      special <= '0';
        when X"66" => release_s1 <= '0'; --backspace
                      backspace <= '1';
                      enter <= '0';
                      left <= '0';
                      right <= '0';
                      special <= '0';
        when X"5A" =>release_s1 <= '0'; --enter
                      backspace <= '0';
                      enter <= '1';
                      left <= '0';
                      right <= '0';
                      special <= '0';
        when X"6B" => release_s1 <= '0'; --left arrow
                      backspace <= '0';
                      enter <= '0';
                      left <= '1';
                      right <= '0';
                      special <= '0';
        when X"74" => release_s1 <= '0'; --right arrow
                      backspace <= '0';
                      enter <= '0';
                      left <= '0';
                      right <= '1';
                      special <= '0';
        when X"E0" => release_s1 <= '0'; --special key
                      backspace <= '0';
                      enter <= '0';
                      left <= '0';
                      right <= '0';
                      special <= '1';
        when others => release_s1 <= '0'; --none of them
                       backspace <= '0';
                       enter <= '0';
                       left <= '0';
                       right <= '0';
                       special <= '0';
    end case;
end process; 

process(data_2)
begin
    case data_2  is 
        when X"f0" => release_s2 <= '1';
        when others => release_s2 <= '0';
    end case;
end process;
release <= release_s1 or release_s2;
end Behavioral;
