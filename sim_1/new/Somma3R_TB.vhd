library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Somma3R_TB is
    constant n : integer := 16;
end Somma3R_TB;

architecture Behavioral of Somma3R_TB is
    
    
    component Somma3R is
    port(A,B,C : in STD_LOGIC_VECTOR(n-1 downto 0);
        Somma : out STD_LOGIC_VECTOR(n+1 downto 0);
        clk: in STD_LOGIC;
        clear: in STD_LOGIC);
    end component;
    
    signal clk : STD_LOGIC := '0';
    signal clear : STD_LOGIC := '0';
    signal A, B, C : STD_LOGIC_VECTOR(n-1 downto 0):=(others=>'0');
    signal Somma : STD_LOGIC_VECTOR(n+1 downto 0);
    constant T : time := 10 ns;
    
begin

  Sum: Somma3R  port map(A, B, C, Somma, clk, clear);
    
    process begin
        clk<='0';
        wait for T/2;
        clk<='1';
        wait for T/2;
    end process;
    
process begin
    clear<='0';
    wait for 3ns;
    A <= CONV_STD_LOGIC_VECTOR(10,n);
    B <= CONV_STD_LOGIC_VECTOR(10,n);
    C <= CONV_STD_LOGIC_VECTOR(15,n);
    wait for T;
    A <= CONV_STD_LOGIC_VECTOR(1,n);
    B <= CONV_STD_LOGIC_VECTOR(2,n);
    C <= CONV_STD_LOGIC_VECTOR(3,n);
    wait for T;
    clear<='1';
    wait for T;
    clear<='0';
    wait for T;
    A <= CONV_STD_LOGIC_VECTOR(-250,n);
    B <= CONV_STD_LOGIC_VECTOR(25,n);
    C <= CONV_STD_LOGIC_VECTOR(-300,n);
    wait for T;
    A <= CONV_STD_LOGIC_VECTOR(25,n);
    B <= CONV_STD_LOGIC_VECTOR(13,n);
    C <= CONV_STD_LOGIC_VECTOR(2,n);
    wait for T;
    A <= CONV_STD_LOGIC_VECTOR(-1000,n);
    B <= CONV_STD_LOGIC_VECTOR(-1000,n);
    C <= CONV_STD_LOGIC_VECTOR(-300,n);
    wait for T;
end process;
end Behavioral;

