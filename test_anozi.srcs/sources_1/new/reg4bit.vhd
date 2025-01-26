library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg4bit is
    Port ( data_in : in STD_LOGIC_VECTOR (0 to 3);
           data_out : out STD_LOGIC_VECTOR (0 to 3);
           ld : in STD_LOGIC;  --load
           hold : in STD_LOGIC;  --hold
           clk : in STD_LOGIC;  --clock
           clear: in STD_LOGIC  --reset
           );
end reg4bit;

architecture Behavioral of reg4bit is
signal data_reg: STD_LOGIC_VECTOR (0 to 3);     --we have there the internal register state

begin
    process(clk, clear)
    begin
        if clear = '0' then
            data_reg <= (others => '0');        --we reset the data
        elsif rising_edge(clk) then
            if hold = '1' then                  --we do nothing, we hold the data
            elsif ld = '1' then                 --we do the load operation
                data_reg <= data_in;
            end if;
        end if;
    end process;
    
 data_out <= data_reg;                          --we assign the current state of the register to the output port
end Behavioral;
