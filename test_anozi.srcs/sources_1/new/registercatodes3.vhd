library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registercatodes3 is
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
end registercatodes3;

architecture Behavioral of registercatodes3 is
signal reg_internal: std_logic_vector(0 to 7) := (others=>'1');
begin
    process(clk, clear)
    begin
        if clear = '0' then
            reg_internal <= (others => '1');        --we reset the data
        elsif rising_edge(clk) then
            if enter = '1' then
                reg_internal <= (others => '1');
            elsif ld = '1' and left = '0' and right = '0' then                
                if backspace = '1' then
                    reg_internal <= (others => '1');
                else 
                    reg_internal<= data_in;--we do the load operation
                end if;
            end if;
        end if;
    end process;
    full <= not (reg_internal(0) and reg_internal(1) and reg_internal(2) and reg_internal(3) and reg_internal(4) and reg_internal(5) and reg_internal(6) and reg_internal(7));             
    data_out<= reg_internal;--we assign the current state of the register to the output port
end Behavioral;