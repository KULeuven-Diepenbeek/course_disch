---
title: 'BRAM'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 10
draft: true
---

### Doel van dit hoofdstuk

In dit hoofdstuk staat uitleg hoe je de CPU kan verbinden met Block ram om uiteindelijk ook werkelijk instructies aan de CPU te geven en de uitkomsten van bewerkingen ook te kunnen opslaan.

{{% figure src="/images/CPU_gebruiken/Uitbereiding_CPU.png" title="Doel van dit hoofdstuk"  %}}

### BRAM

Zowel aan de linker als rechterkant maken we gebruiken van Block RAM (random access memory) afgekort als BRAM. Dit is geheugen dat in een FPGA zit dat we kunnen gebruiken voor data in op te slaan. Het zou ook mogelijk zijn om DDR (double data rate) RAM te gebruiken dat wordt door computers vaak gebruikt en zit ook vaak op hetzelfde bordje als een FPGA, maar dat is veel moeilijk te gebruiken.

### BRAM maken in Vivado

Onder project manger klik op **IP catalog**. Zoek dan op BRAM en selecteer **Block Memory Generator**.
Nu krijg je een scherm waar je instellingen kan doen aan de IP block, je kan bijvoorbeeld de grote en breedte aanpassen.

Je kan de IP block uitklappen om dan in de eerste file te kijken wat de ingangen en uitgangen zijn om aan te sluiten.

BRAM heeft bijvoorbeeld onderstaande IO:

```vhdl
ENTITY blk_mem_gen_0 IS
  PORT (
    clka : IN STD_LOGIC; --clock
    ena : IN STD_LOGIC; -- zet poort A aan
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0); -- schrijf naar poort A
    addra : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- welk aderess
    dina : IN STD_LOGIC_VECTOR(15 DOWNTO 0); -- de data dat geschreven moet worden
    douta : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) -- data dat wordt gelezen
  );
END blk_mem_gen_0;    
```

In het IP kan je ook "load init file" aanzetten. Als je dan een file maakt door op edit te drukken kan je bij de radix 16 invullen en bij de vector in waarde in hexadecimaal. Deze kan je later nog makelijk aanpassen.
Als je dit hebt gedaan is er een "coefficient file" bijgekomen in het project en onder memory initialization kan je met behulp van spaties instructies scheiden.


### delay BRAM

Let op dat het BRAM 2 clock cyclussen vertraging heeft en de rest van de CPU verwacht 1. Een manier toevoegen om de CPU te pauzeren als er van het geheugen wordt gelezen zou een goede oplossing zijn.