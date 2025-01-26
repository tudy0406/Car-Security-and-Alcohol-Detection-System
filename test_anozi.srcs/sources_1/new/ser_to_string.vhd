library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ser_to_string is
    generic (N : integer := 10);
    Port ( serial_in : in STD_LOGIC;
           reset: in std_logic;
           data : out STD_LOGIC_VECTOR (7 downto 0);
           parity_bit : out STD_LOGIC;
           clk_key: in std_logic);
end ser_to_string;

architecture Behavioral of ser_to_string is
component RisingEdge_DFlipFlop_AsyncResetLow is 
   port(
      Q : out std_logic;    
      Clk :in std_logic;  
      async_reset: in std_logic;  
      D :in  std_logic    
   );
end component RisingEdge_DFlipFlop_AsyncResetLow;
signal P: std_logic_vector (9 downto 0) := (others => '0');
begin
    First_FlipFlop: if N>=1 generate
        FlipFlop_1: RisingEdge_DFlipFlop_AsyncResetLow port map(Q=>P(9), Clk => clk_key, async_reset => reset, D => serial_in);
    end generate First_FlipFlop;
    
    Other_FlipFlops: for i in N-2 downto 0 generate
        FlipFlop_i: RisingEdge_DFlipFlop_AsyncResetLow port map(Q=>P(i), Clk => clk_key, async_reset => reset, D => P(i+1));
    end generate Other_FlipFlops;
    
    data_generate: for i in 0 to 7 generate
        data(i) <= P(i+1);
    end generate data_generate;
    parity_bit<=P(9);
end Behavioral;
