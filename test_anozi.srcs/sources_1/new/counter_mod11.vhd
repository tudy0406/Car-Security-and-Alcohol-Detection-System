library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity counter_mod11 is
    Port ( 
        clk_in : in STD_LOGIC;
        auto : out std_logic;
        load : out std_logic;
        data_received : out std_logic;
        reset : in STD_LOGIC
    );
end counter_mod11;

architecture Behavioral of counter_mod11 is
    signal clock_out_v : std_logic_vector(3 downto 0) := (others => '0');
    signal load_s : std_logic := '0';
    signal auto_s : std_logic := '0';
    signal data_received_s : std_logic := '0';
begin
process(clk_in, reset)
begin
        if reset = '0' then
            clock_out_v <= (others => '0');
            load_s <= '0';
            data_received_s <= '0';
        elsif falling_edge(clk_in) then
            if clock_out_v = "1001" then  
                load_s <= '1';  -- Signal high on the 10th clock
                data_received_s <='1';
                clock_out_v <= clock_out_v + 1;            
            elsif clock_out_v = "1010" then -- 10 corresponds to the 11th clock signal
                clock_out_v <= (others => '0');
                load_s <= '0';
                data_received_s <= '0';
            else
                clock_out_v <= clock_out_v + 1;
            end if;
        end if;
end process;
    
process(clk_in, reset, clock_out_v)
begin
    if reset = '0' then
        auto_s <= '0';
    elsif rising_edge(clk_in) then
        if clock_out_v = "1010" then 
            auto_s <= '1';
        elsif auto_s = '1' then
            auto_s <= '0';
        end if;
    end if;
end process;
load <= load_s;    
auto <= auto_s;
data_received <= data_received_s;
end Behavioral;