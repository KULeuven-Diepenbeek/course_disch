---
title: 'Eerste project'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 10
draft: false
---

## Maak een project

Allereerst moet een **Vivado project** aangemaakt worden. Uiteraard begin je met Vivado op te starten en te klikken op **create project**. Je geeft het project een naam en zorgt dat je het op een plaats zet waar je het nog kan terugvinden. Bij project type zeggen we **RTL project** en vinken we **"Do not specify sources at this time"** aan. 

De volgende keuze die gemaakt moet worden is het type van FPGA. Als *part* maakt het niet veel uit wat we kiezen. Het beste is om een **FPGA** te kiezen die **gratis** is te gebruiken met Vivado zoals de **xc7z020**.

{{% notice tip %}}
Let er op dat je in het pad naar je Vivado project <b>geen spaties</b> hebt!! Dus, geen paden zoals <b>"C:\school\2e jaar\disch"</b> of <b>"C:\mijn documenten\demo"</b>
{{% /notice  %}}

Nu krijg je een omgeving die er (ongeveer) zo uit ziet.
{{% figure src="/images/100/screenshot_vivado.png" title="AMD's Vivado ontwikkelomgeving" %}}

## Voeg HDL code toe

Na het maken van een project, kan HDL code toevoegen. Dit kan via de link **Add sources**. Vervolgens komt er een keuze om een **nieuw** bestand te maken of om een **reeds bestaande** file toe te voegen. Kies voor een **nieuwe file** en voeg een **vhdl** design source toe. De tool vraagt vervolgens voor I/O port definitions, die kan je al instellen bij het maken van de vhdl file, maar kunnen later ook nog aangepast worden in de code zelf.

Merk op dat Vivado je al een kleine aanzet geeft om van te beginnen. Onderstaande VHDL-code geeft een beschrijving zorgt voor een **invertor** die, zoals verwacht, de ingang geïnverteerd doorgeeft aan de uitgang.

{{< include_file "/static/hdlsrc/100/invertor.vhd" "vhdl" >}}

Dit is een eenvoudige VHDL beschrijving en we nemen deze in detail onder de loep.

{{% multiHcolumn %}}
{{% column %}}
{{< highlight vhdl >}}
entity invertor is
    Port (
        A: in std_logic;
        Z: out std_logic
    );
end invertor;
{{< /highlight >}}
{{% /column %}}
{{% column %}}
De **entity** definieert de input en de outputs van het (sub-)design dat we beschrijven. Het design heeft als **naam** gekregen: invertor. Vervolgens zien in de **lijst van poorten** dat deze component 2 poorten heeft: een **ingang** A en een uitgang **Z**.

Deze component is dus een IC met twee pinnen en de **entity** blok omschrijft als het ware enkel de behuizing.
{{% /column %}}
{{% /multiHcolumn %}}


{{% multiHcolumn %}}
{{% column %}}
De tweede blok **architecture** beschrijft wat er IN de behuizing zit. Ook deze beschrijving kunnen we een naam geven: **Behavioural**. Alles wat er vervolgens beschreven wordt tussen de **begin** en **end** definieert het gedrag van de component.
{{% /column %}}
{{% column %}}
{{< highlight vhdl >}}
architecture Behavioral of invertor is
begin

    Z <= NOT A;

end Behavioral;
{{< /highlight >}}
{{% /column %}}

{{% /multiHcolumn %}}


{{% multiHcolumn %}}
{{% column %}}
{{< highlight vhdl >}}
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
{{< /highlight >}}
{{% /column %}}
{{% column %}}
Tenslotte zijn er nog de eerste twee regels van de beschrijving. De eerste regel zegt dat er een library genaamd **IEEE** gebruikt wordt in deze beschrijving. De tweede regel zegt dat er uit deze library de **package** STD_LOGIC_1164 **volledig** (.ALL) gebruikt wordt. Wat dit precies wilt zeggen, daar wordt later op teruggekomen.
{{% /column %}}
{{% /multiHcolumn %}}

{{% notice note %}}
Het is uitermate belangrijk dat het besef blijft dat VHDL (of iedere andere HDL) louter een beschrijving geeft van een hardware design. Dit wilt zeggen dat het mogelijk moet zijn een **schema** te tekenen !!!
{{% /notice  %}}

De beschrijving van de de component hierboven is in een schema te tekenen als een **invertor** of **NIET-poort**.

{{% figure src="/images/100/drawio_new_invertor.png" title="De entity en architecture van de invertor" %}}


### std_logic

Omdat de package **IEEE.STD_LOGIC_1164** gebruikt wordt, kan het *type* **std_logic** gebruiken. Dit is het type dat we quasi altijd gebruiken wanneer er met poorten en/of signalen gewerkt wordt in een hardware beschrijving. Het type **std_logic** kan **9 verschillende waardes** aannemen. Meestal gebruiken we '0' en '1'. Hieronder zijn echter *alle* mogellijke waardes opgelijst met uitleg. 
<!-- Meer uitleg over mogelijke types vind je in de [zelfstudie](/900_zelfstudie_vhdl/060_packages/#std_logic_1164--package). -->

{{% highlight vhdl %}}
'U',  -- Uninitialized : flipflop waar nog nooit in is geschreven
'X',  -- Forcing Unknown
'0',  -- Forcing 0 : rechtstreeks aan grond
'1',  -- Forcing 1 : rechtstreeks aan voeding
'Z',  -- High Impedance
'W',  -- Weak Unknown
'L',  -- Weak 0 : via weerstand aan grond
'H',  -- Weak 1 : via weerstand aan voeding
'-',  -- Don't Care
{{% /highlight %}}