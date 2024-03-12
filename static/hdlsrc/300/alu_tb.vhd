
--------------------------------------------------------------------------------
-- KU Leuven - ESAT/COSIC - Emerging technologies, Systems & Security
--------------------------------------------------------------------------------
-- Module Name:     alu_tb - Behavioural
-- Project Name:    Testbench for alu
-- Description:     
--
-- Revision     Date       Author     Comments
-- v0.1         20240312   VlJo       Initial version
--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.NUMERIC_STD.ALL;

entity alu_tb is
    generic(
        WIDTH : natural := 16
    );
end entity alu_tb;

architecture Behavioural of alu_tb is

    component alu is
        generic(
            WIDTH : natural := 16
        );
        port(
            X : IN STD_LOGIC_VECTOR(WIDTH-1 downto 0);
            Y : IN STD_LOGIC_VECTOR(WIDTH-1 downto 0);
            Z : OUT STD_LOGIC_VECTOR(WIDTH-1 downto 0);
            zx : IN STD_LOGIC;
            zy : IN STD_LOGIC;
            nx : IN STD_LOGIC;
            ny : IN STD_LOGIC;
            f : IN STD_LOGIC;
            no : IN STD_LOGIC;
            zr : OUT STD_LOGIC;
            ng : OUT STD_LOGIC
        );
    end component alu;

    signal X : STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    signal Y : STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    signal Z : STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    signal zx : STD_LOGIC;
    signal zy : STD_LOGIC;
    signal nx : STD_LOGIC;
    signal ny : STD_LOGIC;
    signal f : STD_LOGIC;
    signal no : STD_LOGIC;
    signal zr : STD_LOGIC;
    signal ng : STD_LOGIC;

