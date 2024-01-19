---
title: 'Opdracht 2: Ripple carry adder'
pre: "<i class='fas fa-pen-square'></i> "
chapter: false
weight: 90
draft: false
---

In deze opdracht moet je een **8 bit ripple-carry adder** te maken. Indien je vergeten bent hoe een full adder en een half adder eruit zien, kan je kijken naar onderstaande schema's. Bij een ripple-carry adder wordt de C out van de eerste adder doorgegeven aan de tweede adder. We werken in little endian.

Het is **niet** de bedoeling dat je de + operator gebruikt van "std_logic_unsigned"  of "std_logic_signed"!


{{% figure src="/images/half_adder.png" title="Half adder, met S = A &oplus; B"  %}}
{{% figure src="/images/full_adder.png" title="Full adder"  %}}
<!-- {{% figure src="/images/ripple_carry_adder.png" title="ripple carry adder"  %}} -->

{{% notice warning %}}
Het is altijd een goed idee om eerst een tekening te maken voordat je begint met typen.
{{% /notice %}}

## Testbench

Hieronder staat een voorbeeld van een testbench. Vaak is het interesant om enkele specifieke stimuli te hebben tijdens de ontwikkeling. Indien het mogelijk is (zoals hier het geval is), is het ook een optie om simpelweg ALLE opties te verifiëren. Omdat dergelijk bestand nogal groot wordt, is hieronder een verkorte versie weergegeven. De volledige testbench kan [hier](/hdlsrc/rca_tb.vhd) gedownload worden.

```vhdl
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
        WIDTH : natural := 8
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

    signal A : STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    signal B : STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    signal S : STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    signal C : STD_LOGIC;

begin

    -------------------------------------------------------------------------------
    -- STIMULI
    -------------------------------------------------------------------------------
    PSTIM: process
    begin
        -- waardes bij het begin
        A <= x"00";
        B <= x"00";
        wait for 3 ns;
        assert (S = x"00") report "Error in sum" severity note;
        assert (C = '0') report "Error in carry" severity note;
        wait for 2 ns;

        -- waardes interessant voor ontwikkeling
        A <= x"03";
        B <= x"27";
        wait for 3 ns;
        assert (S = x"2A") report "Error in sum" severity note;
        assert (C = '0') report "Error in carry" severity note;
        wait for 2 ns;

        -- waardes om 'alles' te coveren
        A <= x"00";
        B <= x"00";
        wait for 3 ns;
        assert (S = x"00") report "Error in sum" severity note;
        assert (C = '0') report "Error in carry" severity note;
        wait for 2 ns;

        B <= x"01";
        wait for 3 ns;
        assert (S = x"01") report "Error in sum" severity note;
        assert (C = '0') report "Error in carry" severity note;
        wait for 2 ns;

        B <= x"02";
        wait for 3 ns;
        assert (S = x"02") report "Error in sum" severity note;
        assert (C = '0') report "Error in carry" severity note;
        wait for 2 ns;

        ...

        wait;
    end process;

    -------------------------------------------------------------------------------
    -- DUT
    -------------------------------------------------------------------------------
    DUT: component rca port map(
        A => A,
        B => B,
        S => S,
        C => C
    );

end Behavioural;
```