library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register8bit is
    Port ( data_in : in STD_LOGIC_VECTOR (0 to 7);
           data_out : out STD_LOGIC_VECTOR (0 to 7);
           ld : in STD_LOGIC;  --load
           hold : in STD_LOGIC;  --hold
           clk : in STD_LOGIC;  --clock
           clear: in STD_LOGIC  --reset
           );
end register8bit;

architecture Behavioral of register8bit is
signal data_reg: STD_LOGIC_VECTOR (0 to 7);     --we have there the internal register state

begin
    process(clk, clear)
    variable data_reg_v: std_logic_vector (0 to 7) := (others => '0');
    begin
        if clear = '0' then
            data_reg_v := (others => '0');
            data_reg <= (others => '0');        --we reset the data
        elsif (clk = '1' and clk'event) then
            if ld = '1' then                 --we do the load operation
                data_reg <= data_in;
                data_reg_v := data_in;
            else
                data_reg <= data_reg_v; --we load the same data
            end if;
        end if;
    end process;
    
 data_out <= data_reg;                          --we assign the current state of the register to the output port
end Behavioral;
