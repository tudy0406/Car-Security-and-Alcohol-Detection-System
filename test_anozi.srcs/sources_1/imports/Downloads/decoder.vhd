library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity decoder is
  Port ( 
        data : in STD_LOGIC_VECTOR (7 downto 0);
        catodes : out STD_LOGIC_VECTOR (0 to 7)
        );
end decoder;

architecture Behavioral of decoder is

begin
process(data)
begin
    case data is
        when X"45" => catodes <= X"03"; --0
        when X"16" => catodes <= X"9F"; --1
        when X"1E" => catodes <= X"25"; --2
        when X"26" => catodes <= X"0D"; --3
        when X"25" => catodes <= X"99"; --4
        when X"2E" => catodes <= X"49"; --5
        when X"36" => catodes <= X"41"; --6
        when X"3D" => catodes <= X"1F"; --7
        when X"3E" => catodes <= X"01"; --8
        when X"46" => catodes <= X"09"; --9
        when X"1C" => catodes <= X"11"; --A
        when X"32" => catodes <= X"C1"; --B
        when X"21" => catodes <= X"E5"; --c
        when X"23" => catodes <= X"85"; --d
        when X"24" => catodes <= X"61"; --E
        when X"2B" => catodes <= X"71"; --F
        when X"3B" => catodes <= X"87"; --J
        when X"4B" => catodes <= X"E3"; --L
        when X"31" => catodes <= X"13"; --N
        when X"44" => catodes <= X"C5"; --o
        when X"3C" => catodes <= X"83"; --U
        when X"33" => catodes <= X"91"; --H
        when X"4D" => catodes <= X"31"; --P
        when X"43" => catodes <= X"F3"; --I
        when X"29" => catodes <= X"EF"; --_
        when X"2C" => catodes <= X"73"; --T
        when X"35" => catodes <= X"89"; --y
        when X"15" => catodes <= X"19"; --q
        when X"4E" => catodes <= X"FD"; ---
        when X"55" => catodes <= X"7D"; --=
        when others => catodes <= X"7F";
    end case;
end process;

end Behavioral;
