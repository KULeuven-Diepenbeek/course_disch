---
title: 'Opdracht 3: ALU'
pre: "<i class='fas fa-pen-square'></i> "
chapter: false
weight: 330
draft: false
---

De ALU die je moet maken voor deze opdracht ziet er uit zoals hieronder afgebeeld:

{{% multiHcolumn %}}
{{% column %}}

* Ingangen x en y zijn 16 bits; 
* De input status bits zijn:
  * zx (zero x)
  * nx (negate x)
  * zy (zero y)
  * ny (negate y)
  * f (function)
  * no (negate output)
* De output status zijn: 
  * zr (zero)
  * ng (negative).

{{% /column %}}
{{% column %}}
![schame nand2tetris ALU](/images/ALU/ALU_inputs_outputs.png)
{{% /column %}}
{{% /multiHcolumn %}}


Later zetten we de input status code juist op basis van de binnenkomende instructie en optioneel doen we iets met de output status codes.


De opdracht is om zelf een ALU te maken die aan onderstaande waarheidstabel voldoet, met de volgende *entity*.

{{% multiHcolumn %}}
{{% column %}}


![waarheidstabel ALU](/images/ALU/screenshot_truth_table_ALU.png)
<div class="image_courtesy">
  Bron: 
   <a href="https://b1391bd6-da3d-477d-8c01-38cdf774495a.filesusr.com/ugd/44046b_f0eaab042ba042dcb58f3e08b46bb4d7.pdf" target="_blank">nand2tetris</a>
</div>

<style>
  div.image_courtesy {
    text-align: center;
    font-size: 100%;
    font-style: italic;
  }
</style>

{{% /column %}}
{{% column %}}
```vhdl
entity alu is
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
end entity alu;
```
{{% /column %}}
{{% /multiHcolumn %}}


{{% notice warning %}}
Een ALU is volledig combinatorisch.
{{% /notice %}}
