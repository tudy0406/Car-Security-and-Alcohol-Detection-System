library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity release_reg is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           ld : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           data_out: out STD_LOGIC_VECTOR (7 downto 0));
end release_reg;

architecture Behavioral of release_reg is
signal reg_internal: std_logic_vector(7 downto 0) := (others=>'0');
begin
    process(clk, reset)
    begin
        if reset = '0' then
            reg_internal <= (others => '0');        --we reset the data
        elsif falling_edge(clk) then
            if ld = '1' then                 --we do the load operation
                reg_internal<= data_in;
            end if;
        end if;
    end process;                    
    data_out<= reg_internal;--we assign the current state of the register to the output port

end Behavioral;
