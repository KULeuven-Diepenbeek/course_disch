---
title: 'Simulatie'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 30
draft: false
---

Hoe zijn we nu zeker dat onze nand poort correct werkt? We zouden een ASIC kunnen maken, maar dat zou een veel te dure en tijdrovende manier zijn. 

Een realistischer stap is om het design te implementeren op een FPGA, maar er is nog een gemakkelijkere en nuttigere manier: **testbenches**.

Het idee achter een testbench is dat er "machines" zijn die inputs (ook stimuli) kunnen genereren. Vervolgens kunnen de waveforms van het hele design geanalyseerd worden én kan de output van een component geverifieerd worden.

In dit opleidingsonderdeel *krijgen* jullie vaak de testbenches, maar soms kan het handig zijn om deze zelf aan te passen of uit te breiden.


## Voorbeeld: testbench voor een NAND poort


### Maken van een testbench
Met **onderstaande testbench** kunnen we **testen** of onze **nand poort werkt**. Je moet een nieuwe simulation file maken en onderstaande testbench erin plakken. Merk op dat **ook de testbench** geschreven is in (V)HDL.

{{% multiHcolumn %}}
{{% column %}}
{{< highlight vhdl >}}
library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;

entity tb_nand is
  -- let op ... hier zijn GEEN poorten
end tb_nand;

architecture Behavioral of tb_nand is
    component nand_gate is
      Port (
          A : in std_logic; 
          B : in std_logic;
          Y : out std_logic
      );
    end component;

    signal input1, input2, output : std_logic;

begin
    DUT: nand_gate port map(
        A => input1,
        B => input2,
        Y => output
    );

    PSTIM: process
    begin
        input1 <= '0';
        input2 <= '0';
        wait for 10ns;

        input1 <= '1';
        input2 <= '0';
        wait for 10ns;

        input1 <= '0';
        input2 <= '1';
        wait for 10ns;

        input1 <= '1';
        input2 <= '1';
        wait for 10ns;

    end process;

end Behavioral;
{{< /highlight >}}
{{% /column %}}
{{% column %}}
Deze testbench begint, net zoals de componenten, met het gebruiken van een **package** (STD_LOGIC_1164) uit een **library** (IEEE).

Vervolgens is er ook een **entity** block. Merk hier zeker bij op dat een testbench **GEEN** input en/of output poorten heeft.

In de architecture gebeuren er weer declaraties van de component en van signalen.

Er wordt 1 component **instantiatie** gemaakt van de *nand_gate* in deze testbench. De naam van deze instantie is DUT, wat een acronym is van *Device Under Test*.

Tenslotte is er nog 1 blok dat de stimuli beschrijft. Dit is een speciaal soort blok (een **process**) waar we later nog op terug komen. Wat er tussen de begin en end van een process beschreven staat, wordt sequentieel overlopen. Wees er echte van bewust dat de hele process-block **TEGELIJKERTIJD** loopt met de DUT.

De correcte werking van de NAND poort wordt in deze testbench nagegaan door alle mogelijke logische combinatie aan te leggen aan de ingangen.

{{% /column %}}
{{% /multiHcolumn %}}

Om een testbench toe te voegen aan het Vivado project is het belangrijk erop te letten dat je een **Simulation** source toevoegd. In deze testbench kan je vervolgens bovenstaande code plakken.


### Runnen van een testbench

Als alle code beschreven is, kan de bovenstaante simulatie uitgevoerd worden. Er zijn meerdere manieren om een simulatie te starten en deze zul je (mogelijks) ontdekken doorheen de labs.

De gemakkelijkste manier is om in de **Flow Navigator** (de verticale balk aan de linkerkant van het scherm) te klikken op: **Run simulation**. Als alles goed loop zou je (ongeveer) onderstaand scherm moeten krijgen.

![Wave forms](/images/intro/simulation.png)

Je ziet hierin de inputs en de outputs van de DUT. De tijd verstrijkt over de X-as. Als beide inputs of één van beide inputs 'hoog' is, is de uitgang ook 'hoog'. Indien beide ingangen 'hoog' zijn, is de uitgang 'laag'.

Dat is exact wat een NAND poort moet doen !! *(gelukkig)*

### synthesisable subset

Het is belangrijk om te weten dat **niet alle VHDL code synthesisable** is. Maar een subset van de VHDL kan worden omgezet in hardware. Hierdoor hebben we meer mogellijkheden in bv. testbenches.

![Screenshot Vivado](/images/intro/VHDL_synth_subset.svg)

#### Enkele Voorbeelden van functies enkel mogellijk in testbench:
{{% highlight vhdl %}}
wait for 10ns;
wait until ready = '1';

for i in 1 to 10 loop
    test_signaal <= NOT test_signaal;
    wait for 10ns;
end loop;
...
{{% /highlight %}}