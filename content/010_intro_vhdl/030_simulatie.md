---
title: 'Simulatie'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 30
draft: false
---

Hoe kan er nu getest worden of onze **nand** poort correct werkt? We zouden een ASIC kunnen maken, maar dat zou een veel te dure en tijdrovende manier zijn. 

Een realistischere manier is om het design te implementeren op een FPGA, maar er is nog een gemakkelijkere en nuttigere manier: **testbenches**.

Het idee achter een testbench is dat er "toestellen" zijn die inputs (ook stimuli genoemd) kunnen genereren. Vervolgens kunnen de waveforms van het hele design visueel geanalyseerd worden én kan de output van een component geverifieerd worden.

In dit opleidingsonderdeel *krijgen* jullie vaak de testbenches, maar het is goed om deze zelf aan te passen of uit te breiden.


## Voorbeeld: testbench voor een NAND poort


### Maken van een testbench
Met onderstaande testbench kunnen we testen of onze nand poort werkt. Er moet een nieuwe **simulation source** aangemaakt worden en onderstaande testbench dient hierin geplakt te worden. Merk op dat **ook de testbench** geschreven is in (V)HDL.

{{% multiHcolumn %}}
{{% column %}}
#### Commentaar
Alhoewel dit geen verplicht stuk is, is het altijd nuttig om commentaar te voorzien. 

#### Gebruik packages
Deze testbench begint, net zoals de componenten, met het gebruiken van een **package** (STD_LOGIC_1164) uit een **library** (IEEE). Dit is uiteraard nodig omdat we anders geen definitie hebben van wat een STD_LOGIC type is.

#### Een lege entitity

Vervolgens is er ook een **entity** block. Merk hier zeker bij op dat een testbench typisch **GEEN** input en/of output poorten heeft.

#### Declaraties
In de architecture gebeuren opnieuw eerst enkele declaraties. Zowel de component als de gebruikte signalen dienen gedeclareerd te worden.


#### DUT
Er wordt een component **instantiatie** gemaakt van de *nand_gate* in deze testbench. De naam van deze instantie is DUT, wat een acronym is van *Device Under Test*. UUT (Unit Under Test) wordt ook soms gebruikt

#### Stimuli
Tenslotte is er nog één blok dat de stimuli beschrijft. Dit is een speciaal soort blok (een **process**) waar we later nog op terug komen. Wat er tussen de begin en end van een process beschreven staat, wordt sequentieel overlopen (hiermee wordt bedoeld: zoals bij een C-programma). Wees er echter van bewust dat de hele process-block **TEGELIJKERTIJD** loopt met de DUT.

De correcte werking van de NAND poort wordt in deze testbench nagegaan door alle mogelijke logische combinaties aan te leggen aan de ingangen van nullen en enen.

{{% /column %}}
{{% column %}}
{{< highlight vhdl >}}
--------------------------------
-- KU Leuven - ESAT/COSIC - ES&S
--------------------------------
-- Module Name:     nand_tb - Behavioural
-- Project Name:    Digitale eletronische schakelingen
-- Description:     Testbench for nand
--
-- Revision     Date       Author     Comments
-- v1.0         20240118   VlJo       Initial version
--
--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.NUMERIC_STD.ALL;

entity nand_tb is
end entity nand_tb;

architecture Behavioural of nand_tb is

    component nand_gate is
        port(
            A: IN STD_LOGIC;
            B: IN STD_LOGIC;
            Z: OUT STD_LOGIC
        );
    end component nand_gate;

    signal input_a, input_b : STD_LOGIC;
    signal output_z : STD_LOGIC;

begin
    --------------------------------
    -- STIMULI
    --------------------------------
    PSTIM: process
    begin
        input_a <= '0';
        input_b <= '0';
        wait for 10 ns;

        input_a <= '1';
        input_b <= '0';
        wait for 10 ns;

        input_a <= '0';
        input_b <= '1';
        wait for 10 ns;

        input_a <= '1';
        input_b <= '1';
        wait for 10 ns;
        
        wait;
    end process;

    --------------------------------
    -- DUT
    --------------------------------
    DUT: component nand_gate port map(
        A => input_a,
        B => input_b,
        Z => output_z
    );

end Behavioural;

{{< /highlight >}}
{{% /column %}}

{{% /multiHcolumn %}}

Om een testbench toe te voegen aan het Vivado project is het belangrijk erop te letten dat je een **Simulation** source toevoegd. In deze testbench kan je vervolgens bovenstaande code plakken.


### Runnen van een testbench

Als alle code beschreven is, kan de bovenstaante simulatie uitgevoerd worden. Er zijn meerdere manieren om een simulatie te starten en deze zul je ontdekken doorheen de labs.

De gemakkelijkste manier is om in de **Flow Navigator** (de verticale balk aan de linkerkant van het scherm) te klikken op: **Run simulation**. Als alles goed loop zou je (ongeveer) onderstaand scherm moeten krijgen.

{{% figure src="/images/intro/simulation.png" title="Simulatie van de nand gate met Vivado"  %}}

Je ziet hierin de inputs en de output van de DUT. De tijd verstrijkt over de X-as. Als beide inputs of één van beide inputs 'hoog' is, is de uitgang ook 'hoog'. Indien beide ingangen 'hoog' zijn, is de uitgang 'laag'.

Dat is exact wat een NAND poort moet doen !! *(gelukkig)*

Als het design gesimuleerd wordt met een open-source simulator krijgen we een identiek resultaat.
{{% figure src="/images/screenshots/sim_nand.png" title="Simulatie van de nand gate met GHDL en GTKWave"  %}}