begin

    -------------------------------------------------------------------------------
    -- STIMULI
    -------------------------------------------------------------------------------
    PSTIM: process
        variable v_correct_z : natural;
        variable v_incorrect_z : natural;
        variable v_correct_zr : natural;
        variable v_incorrect_zr : natural;
        variable v_correct_ng : natural;
        variable v_incorrect_ng : natural;
    begin

        X <= x"0000";
        Y <= x"0000";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 10 ns;

        -- generate addition
        X <= x"381c";
        Y <= x"4a1b";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"c7e3") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"329a";
        Y <= x"ae51";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"cd65") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2173";
        Y <= x"6773";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"ba00") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d463";
        Y <= x"f724";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6c3f";
        Y <= x"f1bd";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"f1bd") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c3f8";
        Y <= x"2876";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"647e") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7470";
        Y <= x"9d25";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2036";
        Y <= x"45df";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2037") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"90b6";
        Y <= x"0e82";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"0e83") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8a6f";
        Y <= x"da4f";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1e25";
        Y <= x"fae8";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"1e25") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7112";
        Y <= x"296e";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"9a80") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b575";
        Y <= x"07cb";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"f834") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f58d";
        Y <= x"047c";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"f58d") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"17f4";
        Y <= x"ddcc";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"f5c0") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4ea4";
        Y <= x"651d";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"b15c") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3d93";
        Y <= x"53fc";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"c26d") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"737c";
        Y <= x"6d71";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"928f") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"464d";
        Y <= x"db58";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f036";
        Y <= x"78f8";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"f037") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8c13";
        Y <= x"2038";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b10e";
        Y <= x"741e";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"b10e") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6f4c";
        Y <= x"b33c";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"2288") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"096a";
        Y <= x"cd82";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"327d") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d38d";
        Y <= x"8bb1";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"47dc") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0706";
        Y <= x"9a4c";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"428e";
        Y <= x"eb92";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f35e";
        Y <= x"ba46";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ada4") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3177";
        Y <= x"1d89";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"1d88") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ec4f";
        Y <= x"12dc";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"12dd") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8336";
        Y <= x"a0a1";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"5f5e") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d1a1";
        Y <= x"f8dd";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"64eb";
        Y <= x"13fd";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4ee6";
        Y <= x"9c36";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e2d2";
        Y <= x"9175";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"e2d3") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"18ba";
        Y <= x"c7b6";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"aefc") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a374";
        Y <= x"8ea5";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"8ea6") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a460";
        Y <= x"45da";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"45da") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2936";
        Y <= x"c895";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"e9b7") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"015c";
        Y <= x"1210";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"edf0") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9bf7";
        Y <= x"c099";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"9bf6") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0abb";
        Y <= x"de8c";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"debf") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c351";
        Y <= x"aa8f";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"aa8f") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4348";
        Y <= x"221f";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0208") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4fbe";
        Y <= x"92b1";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"92b1") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e416";
        Y <= x"ce23";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"c402") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"dae5";
        Y <= x"a0a3";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f807";
        Y <= x"3920";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"3920") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e3fd";
        Y <= x"a55c";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"e3fe") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"44c0";
        Y <= x"62a9";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"1de9") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6393";
        Y <= x"9b79";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4525";
        Y <= x"2b41";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"6f65") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d753";
        Y <= x"55c6";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8e40";
        Y <= x"147b";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0440") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9fd1";
        Y <= x"51aa";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"ae56") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"bcfe";
        Y <= x"3730";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"c8d0") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3c94";
        Y <= x"86ea";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c1d4";
        Y <= x"5fc4";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"dfd4") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e99b";
        Y <= x"db31";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"e99b") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"dff6";
        Y <= x"20ff";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"00f5") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"96ba";
        Y <= x"cfcf";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"96bb") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"cf9c";
        Y <= x"d4c6";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9ef2";
        Y <= x"b376";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"9ef2") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0ef8";
        Y <= x"2d3d";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8e28";
        Y <= x"9d61";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"71d8") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e297";
        Y <= x"6165";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"6005") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6727";
        Y <= x"9182";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"da0e";
        Y <= x"0b02";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7128";
        Y <= x"a5ee";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"2128") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"aa44";
        Y <= x"cd7e";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"dcc6") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e1b6";
        Y <= x"c1b5";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"c1b4") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7513";
        Y <= x"fdca";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7749") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"728b";
        Y <= x"e3d8";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"e3d8") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e071";
        Y <= x"73cd";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0045";
        Y <= x"6e39";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"6df4") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a919";
        Y <= x"3f65";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"a918") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9e2c";
        Y <= x"3e88";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"9e2c") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d8b1";
        Y <= x"28c9";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"afe8") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"abfb";
        Y <= x"0a06";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0a05") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"aa9c";
        Y <= x"1a93";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"1a92") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8c09";
        Y <= x"8fa9";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"8c09") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d570";
        Y <= x"d19d";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"03d3") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5ff6";
        Y <= x"a205";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"5dfa") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4e66";
        Y <= x"662a";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"b19a") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"147d";
        Y <= x"6b48";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"147d") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"88da";
        Y <= x"9ab7";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"88d9") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2ca5";
        Y <= x"7193";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"aa5c";
        Y <= x"d686";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"fede") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d6b9";
        Y <= x"b3fe";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"b3fd") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f549";
        Y <= x"9cfa";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0ab6") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ff91";
        Y <= x"355c";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"355b") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a1bd";
        Y <= x"ec00";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"a000") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b2eb";
        Y <= x"886c";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"4d15") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b6b5";
        Y <= x"476f";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"f7ff") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2ff1";
        Y <= x"2c9e";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"999c";
        Y <= x"f39b";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"999b") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2c09";
        Y <= x"a82c";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"2c09") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1bf7";
        Y <= x"3748";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"c8b8") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ae31";
        Y <= x"740c";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"05b3";
        Y <= x"8af0";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"8af0") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6be0";
        Y <= x"815c";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"aca8";
        Y <= x"65a3";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"9a5c") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2b1c";
        Y <= x"cbc4";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"a0a8") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9460";
        Y <= x"576b";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"6b9f") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"cb57";
        Y <= x"f1f0";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"34a8") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d8a7";
        Y <= x"762b";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c7ff";
        Y <= x"7a7a";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"c800") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6bce";
        Y <= x"44c3";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"44c3") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3ae3";
        Y <= x"ad82";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"8d61") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"cc3d";
        Y <= x"daeb";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"33c3") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e0bc";
        Y <= x"8046";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"8045") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"79b3";
        Y <= x"47e6";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7ff7") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9ec5";
        Y <= x"a0a9";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"a0a8") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"fae6";
        Y <= x"94e2";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"6b1e") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b5b9";
        Y <= x"a97e";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"bdff") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9151";
        Y <= x"a526";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e478";
        Y <= x"214a";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"214a") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"40cc";
        Y <= x"fce8";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"fce8") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9432";
        Y <= x"7f72";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"af16";
        Y <= x"b20f";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"fd07") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2ac2";
        Y <= x"330d";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"d53e") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3a14";
        Y <= x"89f5";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d073";
        Y <= x"6395";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"9322") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5ee6";
        Y <= x"ef1f";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"4e06") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d98e";
        Y <= x"347a";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"d98d") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"44d9";
        Y <= x"6b1f";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2646") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"08f4";
        Y <= x"6b0f";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"9de5") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"14cd";
        Y <= x"0ee5";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"0ee6") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1fa2";
        Y <= x"fc17";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"1c02") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a858";
        Y <= x"74ba";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"8b45") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7357";
        Y <= x"f0de";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7ec0";
        Y <= x"8a12";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9849";
        Y <= x"ab29";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4d89";
        Y <= x"4ae8";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"fd5f") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6824";
        Y <= x"d4bc";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"d4bb") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1a18";
        Y <= x"eb7e";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0a18") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2f4a";
        Y <= x"0382";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"d438") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7577";
        Y <= x"512f";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"96fa";
        Y <= x"c033";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"96f9") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5871";
        Y <= x"178b";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ec1e";
        Y <= x"6a33";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"6a33") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"eac7";
        Y <= x"8958";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"ebdf") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"fac6";
        Y <= x"8d45";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"927f") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f943";
        Y <= x"eccc";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"eccd") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2875";
        Y <= x"c913";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"e977") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4ff9";
        Y <= x"2b69";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"4ff8") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1e7c";
        Y <= x"0c86";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0c85") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a181";
        Y <= x"eb44";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"a181") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5e7b";
        Y <= x"d052";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"a184") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b6a9";
        Y <= x"ac05";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"aac8";
        Y <= x"b20d";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"5537") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4000";
        Y <= x"8984";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"cb5c";
        Y <= x"fafd";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"d05f") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8b60";
        Y <= x"dd8b";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"522b") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b092";
        Y <= x"f91e";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"4f6e") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f69b";
        Y <= x"1e03";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"1603") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e0e1";
        Y <= x"4242";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"e0e2") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"92a5";
        Y <= x"3ff0";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"d295") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"71ab";
        Y <= x"3d2e";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"71ac") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e317";
        Y <= x"6732";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7be5") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f49a";
        Y <= x"635d";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"f7df") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"12ab";
        Y <= x"aa5d";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"aa5c") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"022e";
        Y <= x"7e74";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"022e") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"90c9";
        Y <= x"7a05";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"6f36") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c144";
        Y <= x"0ad2";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"f52d") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a3f8";
        Y <= x"37d3";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"c82d") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a41a";
        Y <= x"f720";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5647";
        Y <= x"2296";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"33b1") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e089";
        Y <= x"59ce";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"86bb") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9267";
        Y <= x"85ed";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ae30";
        Y <= x"4219";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e3c9";
        Y <= x"1c00";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9081";
        Y <= x"d55c";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"44db") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"02f6";
        Y <= x"f97f";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"fd09") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c626";
        Y <= x"8032";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"ba0c") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"28d0";
        Y <= x"43f2";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"28d0") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9434";
        Y <= x"8d40";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"8d40") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"16f8";
        Y <= x"c460";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"d6f8") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2892";
        Y <= x"4a2f";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"d76d") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6124";
        Y <= x"acb6";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"9edb") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f741";
        Y <= x"c713";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"f740") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"30b3";
        Y <= x"94b7";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"30b4") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a262";
        Y <= x"10e9";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"ef16") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9cc6";
        Y <= x"3ab2";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"88b2";
        Y <= x"c0a4";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"c80e") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5fb3";
        Y <= x"c613";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"5fb4") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"73b7";
        Y <= x"edf7";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"1209") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7313";
        Y <= x"631c";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"8ced") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"eb4a";
        Y <= x"1da3";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4b8f";
        Y <= x"80cd";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"80ce") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5404";
        Y <= x"1c1d";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"7021") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f4d7";
        Y <= x"e245";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"d71c") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d14c";
        Y <= x"0c8a";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2eb3") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7b22";
        Y <= x"72b2";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"8d4d") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a944";
        Y <= x"dd41";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"dd42") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1e3e";
        Y <= x"760e";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"1e3e") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d060";
        Y <= x"14c7";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a601";
        Y <= x"9cd8";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f26c";
        Y <= x"b2d8";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0d94") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1310";
        Y <= x"b836";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"1310") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6103";
        Y <= x"9f4f";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"9efd") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3941";
        Y <= x"32ee";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"3940") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"aa59";
        Y <= x"7ca7";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2db2") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"24b6";
        Y <= x"2fb1";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ea42";
        Y <= x"ebf6";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"1409") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3738";
        Y <= x"9345";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"3738") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b396";
        Y <= x"48ca";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"b396") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"51bd";
        Y <= x"202c";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"51bc") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"97c8";
        Y <= x"47d0";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"47cf") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ab91";
        Y <= x"4629";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"462a") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"28e4";
        Y <= x"0942";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"28e4") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3a08";
        Y <= x"e2cf";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"1cd7") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8289";
        Y <= x"ccc7";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"4f50") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ed5c";
        Y <= x"b002";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"fd5e") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"810a";
        Y <= x"dca2";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"235e") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8f53";
        Y <= x"28e1";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7407";
        Y <= x"bb6e";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"8bf8") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"76be";
        Y <= x"5217";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"24a7") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"523a";
        Y <= x"dff9";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"3233") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"560b";
        Y <= x"9f22";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d355";
        Y <= x"41a3";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"dfd9";
        Y <= x"1d31";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"fd0a") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"feed";
        Y <= x"1491";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"ea5c") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9395";
        Y <= x"f3dd";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"cae6";
        Y <= x"064e";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"cae6") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f6ba";
        Y <= x"329a";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"c420") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8434";
        Y <= x"229d";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"8434") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b712";
        Y <= x"c6ae";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"b711") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b29f";
        Y <= x"53fc";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"129c") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2d74";
        Y <= x"99de";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"99df") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2700";
        Y <= x"5083";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b83b";
        Y <= x"b83c";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"47c4") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"be5f";
        Y <= x"aa61";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"aa61") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3a46";
        Y <= x"f91f";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f156";
        Y <= x"396f";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"f155") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ccf4";
        Y <= x"3262";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"330b") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b4cf";
        Y <= x"74a3";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"8b5c") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3c1d";
        Y <= x"50f0";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"3c1e") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"cef8";
        Y <= x"7788";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"8877") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"71ae";
        Y <= x"2843";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"8e51") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3d43";
        Y <= x"af52";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ec95") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e55e";
        Y <= x"ddc5";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"c544") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4333";
        Y <= x"c668";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"bccc") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a5ef";
        Y <= x"321a";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"a5f0") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"14ad";
        Y <= x"5976";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"14ac") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0f58";
        Y <= x"7d3f";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0f59") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c351";
        Y <= x"856a";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7a95") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"dcc4";
        Y <= x"6dc6";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e7bd";
        Y <= x"49ca";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"1842") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e782";
        Y <= x"f419";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"28da";
        Y <= x"9815";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"d725") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b056";
        Y <= x"cd61";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"fd77") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"dd0a";
        Y <= x"2c10";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"2c11") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9323";
        Y <= x"93f5";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"bdc8";
        Y <= x"ff0a";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9ef5";
        Y <= x"85db";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7a24") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"92a0";
        Y <= x"c382";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"c382") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4efa";
        Y <= x"137b";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"4efb") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b893";
        Y <= x"0bcb";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"b893") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7b3b";
        Y <= x"3085";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"84c5") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c54b";
        Y <= x"77d9";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"3ab4") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b253";
        Y <= x"543c";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"b253") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d17b";
        Y <= x"05af";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e6a4";
        Y <= x"cdca";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"3235") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"49e9";
        Y <= x"86ae";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"d097") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3856";
        Y <= x"caeb";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"3856") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5428";
        Y <= x"a687";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e2e0";
        Y <= x"880f";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"1d20") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6249";
        Y <= x"7bfa";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"de43") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"afdc";
        Y <= x"c3ba";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"effe") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"60f9";
        Y <= x"473c";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"67fd") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8bd3";
        Y <= x"a61e";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"8bd4") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1c5b";
        Y <= x"e5d3";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"3688") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3212";
        Y <= x"9301";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"3212") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4615";
        Y <= x"cc51";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"1266") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e36c";
        Y <= x"23ac";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"bfc0") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a95b";
        Y <= x"2696";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"82c5") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b355";
        Y <= x"efd4";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"c381") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f260";
        Y <= x"33a9";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7e6b";
        Y <= x"e268";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7e6c") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f73f";
        Y <= x"8aca";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"80b8";
        Y <= x"462e";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"462d") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"14e7";
        Y <= x"e65b";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f86a";
        Y <= x"208e";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"18f8") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f063";
        Y <= x"90b5";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"6f4b") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c4a2";
        Y <= x"23fc";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"dc03") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b493";
        Y <= x"d7b8";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"b492") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e3fb";
        Y <= x"c906";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"e3fb") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5153";
        Y <= x"bf1a";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"ff5b") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f3dd";
        Y <= x"d0f3";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"f3dc") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3313";
        Y <= x"8159";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"b46c") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"344c";
        Y <= x"bc62";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"344c") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5817";
        Y <= x"e6b3";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"e6b3") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7971";
        Y <= x"f5a7";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7c36") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"04ac";
        Y <= x"e751";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"18af") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"be09";
        Y <= x"51b2";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"6c57") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"db7e";
        Y <= x"ad1f";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2e5f") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0c33";
        Y <= x"a8f9";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b4e8";
        Y <= x"624e";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e30b";
        Y <= x"98a5";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"fbaf") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2b12";
        Y <= x"3c17";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"d4ed") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"bda5";
        Y <= x"d69b";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"bda6") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f2c0";
        Y <= x"005e";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"ffa2") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1873";
        Y <= x"01fe";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"1873") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2da9";
        Y <= x"ff9f";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0060") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6426";
        Y <= x"efe9";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"9bd9") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2602";
        Y <= x"39be";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"c642") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"fad4";
        Y <= x"f351";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"f87d") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4473";
        Y <= x"174e";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0442") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8c9f";
        Y <= x"2bb4";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"d44c") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ea73";
        Y <= x"63df";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"9c21") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5fd2";
        Y <= x"af23";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0ef5") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5640";
        Y <= x"9cc0";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"a9c0") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f868";
        Y <= x"5173";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"49db") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f462";
        Y <= x"d38c";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"c7ee") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6233";
        Y <= x"545f";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"4013") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"cfd5";
        Y <= x"5366";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3306";
        Y <= x"112a";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"112a") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8e33";
        Y <= x"f59d";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"ffbf") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f015";
        Y <= x"2ca1";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"f016") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"fde8";
        Y <= x"28ad";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"d53b") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8980";
        Y <= x"c7ef";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"8980") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3138";
        Y <= x"dbe7";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"3137") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"84a6";
        Y <= x"d57a";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"da89";
        Y <= x"8767";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7899") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b58c";
        Y <= x"6606";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"4a74") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6c65";
        Y <= x"9677";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"939a") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"aa9c";
        Y <= x"586e";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"add2") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"bcf9";
        Y <= x"b2a3";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"4307") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"45c1";
        Y <= x"f879";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"f87a") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a725";
        Y <= x"fdbf";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"58da") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9894";
        Y <= x"1378";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d2a4";
        Y <= x"38ca";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0864";
        Y <= x"84a5";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7b5a") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5bf8";
        Y <= x"f778";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"5370") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f1c9";
        Y <= x"216e";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0e37") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9c73";
        Y <= x"809c";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7f64") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9abc";
        Y <= x"e360";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"7e1c") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a5fa";
        Y <= x"dba6";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"a5fb") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1ce5";
        Y <= x"a7b5";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"c49a") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"13c6";
        Y <= x"81b8";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"81b7") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4cc1";
        Y <= x"d624";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"29dc") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3e6c";
        Y <= x"b04f";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"c194") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f75d";
        Y <= x"afe2";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"08a3") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c76f";
        Y <= x"d129";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"c770") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f635";
        Y <= x"818d";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"818c") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a591";
        Y <= x"3d06";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"c2fa") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c3d6";
        Y <= x"97fc";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"d426") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"095b";
        Y <= x"10dc";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"ef24") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"fb20";
        Y <= x"78c9";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"fbe9") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7ac8";
        Y <= x"ac23";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"2800") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8cbc";
        Y <= x"ab63";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"549c") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2c62";
        Y <= x"9791";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2c63") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"fe6e";
        Y <= x"2d7b";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"fe6e") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3d28";
        Y <= x"efce";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"fa57";
        Y <= x"88c6";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"bb95";
        Y <= x"341b";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"341b") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"03df";
        Y <= x"2f4a";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2fdf") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"abe4";
        Y <= x"31cd";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"abe5") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"98f1";
        Y <= x"8196";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"1a87") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e593";
        Y <= x"7b4c";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"1a6d") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a7c0";
        Y <= x"a8f7";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"a7c0") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1106";
        Y <= x"c61c";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"cf4e";
        Y <= x"acd6";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8dd1";
        Y <= x"70ac";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"70ab") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b519";
        Y <= x"98dc";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"6724") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"43ab";
        Y <= x"b249";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9c32";
        Y <= x"c589";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"63ce") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"94fc";
        Y <= x"ad6c";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5c11";
        Y <= x"254e";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7d5f") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4869";
        Y <= x"c3c7";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"c3c6") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f67e";
        Y <= x"bc31";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"bc30") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"bab6";
        Y <= x"1823";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"1822") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d60f";
        Y <= x"80b6";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"80b7") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"eb57";
        Y <= x"1e7e";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"eb58") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"cb5f";
        Y <= x"32f9";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"34a1") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1487";
        Y <= x"42e7";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1475";
        Y <= x"b310";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"4cef") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0713";
        Y <= x"6fb3";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"6fb3") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"71c0";
        Y <= x"ec10";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ec10") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5c60";
        Y <= x"42ee";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"a39f") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a996";
        Y <= x"8673";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ee1f";
        Y <= x"5fc7";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"a038") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8384";
        Y <= x"bf25";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"bf24") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b58f";
        Y <= x"912d";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2462") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2df2";
        Y <= x"af1d";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"af1d") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b50d";
        Y <= x"e74e";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"4af2") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4598";
        Y <= x"0d36";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0d35") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"93a9";
        Y <= x"c6fb";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"6c56") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"37c0";
        Y <= x"69b5";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"c840") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9da8";
        Y <= x"147b";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"76d3") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8de4";
        Y <= x"0d64";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7f80") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"91e3";
        Y <= x"4aad";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"b553") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3e0f";
        Y <= x"7bbd";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"b9cc") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8344";
        Y <= x"3437";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"cbc8") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"01d1";
        Y <= x"1ab5";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"e54b") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e21c";
        Y <= x"d24f";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2db1") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c3f3";
        Y <= x"3314";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c3e1";
        Y <= x"9ec2";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"dfe3") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d301";
        Y <= x"82e9";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2cfe") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5e60";
        Y <= x"9f2a";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"5e61") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9d73";
        Y <= x"9b03";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"628d") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5930";
        Y <= x"e646";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"72ea") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"774a";
        Y <= x"fd0c";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6267";
        Y <= x"eaa5";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"4d0c") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0cb6";
        Y <= x"2f50";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"dd66") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f6c9";
        Y <= x"45cd";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"f6c8") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"807f";
        Y <= x"02c1";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"fd3e") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4839";
        Y <= x"4d7b";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0542") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9805";
        Y <= x"12d3";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"12d2") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b171";
        Y <= x"6ce6";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"931a") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f0ef";
        Y <= x"0e40";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"f0ee") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f791";
        Y <= x"3a84";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"086f") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e8d2";
        Y <= x"ebbf";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"172d") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"56d1";
        Y <= x"51fc";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"57fd") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0d41";
        Y <= x"95fe";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0540") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4850";
        Y <= x"d82f";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"4850") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a6af";
        Y <= x"bd4e";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"a6af") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3a81";
        Y <= x"4159";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"f928") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4a8d";
        Y <= x"d0e9";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"865c") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7283";
        Y <= x"b715";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8cf6";
        Y <= x"a6b1";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"a6b1") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"55ba";
        Y <= x"d088";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"5088") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"fab5";
        Y <= x"be3b";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8382";
        Y <= x"37cd";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3ddf";
        Y <= x"f5c2";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"c221") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2e94";
        Y <= x"b925";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"b924") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ad7f";
        Y <= x"233e";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"75bf") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3194";
        Y <= x"99fa";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"6606") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c302";
        Y <= x"1132";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"eece") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"db49";
        Y <= x"ba26";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ba26") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4045";
        Y <= x"c4f5";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"3b0a") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"809a";
        Y <= x"359f";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"809a") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7ca4";
        Y <= x"abf3";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"28a0") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"02be";
        Y <= x"4362";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"228a";
        Y <= x"3916";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"2002") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c2df";
        Y <= x"0fbe";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"c2e0") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a127";
        Y <= x"9b41";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"5ed8") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2496";
        Y <= x"d31d";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"5179") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"26c6";
        Y <= x"1cb3";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"3ef7") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"58c5";
        Y <= x"4991";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"a73b") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"88ed";
        Y <= x"7654";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"1299") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d753";
        Y <= x"7263";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"7264") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0d0a";
        Y <= x"b055";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"bd5f") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6135";
        Y <= x"9460";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"6135") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"52fe";
        Y <= x"6b86";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"ad02") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"78dd";
        Y <= x"39eb";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"8722") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"badf";
        Y <= x"d8a4";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"1dc5") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9a59";
        Y <= x"e196";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"e197") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4a9a";
        Y <= x"43bc";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8336";
        Y <= x"18f6";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6fd7";
        Y <= x"dfe2";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"4fb9") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f854";
        Y <= x"b7a9";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"b7a8") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8fae";
        Y <= x"a1b7";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2009";
        Y <= x"c348";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"c349") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ed60";
        Y <= x"9aad";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"12a0") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b2da";
        Y <= x"8af3";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"b2db") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0567";
        Y <= x"c509";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"c509") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9ab0";
        Y <= x"aed5";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"aed6") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a9cc";
        Y <= x"1222";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"aabf";
        Y <= x"1551";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"1550") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7474";
        Y <= x"e6a3";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"e6a3") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0112";
        Y <= x"440e";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ae7e";
        Y <= x"35f1";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"8773") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"07d0";
        Y <= x"9bd9";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"f830") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f56a";
        Y <= x"829f";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"f569") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"475d";
        Y <= x"6ab7";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"235a") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f4f6";
        Y <= x"99e3";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0b09") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"fccb";
        Y <= x"f722";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0334") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"23c1";
        Y <= x"5d2c";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"68e5";
        Y <= x"8a1b";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6ee8";
        Y <= x"5131";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"67c4";
        Y <= x"d4d0";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2b30") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c5d2";
        Y <= x"ecaa";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ecaa") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d56d";
        Y <= x"063b";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"063c") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a91f";
        Y <= x"7162";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"7163") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7b76";
        Y <= x"d03a";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"848a") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d480";
        Y <= x"f504";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"d47f") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"191b";
        Y <= x"7121";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"a7fa") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"dae3";
        Y <= x"7d19";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8342";
        Y <= x"a3f8";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8070";
        Y <= x"39b7";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ff64";
        Y <= x"33a5";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"3309") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3610";
        Y <= x"0111";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"34ff") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ecf9";
        Y <= x"9976";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"866f") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6b21";
        Y <= x"aa62";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"eb63") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"579a";
        Y <= x"063a";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"579a") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"36d0";
        Y <= x"7809";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ff97";
        Y <= x"0d18";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"ff9f") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b691";
        Y <= x"612d";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"9ed2") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"73f5";
        Y <= x"7ac8";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"7ac8") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d4d4";
        Y <= x"01a0";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0ffc";
        Y <= x"4d9b";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7a2a";
        Y <= x"7c1f";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7e3f") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6dfe";
        Y <= x"1bd2";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"add4") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d373";
        Y <= x"a679";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"d306") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9592";
        Y <= x"b5e5";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"b5e4") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c0dc";
        Y <= x"3c0a";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"c0db") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c79e";
        Y <= x"405a";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9cca";
        Y <= x"951b";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"07af") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8338";
        Y <= x"731f";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"8339") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4839";
        Y <= x"4675";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"fe3c") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e5c8";
        Y <= x"bf70";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"bf70") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d4cb";
        Y <= x"7fbf";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4b97";
        Y <= x"db55";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"4b98") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5349";
        Y <= x"cf6e";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"3092") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f9fc";
        Y <= x"e3e2";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8ded";
        Y <= x"2b22";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0920") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e1ca";
        Y <= x"4c99";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"4c98") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"cc99";
        Y <= x"a088";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"5f78") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a8b8";
        Y <= x"79f9";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"a8b9") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e7ac";
        Y <= x"6420";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"9bdf") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"841e";
        Y <= x"1688";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"841f") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ed03";
        Y <= x"ce87";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b112";
        Y <= x"2a51";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"d5af") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3b37";
        Y <= x"1987";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"3b37") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6590";
        Y <= x"4a04";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"658f") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7f0b";
        Y <= x"5ad8";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"d9e3") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c439";
        Y <= x"d312";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"c43a") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a878";
        Y <= x"2c60";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"ac78") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e293";
        Y <= x"9eb2";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"e293") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ff2d";
        Y <= x"d149";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"d109") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d333";
        Y <= x"865c";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"d332") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3605";
        Y <= x"cdca";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"3604") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f01b";
        Y <= x"632e";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"5349") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"fd84";
        Y <= x"8c58";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"fd83") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1677";
        Y <= x"5dc2";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"41da";
        Y <= x"3855";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8d0a";
        Y <= x"8af7";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"72f5") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"672d";
        Y <= x"97a7";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"97a6") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8778";
        Y <= x"2255";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8b2b";
        Y <= x"3c88";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"c7b3") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"82a2";
        Y <= x"7905";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7d5d") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c362";
        Y <= x"a70b";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"1c57") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7029";
        Y <= x"0e28";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"702a") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c7dc";
        Y <= x"9bba";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"3824") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"980f";
        Y <= x"af0c";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"50f3") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6715";
        Y <= x"d56b";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f78b";
        Y <= x"c0e1";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"c081") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"028c";
        Y <= x"8587";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"8586") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2b9c";
        Y <= x"baa8";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"4557") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"73d5";
        Y <= x"40d8";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"bf27") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9437";
        Y <= x"28f3";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"9436") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2fea";
        Y <= x"24e7";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"24e8") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"bb1d";
        Y <= x"9318";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"9319") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f898";
        Y <= x"ea2a";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"fb3a";
        Y <= x"22a2";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"22a3") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7e95";
        Y <= x"d518";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"ff9d") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3f80";
        Y <= x"6d73";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"3f80") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"aac1";
        Y <= x"3b0b";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"aac2") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7fd7";
        Y <= x"d63f";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7fd8") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ef59";
        Y <= x"79c3";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8a22";
        Y <= x"4413";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"bbec") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0fef";
        Y <= x"1cda";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"1fff") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"89b1";
        Y <= x"236f";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"2370") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8de2";
        Y <= x"9729";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"8de1") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f6fc";
        Y <= x"33de";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"f6fc") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e17f";
        Y <= x"e17e";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"e17f") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b8af";
        Y <= x"d81f";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"e090") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d24a";
        Y <= x"a1bd";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"d24a") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"65d2";
        Y <= x"3ce3";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"28ef") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2142";
        Y <= x"9c50";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2143") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4877";
        Y <= x"9e58";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"9e59") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"37a9";
        Y <= x"ae23";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"2621") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"61b9";
        Y <= x"053a";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"a381") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d4b0";
        Y <= x"4a19";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"d4af") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2adf";
        Y <= x"bf5c";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"d520") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a891";
        Y <= x"f23e";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"b653") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c6cc";
        Y <= x"1b2a";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0208") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"aa26";
        Y <= x"c42b";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"c42b") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7d59";
        Y <= x"6c7d";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"e9d6") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9b6f";
        Y <= x"5c13";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"6490") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f1ef";
        Y <= x"77dd";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0074";
        Y <= x"fe4c";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0075") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"abaf";
        Y <= x"7204";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"8dfb") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0686";
        Y <= x"411c";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3a7d";
        Y <= x"ff7b";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"3a79") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"262e";
        Y <= x"44d2";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"bb2e") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"215b";
        Y <= x"e8a8";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0a03") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8453";
        Y <= x"b707";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"8403") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"68e9";
        Y <= x"6cb7";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"9717") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1b27";
        Y <= x"801f";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"1b27") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"cc75";
        Y <= x"14c0";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"14c1") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1cf8";
        Y <= x"8eab";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"8eac") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1d07";
        Y <= x"18b3";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"1db7") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"27fe";
        Y <= x"d39f";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"27ff") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2d4e";
        Y <= x"c373";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"2d4e") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4149";
        Y <= x"1f7b";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"1f7b") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2aec";
        Y <= x"2745";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2aed") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8d48";
        Y <= x"4120";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"4120") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"93d3";
        Y <= x"c9bc";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"8190") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d0af";
        Y <= x"432f";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"d0b0") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c473";
        Y <= x"4c34";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"3b8c") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2291";
        Y <= x"2dff";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"2091") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e1f3";
        Y <= x"7b09";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"e1f4") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"58a1";
        Y <= x"4a74";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"b58b") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c461";
        Y <= x"f7c6";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0839") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"590a";
        Y <= x"66bf";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"400a") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a64f";
        Y <= x"0716";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"60c7") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9518";
        Y <= x"3d63";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"6ae7") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"81b9";
        Y <= x"fee9";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"fee9") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a909";
        Y <= x"7cbc";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"7cbc") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"72a0";
        Y <= x"2ebd";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"d143") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e936";
        Y <= x"ce00";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"ce01") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a005";
        Y <= x"99e7";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"a005") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0db5";
        Y <= x"6a01";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"6a01") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3f61";
        Y <= x"ad3c";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d820";
        Y <= x"8c3e";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"8c3e") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5fb3";
        Y <= x"e3ac";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"435f") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c9f0";
        Y <= x"9081";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"6f7e") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"431e";
        Y <= x"6b54";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5b2a";
        Y <= x"04d6";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"a4d5") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"864d";
        Y <= x"5490";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"d6dd") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1047";
        Y <= x"68d9";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"1046") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6767";
        Y <= x"6edf";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"d646") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ca34";
        Y <= x"a8fd";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"a8fc") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5a60";
        Y <= x"c47e";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"5a5f") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7128";
        Y <= x"76f9";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"76fa") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e543";
        Y <= x"86d6";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"499d";
        Y <= x"6acf";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"6ace") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"588c";
        Y <= x"73ea";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"73e9") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2be7";
        Y <= x"a92c";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7d45") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7d6e";
        Y <= x"13f1";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"9683") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d416";
        Y <= x"4518";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"bae8") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8ac0";
        Y <= x"bc64";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"bc63") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"25d8";
        Y <= x"b522";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"b521") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"dda0";
        Y <= x"e42b";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"068b") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2a1e";
        Y <= x"e6de";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"bcc0") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7e5f";
        Y <= x"3148";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"ceb7") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e652";
        Y <= x"718f";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"74c3") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b242";
        Y <= x"2e93";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"83af") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f619";
        Y <= x"4bbc";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"f618") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d131";
        Y <= x"4ebe";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2ecf") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9745";
        Y <= x"342c";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e641";
        Y <= x"0fba";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"46bc";
        Y <= x"39f5";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4e4d";
        Y <= x"50a4";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0257") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4092";
        Y <= x"cad0";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e36f";
        Y <= x"f2c2";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"e36e") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"eddf";
        Y <= x"e25e";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0b81") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3ac8";
        Y <= x"961b";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"c538") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9419";
        Y <= x"5748";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"1408") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d6db";
        Y <= x"7ff4";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"a919") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"fee0";
        Y <= x"632d";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"ffed") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6a46";
        Y <= x"32e4";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"32e5") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7527";
        Y <= x"42a4";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"3283") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0cd4";
        Y <= x"7bfd";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"7bfd") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d5dd";
        Y <= x"8732";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"dd61";
        Y <= x"896c";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"229e") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"abb2";
        Y <= x"a2c1";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"a2c0") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3dd3";
        Y <= x"7fbf";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"8040") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1ff8";
        Y <= x"e966";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"1ff9") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c3b7";
        Y <= x"67ba";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"2b71") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"fb31";
        Y <= x"cd4b";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2de6") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"383c";
        Y <= x"0247";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0246") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"606e";
        Y <= x"fead";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"606d") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"76f0";
        Y <= x"9528";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"9529") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1c98";
        Y <= x"2fa3";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"2fa3") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e493";
        Y <= x"106a";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"f4fb") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6bf6";
        Y <= x"cd54";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"6bf6") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c77d";
        Y <= x"53d2";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"ac2e") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2cb6";
        Y <= x"6007";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8054";
        Y <= x"979a";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7fac") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"28cd";
        Y <= x"b3a6";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d654";
        Y <= x"37f9";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"37f8") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f228";
        Y <= x"570a";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"4932") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4511";
        Y <= x"d532";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"6fdf") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d561";
        Y <= x"89f9";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2a9e") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4bf2";
        Y <= x"362d";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"362c") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f2a8";
        Y <= x"4286";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"bd79") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3587";
        Y <= x"1dcc";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"e234") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"bd1a";
        Y <= x"a721";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"643b") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"72e5";
        Y <= x"3043";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"8d1b") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1cf6";
        Y <= x"ba87";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ba87") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a0fb";
        Y <= x"db97";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"5f04") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e7a8";
        Y <= x"e40a";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"94b0";
        Y <= x"77a1";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0c51") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8556";
        Y <= x"aee0";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"aff6") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e20b";
        Y <= x"e5a6";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2c11";
        Y <= x"972d";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"6b1c") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8300";
        Y <= x"6183";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"8300") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e3f5";
        Y <= x"f196";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"144a";
        Y <= x"2a19";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2139";
        Y <= x"e367";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"e367") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6b75";
        Y <= x"5f1a";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ca8f") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"10ac";
        Y <= x"4112";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"beed") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6b8d";
        Y <= x"f16a";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"9473") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ac8c";
        Y <= x"6f32";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"6f32") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1c31";
        Y <= x"b0ad";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"04ee";
        Y <= x"b27c";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"b27c") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1834";
        Y <= x"b138";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"b138") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0e39";
        Y <= x"c3ad";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1d4e";
        Y <= x"76eb";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"e2b2") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9ec9";
        Y <= x"d24d";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"d24c") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"cba9";
        Y <= x"4577";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"cfff") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"fdc4";
        Y <= x"4a1d";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2726";
        Y <= x"7bc3";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"a2e9") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ca06";
        Y <= x"e341";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"e341") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8f89";
        Y <= x"9a13";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"9a12") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"466f";
        Y <= x"6831";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"aea0") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"984a";
        Y <= x"2f9c";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"68ae") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c6f1";
        Y <= x"16cf";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"16cf") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f312";
        Y <= x"e707";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"f717") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"cc2e";
        Y <= x"c1bd";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b21a";
        Y <= x"5dd9";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"b21a") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5b25";
        Y <= x"5746";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"fc21") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8d24";
        Y <= x"9cec";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"9ced") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5de2";
        Y <= x"a5f6";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"4814") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9185";
        Y <= x"f04e";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"241e";
        Y <= x"8f95";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"8f95") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4ca5";
        Y <= x"e8f0";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"3595") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"bddf";
        Y <= x"0f6f";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"4220") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ad97";
        Y <= x"9996";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"def6";
        Y <= x"81c1";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"a2cb") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d2a4";
        Y <= x"5b10";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"19e1";
        Y <= x"b751";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"48af") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"eb9e";
        Y <= x"ff9a";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"1462") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a3ee";
        Y <= x"5521";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"5520") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"dc41";
        Y <= x"7aef";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0fad";
        Y <= x"3d7c";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0fae") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5235";
        Y <= x"79eb";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"79eb") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f4fa";
        Y <= x"f44f";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0bb0") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"66b0";
        Y <= x"25fd";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"25fc") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6594";
        Y <= x"5848";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"5848") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"422d";
        Y <= x"828e";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"c2af") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8add";
        Y <= x"5b27";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7523") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"40c4";
        Y <= x"4b25";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"4b25") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e922";
        Y <= x"122e";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"e923") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ded9";
        Y <= x"971e";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ded9") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4d2e";
        Y <= x"1d00";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"1d00") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4b75";
        Y <= x"6385";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"b48a") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d32e";
        Y <= x"77bf";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"081e";
        Y <= x"2790";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"2fae") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e744";
        Y <= x"cda3";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"cda3") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"139a";
        Y <= x"474a";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f161";
        Y <= x"bbf7";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0e9e") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5bb9";
        Y <= x"de07";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7db2") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9506";
        Y <= x"82c7";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"9505") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4541";
        Y <= x"8092";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8a3b";
        Y <= x"c7ce";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"3831") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3063";
        Y <= x"a7f5";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"cf9c") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"815d";
        Y <= x"2081";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"2081") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1eb7";
        Y <= x"6a79";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"1eb6") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a79c";
        Y <= x"495e";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"5864") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d63e";
        Y <= x"eb5b";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4133";
        Y <= x"8770";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"19eb";
        Y <= x"5ba5";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"5ba4") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d04f";
        Y <= x"a32d";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"a32c") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c298";
        Y <= x"7784";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"7785") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8358";
        Y <= x"98b4";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"1c0c") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d76e";
        Y <= x"252d";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3a9c";
        Y <= x"ae57";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"51a9") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e004";
        Y <= x"eca0";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"e000") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8cde";
        Y <= x"a6d2";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"55c3";
        Y <= x"c0e8";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"aa3d") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c1f5";
        Y <= x"07b5";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"c9aa") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"85e3";
        Y <= x"5fec";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"da09") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e00d";
        Y <= x"594b";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6cd9";
        Y <= x"0a81";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0881") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0d08";
        Y <= x"8ffe";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"8ffe") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5366";
        Y <= x"b1e6";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"4e1a") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"cbbd";
        Y <= x"6cc8";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"a10b") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4a02";
        Y <= x"08b3";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"beb1") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"89e6";
        Y <= x"5d7c";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"a283") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d514";
        Y <= x"20dd";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"d513") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2525";
        Y <= x"d3e0";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2c20") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4593";
        Y <= x"0765";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0765") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"eb8b";
        Y <= x"2f0d";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"bc7e") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f259";
        Y <= x"092a";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0da6") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8607";
        Y <= x"869e";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"869f") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"dfeb";
        Y <= x"eff0";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"efef") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"78fa";
        Y <= x"ce53";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0756";
        Y <= x"621c";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"9de4") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6de8";
        Y <= x"bfd4";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"2dc0") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7483";
        Y <= x"7f8d";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"f4f6") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f04f";
        Y <= x"1ef0";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2ea1") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e90e";
        Y <= x"f070";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"e90e") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e919";
        Y <= x"fec1";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"564f";
        Y <= x"3ceb";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"5650") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f82b";
        Y <= x"2c4a";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"f82a") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7742";
        Y <= x"dbee";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7743") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"bc64";
        Y <= x"0603";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ed73";
        Y <= x"12dd";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ed72") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"59c0";
        Y <= x"620a";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"a640") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f58e";
        Y <= x"b192";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"b193") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5688";
        Y <= x"7045";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"5689") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0dc9";
        Y <= x"02fd";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0dc9") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5d4a";
        Y <= x"16d6";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"5d4b") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4f41";
        Y <= x"49e3";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"067d";
        Y <= x"86e1";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"8d5e") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c490";
        Y <= x"5f7c";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"3b6f") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8482";
        Y <= x"0fc5";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"f03b") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e105";
        Y <= x"36c6";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"1efa") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"39d5";
        Y <= x"144d";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"020d";
        Y <= x"75a1";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7394") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b309";
        Y <= x"c086";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"3f7a") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8a3c";
        Y <= x"5989";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1fd5";
        Y <= x"a5fa";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"e02a") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"562d";
        Y <= x"7344";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"7343") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b58b";
        Y <= x"5214";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"5214") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"55ab";
        Y <= x"a85a";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"ad51") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7cce";
        Y <= x"bda3";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2f81";
        Y <= x"d3e6";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2c19") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"29ac";
        Y <= x"e173";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0b1f") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8a47";
        Y <= x"eebc";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"75b8") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0be0";
        Y <= x"b3d0";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0be1") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3b80";
        Y <= x"6e77";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7ff7") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0403";
        Y <= x"d926";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"fbfd") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ab08";
        Y <= x"0bd8";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ab08") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ef0c";
        Y <= x"81f1";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ef0c") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a7e7";
        Y <= x"e07f";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"a7e7") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3707";
        Y <= x"2c96";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"c8f9") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"acfd";
        Y <= x"3f38";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"acfc") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6914";
        Y <= x"e1d7";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"6114") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0eba";
        Y <= x"d5a2";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"d5a1") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b73d";
        Y <= x"0ff3";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0731") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a3cf";
        Y <= x"25d9";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"dbcb";
        Y <= x"c1d5";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"c1c1") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9ae4";
        Y <= x"7b2b";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"84d4") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e7dd";
        Y <= x"6ccf";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"e7de") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4519";
        Y <= x"fd3e";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"451a") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"cfd9";
        Y <= x"8a16";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"ba3d") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"bdaa";
        Y <= x"6b06";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"ffae") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"063d";
        Y <= x"6cf5";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"6cf5") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0df6";
        Y <= x"4004";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b587";
        Y <= x"97ed";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a497";
        Y <= x"73e4";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"5b69") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3315";
        Y <= x"1be7";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"1be6") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2f2a";
        Y <= x"650b";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"9af4") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3c6c";
        Y <= x"65bf";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0bb7";
        Y <= x"6dc1";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"6ff7") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"446e";
        Y <= x"3144";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"3144") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a6f8";
        Y <= x"8f72";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"5907") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"bacd";
        Y <= x"43dc";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"76f1") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"fdcf";
        Y <= x"6d46";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"6d46") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0600";
        Y <= x"c152";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"44ae") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e39d";
        Y <= x"8897";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"1c63") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"217e";
        Y <= x"dc64";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"dc63") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6449";
        Y <= x"3521";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"d0d8") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b3cf";
        Y <= x"2b60";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7791") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"afc7";
        Y <= x"7c96";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5a5a";
        Y <= x"65b7";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"9a48") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c8ec";
        Y <= x"7dd6";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"3713") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ce2e";
        Y <= x"476a";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ef2c";
        Y <= x"fc33";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"fc33") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"555f";
        Y <= x"ada0";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"02ff") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"bf58";
        Y <= x"ba8e";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ba8d") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d61a";
        Y <= x"ef15";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a80b";
        Y <= x"277f";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"2780") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"048e";
        Y <= x"879e";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"8310") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6b18";
        Y <= x"039c";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0318") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"60d3";
        Y <= x"8583";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0b60";
        Y <= x"f4e5";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0b61") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4670";
        Y <= x"72f9";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"cf4c";
        Y <= x"c994";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"fa48") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8f6a";
        Y <= x"6235";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"9dca") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4d09";
        Y <= x"63e4";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"9c1c") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d8e4";
        Y <= x"976f";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"9770") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e400";
        Y <= x"ec95";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"136a") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"36f5";
        Y <= x"a20f";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"c90a") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9f8e";
        Y <= x"a30f";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b776";
        Y <= x"4c35";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0603";
        Y <= x"9b81";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"9b82") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e4ac";
        Y <= x"1302";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"f7ae") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ba3b";
        Y <= x"44e2";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"bb1e") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8d37";
        Y <= x"34b3";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"c1ea") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f0bf";
        Y <= x"b2b2";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"4d4d") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2dcf";
        Y <= x"aebc";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ac39";
        Y <= x"14f8";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ac39") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2618";
        Y <= x"acd9";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a800";
        Y <= x"d506";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2af9") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d9b4";
        Y <= x"bd3d";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"fdbd") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4301";
        Y <= x"73b4";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"b6b5") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"947e";
        Y <= x"211f";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"947d") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"bf25";
        Y <= x"b36a";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"f445") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4b68";
        Y <= x"bd63";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"429c") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1326";
        Y <= x"068f";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0c97") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1a1b";
        Y <= x"51e4";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"6bff") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"20b7";
        Y <= x"d369";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"4d4e") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ee07";
        Y <= x"955c";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"ee08") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"468c";
        Y <= x"3128";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"ea9c") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"50f8";
        Y <= x"e284";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"4080") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5c20";
        Y <= x"c245";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"c246") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a47c";
        Y <= x"0438";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"5fbc") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9664";
        Y <= x"72fa";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"1260") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"eab2";
        Y <= x"1610";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"d4a2") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8be6";
        Y <= x"c53e";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"8be7") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f59d";
        Y <= x"1fd2";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"f59e") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"da6b";
        Y <= x"da2d";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"25fe";
        Y <= x"2148";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"04b6") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d064";
        Y <= x"8fcf";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"8044") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"febc";
        Y <= x"5e64";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"5e64") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d615";
        Y <= x"1ee9";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"e116") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"86d8";
        Y <= x"b28d";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"b28e") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"864b";
        Y <= x"1f80";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"864a") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"53ab";
        Y <= x"1784";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"53aa") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"313d";
        Y <= x"98fa";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"313c") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6c7d";
        Y <= x"ae21";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"51de") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"22fe";
        Y <= x"072c";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"072d") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9687";
        Y <= x"edb1";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"edb1") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"dff0";
        Y <= x"608b";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"dff0") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d82c";
        Y <= x"eab0";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"eaaf") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d4e3";
        Y <= x"aa64";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"fee7") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"824a";
        Y <= x"63c2";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1931";
        Y <= x"ecc1";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"133e") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4eed";
        Y <= x"1916";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"b113") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"fef7";
        Y <= x"667f";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"feff") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ec42";
        Y <= x"d927";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"26d9") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"aecc";
        Y <= x"d5c7";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2a39") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"217e";
        Y <= x"f7e2";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"d664") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"4ab9";
        Y <= x"7152";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e598";
        Y <= x"9eab";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"9eab") then
            report "Error in outcome (y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"12c0";
        Y <= x"5c93";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"81b5";
        Y <= x"13fc";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"95b1") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7acc";
        Y <= x"5edd";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"d9a9") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"69a6";
        Y <= x"a430";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"a431") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5e63";
        Y <= x"c287";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"5e64") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0464";
        Y <= x"d92a";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"d92b") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"13b7";
        Y <= x"bfa7";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"13b6") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b960";
        Y <= x"cd82";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"1422") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b472";
        Y <= x"ac3b";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"b473") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a24e";
        Y <= x"6db2";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"5db2") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"940e";
        Y <= x"1c52";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"8844") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"edb2";
        Y <= x"994b";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"994a") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a6f7";
        Y <= x"ea19";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"bcde") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d2b0";
        Y <= x"ca2e";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"35d1") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2c03";
        Y <= x"99e4";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"c5e7") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"876a";
        Y <= x"67f9";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"67fa") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b1fa";
        Y <= x"e8c5";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"e8c4") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"1e9d";
        Y <= x"27a8";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"d857") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a87d";
        Y <= x"2f81";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"d7fe") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8ff1";
        Y <= x"ab99";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"8b91") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"38ba";
        Y <= x"646d";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"9d27") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c48a";
        Y <= x"0e4b";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0e4a") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"13b1";
        Y <= x"bc86";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"437a") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e125";
        Y <= x"e131";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"e135") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e21f";
        Y <= x"9a91";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"b872") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7f24";
        Y <= x"b574";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"4a8c") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3eb8";
        Y <= x"7680";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c857";
        Y <= x"1dd3";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"e62a") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"90f2";
        Y <= x"10ea";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"90f2") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"c1b9";
        Y <= x"11a1";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"df59";
        Y <= x"048d";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2534") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d1d2";
        Y <= x"081e";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b953";
        Y <= x"1f68";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"83dd";
        Y <= x"6c55";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"83dd") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0bac";
        Y <= x"3267";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"cd99") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7cde";
        Y <= x"04ff";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7cff") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"249a";
        Y <= x"0770";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"f890") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d0c9";
        Y <= x"4763";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"b89c") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0b7d";
        Y <= x"c1e8";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"f483") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8f67";
        Y <= x"59ea";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5530";
        Y <= x"eb35";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"14ca") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f542";
        Y <= x"d244";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"d243") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7228";
        Y <= x"a580";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"934c";
        Y <= x"599d";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ece9") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"f602";
        Y <= x"a19e";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"09fe") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6dcc";
        Y <= x"fa1a";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"ffde") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8bd6";
        Y <= x"16e6";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"9ff6") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7a2a";
        Y <= x"a3ba";
        zx <= '0';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7a2b") then
            report "Error in outcome (inc x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (inc x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"be88";
        Y <= x"50b6";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"af49") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"21f6";
        Y <= x"8aed";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"8aec") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"87f2";
        Y <= x"0568";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0567") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"548d";
        Y <= x"b40e";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"089b") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"fe9d";
        Y <= x"b1c7";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"4cd6") then
            report "Error in outcome (sub x-y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub x-y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub x-y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0bcb";
        Y <= x"80a2";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d483";
        Y <= x"7a2c";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2b7d") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"9a74";
        Y <= x"c0f8";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2684") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"bae6";
        Y <= x"576d";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"0001") then
            report "Error in outcome (one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"dbe5";
        Y <= x"d5ea";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        wait for 1 ns;
        if (Z /= x"d5eb") then
            report "Error in outcome (inc y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (inc y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (inc y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8554";
        Y <= x"e139";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"1ec6") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e494";
        Y <= x"f923";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"8009";
        Y <= x"bdd8";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"83f2";
        Y <= x"2267";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"dd99") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b3fa";
        Y <= x"fb43";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"4c06") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"df0f";
        Y <= x"0df7";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"df0e") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"db2d";
        Y <= x"03d7";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"df04") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ee1d";
        Y <= x"0192";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ee1c") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7fe1";
        Y <= x"3a8a";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"801f") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5110";
        Y <= x"ce21";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"7d11") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"ff18";
        Y <= x"9781";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"687f") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"e0e3";
        Y <= x"8cff";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"1f1d") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"7c53";
        Y <= x"69d5";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"962a") then
            report "Error in outcome (not y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"6b6c";
        Y <= x"14ff";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"eb01") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"aa46";
        Y <= x"67b1";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"67b0") then
            report "Error in outcome (dec y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (dec y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"fde0";
        Y <= x"0cd9";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0cc0") then
            report "Error in outcome (and)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (and)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (and)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"43f1";
        Y <= x"0145";
        zx <= '1';
        zy <= '1';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"0000") then
            report "Error in outcome (zero)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '1') then
            report "Error in zero flag (zero)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (zero)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a2ed";
        Y <= x"9763";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"a2ed") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0060";
        Y <= x"96cb";
        zx <= '1';
        zy <= '0';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"6935") then
            report "Error in outcome (minus y)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus y)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (minus y)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"d11e";
        Y <= x"e072";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"d11d") then
            report "Error in outcome (dec x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (dec x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (dec x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"0892";
        Y <= x"5cd9";
        zx <= '1';
        zy <= '1';
        nx <= '1';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"ffff") then
            report "Error in outcome (minus one)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minus one)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minus one)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a311";
        Y <= x"08b6";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"abb7") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3eb2";
        Y <= x"d076";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"c14d") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"95c3";
        Y <= x"bd69";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"95c3") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"a527";
        Y <= x"d15b";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"2c34") then
            report "Error in outcome (sub y-x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (sub y-x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (sub y-x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2f9b";
        Y <= x"74ae";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"2f9b") then
            report "Error in outcome (x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"2939";
        Y <= x"0aab";
        zx <= '0';
        zy <= '0';
        nx <= '0';
        ny <= '0';
        f <= '1';
        no <= '0';
        wait for 1 ns;
        if (Z /= x"33e4") then
            report "Error in outcome (add)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (add)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (add)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"5589";
        Y <= x"914c";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '1';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"aa77") then
            report "Error in outcome (minux x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (minux x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (minux x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"b045";
        Y <= x"2edd";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"bedd") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;

        X <= x"3001";
        Y <= x"1bfa";
        zx <= '0';
        zy <= '0';
        nx <= '1';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"3bfb") then
            report "Error in outcome (or)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (or)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '0') then
            report "Error in negative flag (or)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;



            report "Simulation done (correct / incorrect): ";
            report "  outcome: " & integer'image(v_correct_z) & "/" & integer'image(v_incorrect_z);
            report "  zero flag: " & integer'image(v_correct_zr) & "/" & integer'image(v_incorrect_zr);
            report "  negative flag: " & integer'image(v_correct_ng) & "/" & integer'image(v_incorrect_ng);

        wait;
    end process;


    -------------------------------------------------------------------------------
    -- DUT
    -------------------------------------------------------------------------------
    DUT: component alu port map(
        X => X,
        Y => Y,
        Z => Z,
        zx => zx,
        zy => zy,
        nx => nx,
        ny => ny,
        f => f,
        no => no,
        zr => zr,
        ng => ng
    );

end Behavioural;
