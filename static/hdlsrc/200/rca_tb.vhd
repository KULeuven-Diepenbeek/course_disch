--------------------------------------------------------------------------------
-- KU Leuven - ESAT/COSIC - Emerging technologies, Systems & Security
--------------------------------------------------------------------------------
-- Module Name:     rca_tb - Behavioural
-- Project Name:    Digitale eletronische schakelingen
-- Description:     Testbench for rca
--
-- Revision     Date       Author     Comments
-- v0.1         20140119   VlJo       Initial version
--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rca_tb is
    generic(
        WIDTH_as_set_by_the_testbench : natural := 16
    );
end entity rca_tb;

architecture Behavioural of rca_tb is

    component rca is
        generic(
            WIDTH : natural := 8
        );
        port(
            A : IN STD_LOGIC_VECTOR(WIDTH-1 downto 0);
            B : IN STD_LOGIC_VECTOR(WIDTH-1 downto 0);
            S : OUT STD_LOGIC_VECTOR(WIDTH-1 downto 0);
            C : OUT STD_LOGIC
        );
    end component rca;

    signal A : STD_LOGIC_VECTOR(WIDTH_as_set_by_the_testbench-1 downto 0);
    signal B : STD_LOGIC_VECTOR(WIDTH_as_set_by_the_testbench-1 downto 0);
    signal S : STD_LOGIC_VECTOR(WIDTH_as_set_by_the_testbench-1 downto 0);
    signal C : STD_LOGIC;

begin

    -------------------------------------------------------------------------------
    -- STIMULI
    -------------------------------------------------------------------------------
    PSTIM: process
    begin
        A <= x"0000";
        B <= x"0000";
        wait for 3 ns;
        assert (S = x"0000") report "Error in sum" severity note;
        assert (C = '0') report "Error in carry" severity note;
        wait for 2 ns;

        A <= x"0003";
        B <= x"0027";
        wait for 3 ns;
        assert (S = x"002A") report "Error in sum" severity note;
        assert (C = '0') report "Error in carry" severity note;
        wait for 2 ns;

        A <= x"FFFF";
        B <= x"FFFF";
        wait for 3 ns;
        assert (S = x"FFFE") report "Error in sum" severity note;
        assert (C = '1') report "Error in carry" severity note;
        wait for 2 ns;

        wait;
    end process;

    -------------------------------------------------------------------------------
    -- DUT
    -------------------------------------------------------------------------------
    DUT: component rca generic map (WIDTH => WIDTH_as_set_by_the_testbench) port map(
        A => A,
        B => B,
        S => S,
        C => C
    );

end Behavioural;