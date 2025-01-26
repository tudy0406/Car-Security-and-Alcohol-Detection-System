library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity parity_check is
    Port ( data : in STD_LOGIC_VECTOR (7 downto 0);
           parity_bit : in STD_LOGIC;
           good : out STD_LOGIC);
end parity_check;

architecture Behavioral of parity_check is

begin
process(data)
    begin
        if parity_bit = (data(7) xor data(6) xor data(5) xor data(4) xor data(3) xor data(2) xor data(1) xor data(0)) then
            good <= '0';
        else
            good <= '1';
         end if;
    end process;
end Behavioral;
