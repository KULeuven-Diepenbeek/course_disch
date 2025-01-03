---
title: 'Tips & Tricks'
weight: 820
draft: false
---


### Signaal verkorten to 1CC

{{% multiHcolumn %}}
{{% column %}}
Soms is het handig om signalen te verkorten. Een stuursignaal kan, bijvoorbeeld, enkele clock cycles hoog zijn. De hardware echter verwacht een hoog signaal dat **precies** 1 clock cycle duurt.
{{% notice tip %}}
Van zodra je begint te denken "nu moet *dit* zijn en *daarvoor* moest dat zijn ... **FF-tijd**.
{{% /notice %}}
{{% /column %}}
{{% column %}}
![level2CC](/images/800/level2period.png)
{{% /column %}}
{{% column %}}
{{< include_file "/static/hdlsrc/800/level2period.vhd" "vhdl" >}}
{{% /column %}}
{{% /multiHcolumn %}}


### 'Default' waardes bij een MUX

{{% multiHcolumn %}}
{{% column %}}
Het is **uiterst belangrijk** dat bij een MUX **ALLE** outputs een waarde toegekend krijgen, voor elke mogelijke conditie!! Je kan jezelf beschermen van de *zonde* om dit te vergeten door te werken met een "default"-waarde.<br/><br/>
Het voorbeeld hiernaast ziet er op het eerste zicht *correct* uit en volgens de VHDL syntax is dit ook zo. Afhankelijk van de laatste bit zal het signaal *getal_is_even* hoog worden, of *getal_is_oneven*.
{{% notice warning %}}
Dit zijn eigenlijk twee muxen, die in één proces beschreven worden!!
{{% /notice %}}
{{% /column %}}
{{% column %}}
{{< include_file "/static/hdlsrc/800/mux_default.vhd" "vhdl" >}}
{{% /column %}}
{{% /multiHcolumn %}}

{{% multiHcolumn %}}
{{% column %}}
{{< include_file "/static/hdlsrc/800/mux_default_bis.vhd" "vhdl" >}}
{{% /column %}}

{{% column %}}
In deze twee voorbeelden is er in de beschrijving gezorgd dat **voor alle mogelijkheden een waarde** beschikbaar is. Het eerste voorbeeld doet dit *expliciet*. Wanneer er veel uitgangen zijn, kan dit snel omslachtige worden. Het tweede voorbeeld kan dan een oplossing vormen, door eerst *default* waardes toe te kennen aan **alle** uitgangen.
{{% /column %}}
{{% column %}}
{{< include_file "/static/hdlsrc/800/mux_default_tris.vhd" "vhdl" >}}
{{% /column %}}
{{% /multiHcolumn %}}

### Power to the editor

{{% multiHcolumn %}}
{{% column %}}
**VHDL** is een expliciete taal. Er moet veel code geschreven worden, als we het aantal "karakters" tellen in een beschrijving. <br/><br/>
Tegenwoordig bestaan er tal van **general purpose** editors. Aangezien VHDL-bestanden gewone tekstbestanden zijn, kunnen deze ook perfect in een editor geschreven worden. Voorbeelden van editors zijn: Visual Studio Code, Sublime, Notepad++ en UltraEdit. De meeste editors laten toe om te werken met **snippets**. Dit zijn onderdelen in de editor die stukken boilerplate code genereren.<br/><br/>
Dit is een voorbeeld van een snippet in VS Code. Wanneer er in een .vhd file gewerkt wordt, zal de prefix **srff** meteen de block code genereren voor een SR-FlipFlop.
{{% notice tip %}}
Het loont écht de moeite om jezelf goed vertrouwd te maken met 1 editor. Dit soort algemene editors kunnen immers gebruikt worden voor veel talen die je zal gebruiken: Python, VHDL, C, Java, Assembly (:smiley:), HTML, CSS, ... 
{{% /notice %}}
{{% /column %}}
{{% column %}}
```json
"VHDL SRFF": {
        "prefix": "srff",
        "body" : [
            "-- signal $1, $1_set, $1_reset : STD_LOGIC;",
            "$1_set <= ;",
            "$1_reset <= ;",
            "PSRFF: process(clock_i)",
            "begin",
            "    if rising_edge(clock_i) then",
            "        if reset_n_i = '0' then ",
            "            $1 <= '0';",
            "        else",
            "            if $1_reset = '1' then ",
            "                $1 <= '0';",
            "            elsif $1_set = '1' then ",
            "                $1 <= '1';",
            "            end if;",
            "        end if;",
            "    end if;",
            "end process;"
        ],
        "description": "VHDL boilerplate code for a set-reset flip-flop"
    }
```
{{% /column %}}
{{% /multiHcolumn %}}

### Automating (Vivado)

Zij, die deze labo's met Vivado gedaan hebben, hebben misschien al gemerkt dat deze tool niet altijd helemaal werkt zoals dat verwacht wordt. Een tip is om zo weinig mogelijk **manueel werk** te doen. Het is je misschien al opgevallen dat er een [TCL](https://en.wikipedia.org/wiki/Tcl) console is. Hiermee kan de tool ook bediend worden met commando's in plaats van met manuele muiskliks.

Een project aanmaken voor het PYNQ ontwikkelbord vergt **10 muiskliks en 1 tekst-veld** manipulatie. Wanneer je naar de TCL console kijkt, zie iets (analoog aan) zoals hieronder. De regels die in het blauw staan, zijn TCL-commandos.

![vivado_tcl](/images/800/vivado_tcl.png)

Je kan dus, als alternatief voor als een bezetene rond te klikken, ook deze commando's uitvoeren. Het resultaat is exact hetzelfde. Aangezien we al genoeg typwerk hebben, is het nog interessanter om een klein *script* te maken waarin deze commando's staan.

{{< include_file "/static/hdlsrc/800/example.tcl" "tcl" >}}

Als we er van uitgaan dat deze TCL-file te vinden is op: **/home/username/myscript.tcl**, dan volstaat in om in de TCL console van Vivado te typen:
```tcl
source /home/username/myscript.tcl
```
{{% notice tip %}}
Hou de TCL console in de gaten. Je kan, voor elke actie die je in Vivado doet, de commando's die uitgevoerd worden kopiëren in het TCL script.<br/><br/>
Die-hards kunnen zelfs beginnen programmeren, zodat je één generiek TCL-script krijgt dat parameteriseerbaar is.
{{% /notice %}}

```tcl
# set parameters
set pname "this_is_my_project_name"
set srcpath "/home/jvliegen/vc/github/KULeuven-Diepenbeek/course_disch/tcl"
set projpath "/home/jvliegen/sandbox/course_hdisch"
set part "xc7vx485tffg1761-2"
set board "xilinx.com:vc707:part0:1.3"

# delete older versions
cd $projpath
exec rm -Rf $pname

# create project
create_project $pname $projpath/$pname -part $part
set_property board_part $board [current_project]
set_property target_language VHDL [current_project]

# add VHDL source files
set fnames [glob -directory $srcpath -- "*.vhd"]
foreach fname $fnames {
    add_files $fname
}
```



