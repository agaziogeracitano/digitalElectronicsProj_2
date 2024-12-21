library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Registro is
    generic (n:integer:=16);
    Port ( clk : in STD_LOGIC;
           clear : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (n-1 downto 0);
           Q : out STD_LOGIC_VECTOR (n-1 downto 0));
end Registro;

architecture Behavioral of Registro is

begin
  process(clk, clear) begin
     if (clear='1') then 
         Q<=(others=>'0');
     elsif rising_edge(clk) then
         Q<=D;
     end if;
  end process;

end Behavioral;