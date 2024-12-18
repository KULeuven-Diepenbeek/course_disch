---
title: 'Synthetiseerbaar'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 31
draft: false
---

### Synthesisable subset

Tot hier hebben we gekeken naar de beschrijving van enkele discrete componenten. Deze componenten hebben beschreven in **VHDL**. Daarnaast hebben we een eerste testbench gemaakt ter verificatie van het ontwerp. Ook deze testbench is beschreven in **VHDL**. Dit is wellicht een goed moment om even aan te halen dat er ook andere HDL (hardware description languages) bestaan. Wellicht is de meest bekende (en meest gebruikte) taal **verilog**. De meest recente, wijd-verspreide taal is **SystemVerilog**, welke (zoals de naam doet vermoeden) gebaseeerd is op verilog. Dan zijn er ook nog HDLs die naar software talen leunen zoals: **SystemC** (C-like), **MyHDL** (Python-like) of **Lava** (Haskell-like).

Het is belangrijk om te weten dat **niet alle (V)HDL code synthesisable** is. Wat wordt daarmee bedoeld?

Of er nu voor FPGA of ASIC ontwikkeld wordt, de eerste stap van de **toolchain** is <u>Synthesis</u>. Tijdens de synthese wordt de HDL omgezet in een netlist. Dit is feitelijk niets anders dan een lijst van electronische componenten samen met een set van hoe deze verbonden zijn. Dit wilt dus zeggen: **er moet een werkelijke component zijn** voor (een deel van) de beschrijving.

Alle keywords en constructies van een HDL waarvoor een fysieke implementatie bestaat wordt **synthetiseerbare code** genoemd:
* keyword **AND**: is een beschrijving voor een logische poort
* poort richting **IN**: is een beschrijving voor een richting van een poort
* ```Z_i <= x```: is het leggen een draadje tussen de draadjes *Z_i* en *x*

In de testbench hebben we constructie gebruikt zoals ```wait for 10 ns;```. Voor deregelijke instructies bestaat er geen fysieke implementatie. Deze code noemen we *(surprise, surprise)*: **niet-synthetiseerbare code**.

Quasi alle hardware beschrijvingstalen hebben zowel de mogelijkheid tot het schrijven van synthetiseerbare en niet-synthetiseerbare code. Dit eerste is voor designs te beschrijven, terwijl het tweede is om designs te testen.


#### Enkele voorbeelden van niet-synthetiseerbare code:
{{% highlight vhdl %}}
wait for 10ns;
wait until ready = '1';

for i in 1 to 10 loop
    test_signaal <= NOT test_signaal;
    wait for 10ns;
end loop;
...
{{% /highlight %}}