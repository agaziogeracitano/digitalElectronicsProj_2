library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Somma3R is
    generic(n:Integer:=16);
    port(A,B,C : in STD_LOGIC_VECTOR(n-1 downto 0);
         Somma : out STD_LOGIC_VECTOR(n+1 downto 0);
         clk: in STD_LOGIC;
         clear: in STD_LOGIC);
end Somma3R;

architecture Behavioral of Somma3R is

component Registro is
    generic(n:Integer:=16);
     port( clk: in STD_LOGIC;
           clear : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (n-1 downto 0);
           Q : out STD_LOGIC_VECTOR (n-1 downto 0));           
end component;

component Adder is
    generic(n:Integer:=16);
    port(A,B : in STD_LOGIC_VECTOR(n-1 downto 0);
         Somma: out STD_LOGIC_VECTOR(n downto 0));
end component;

signal Ia,Ib,Ic: STD_LOGIC_VECTOR(n-1 downto 0);
signal SumAB, C_esteso: STD_LOGIC_VECTOR(n downto 0);
signal ISomma: STD_LOGIC_VECTOR(n+1 downto 0);

begin
RegA: Registro generic map(n) port map(clk, clear, A, Ia);
RegB: Registro generic map(n) port map(clk, clear, B, Ib);
RegC: Registro generic map(n) port map(clk, clear, C, Ic);

--A+B
SommaAB: Adder generic map(n)port map(Ia,Ib,SumAB);

--estendo C
C_esteso(n)<=Ic(n-1);
C_esteso(n-1 downto 0) <= Ic(n-1 downto 0);

--(A+B) +C
SommaABC: Adder generic map(n+1) port map(SumAB, C_esteso, ISomma);
--inserisco il risultato nel registro
RegSomma: Registro generic map(n+2) port map(clk, clear, ISomma, Somma);

end Behavioral;

