---
title: 'Processen'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 260
draft: false
---


Een basis component die vaak voorkomt is een multiplexer.

{{% multiHcolumn %}}

{{% column %}}
{{% figure src="/images/drawio_new_mux.png" title="2-naar-1 multiplexer"  %}}
{{% /column %}}
{{% column %}}
{{< highlight vhdl >}}
...
architecture Behavioral of ...
    ...
    signal rotate_left : STD_LOGIC_VECTOR(7 downto 0);
    signal rotate_right : STD_LOGIC_VECTOR(7 downto 0);
    signal MUX_select : STD_LOGIC;
    signal transformed : STD_LOGIC_VECTOR(7 downto 0);
    ...
begin
    ...
    -- optie 1
    transformed <= rotate_left when MUX_select = '0' else rotate_right;

    -- optie 2
    with MUX_select select
        transformed <= rotate_left when '0',
        rotate_right when others;

    -- optie 3
    PMUX: process(rotate_left, rotate_right, MUX_select)
    begin
        if MUX_select = '1' then 
            transformed <= rotate_right;
        else
            transformed <= rotate_left;
        end if;
    end process;
    ...
end Behavioral;
{{< /highlight >}}

{{% /column %}}
{{% /multiHcolumn %}}



In het voorbeeld hierboven zijn er twee signalen **rotate_left** en **rotate_right**. Eén van beide wordt doorverbonden met het signaal **transformed**. Welke van beide mogelijkheden doorgegeven wordt, wordt bepaald door de waarde van het signaal **MUX_select** ('0': rotate_left en '1': rotate_right). Note that **select** is a keyword.

Alle drie de opties zijn geldige VHDL constructies. Met de netlist (die gegenereerd wordt door de synthese-tool) in achterhoofd, is er **geen** verschil tussen de drie opties.

* **Optie 1** geeft een handige manier handige manier indien er maar 2 opties zijn.
* **Optie 2** geeft een handige manier handige manier indien er meer dan 2 opties zijn.
* **Optie 3** geeft een handige manier handige manier indien er meer complexiteit nodig is.


De derde optie vergt nog een extra woordje uitleg. Een process is een set van instructies, tussen *begin* en *end* die **sequentieel** uitgevoerd wordt. De vraag die zich dan stelt is: **"Wanneer wordt deze lijst van instructies uitgevoerd ?"**. Om dit te definiëren is er de **sensitiviy list**. Dit is een oplijsting van signalen die, wanneer ze veranderen van waarde, het proces triggeren.


Tenslotte dient er nog vermeld te worden dat een process een naam kan hebben. In het voorbeeld is dit: **PMUX**.

{{% notice note %}}
Merk op dat de regels tussen **begin** en **end** van het process eigenlijk niet-synthetiseerbaar zijn. In het geheel van het process, wordt het wel **synthetiseerbaar**.
{{% /notice  %}}

Een tweede opmerking is er (bewust) een mismatch is tussen de schematic en de code, met name: de breedte van de signalen. Als er twee *draden* zijn die naar 1 draad moeten gaan, volstaat een 2-naar-1 multiplexer. Indien er echter 2 *bussen* zijn die naar 1 *bus* moeten gaan, zijn er meerdere multiplexers nodig. In het geval van een 8-bit bus, worden het **acht** 2-naar-1 multiplexers.



### Een subtiliteitje

**Q:** Wat zijn de mogelijke waardes die **MUX_select** kan hebben ?


## Welke manier van beschrijven is het beste?

Dat is een simpele vraag en het eenvoudige antwoord hierop is: het maakt niet uit. "**Waarom ?**", hoor ik je zeggen?

Laat ons even teruggaan naar het begin:

* we willen hardware ontwerpen die een bepaalde functionaliteit bekomt
* wij, als hardware designers, denken hard na (LOL, sorry) en komen op de proppen met een ontwerp
* op een of andere manier moeten we dit ontwerp duidelijk maken aan de computer, meer bepaald de design tools
* om dit te behalen gebruiken we een HDL
* **Zolang de tools weten, in dit geval, dat we een multiplexer bedoelen, maakt de hoeveelheid schrijfwerk NIETS uit**


