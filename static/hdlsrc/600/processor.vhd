library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;

library work;
    use work.PKG_disch.ALL;

entity processor is
    generic(
        G_DATAWIDTH : natural := 32;
        G_REGCOUNT_LOG2 : natural := 5
    );
    port(
        clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        ce : in STD_LOGIC;
        inst : in STD_LOGIC_VECTOR(G_DATAWIDTH-1 downto 0);
        pc : out STD_LOGIC_VECTOR(G_DATAWIDTH-1 downto 0);
        bus_o : out T_bus_if_o;
        bus_i : in T_bus_if_i
    );
end entity processor;