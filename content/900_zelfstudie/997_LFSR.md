---
title: 'Linear feedback shift register'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 997
draft: false
---

Als we een sequentie van **getallen** willen **genereren**, kunnen we een LFSR (linear feedback shift register) gebruiken. Een LFSR is een shift register, waarbij de inschuivende bit elke klokcyclus gelijk is aan de XOR van een aantal bits in de interne toestand. Op <a href="https://en.wikipedia.org/wiki/Linear-feedback_shift_register#Example_polynomials_for_maximal_LFSRs"> wikipedia </a> staat uitgelegd welke bits er genomen moeten worden bij iedere grootte van LFSR.

{{% figure src="/images/900/920_vhdl/LFSR_wiki.png" %}}
<div class="source">
Voorbeeld 16 bit LFSR. Bron: <a href="https://en.wikipedia.org/wiki/Linear-feedback_shift_register#/media/File:LFSR-F16.svg"> Wikipedia </a>
</div>

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity LFSR is
    port(   clk: in std_logic;
            load_data: in std_logic;
            reset: in std_logic;
            data_out: out std_logic_vector(15 downto 0));
end LFSR;

architecture arch_LFSR of LFSR is
    signal shift_register: std_logic_vector(15 downto 0);
begin
    p_comb_reg: process(clk)
    begin
        if clk'event and clk = '1' then
            if reset = '1'  then
                shift_register <= (others => '1'); --we resetten naar 1, anders loopt de LFSR vast
            else
                shift_register(0) <= shift_register(10) XOR shift_register(12) XOR shift_register(13) XOR shift_register(15);
                shift_register(15 downto 1) <= shift_register(14 downto 0);
            end if;
        end if;
    end process;
    data_out <= shift_register;
end arch_LFSR;
```

{{% notice warning %}}
Een LFSR gebaseerd op **XOR** blijft **stilstaan** als **alle bits 0** zijn. Als we dit niet willen kunnen in de plaats **XNOR** poorten gebruiken. Hierdoor blijft alles stilstaan als **alle bits 1** zijn.
{{% /notice %}}