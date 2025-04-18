---
title: 'Opdracht 7: Finite State Machine'
pre: "<i class='fas fa-pen-square'></i> "
chapter: false
weight: 740
draft: false
---

Voor deze opdracht dien je zelf een FSM te beschrijven. De controle is een versimpelde versie van een muziek speler. 

Na power-up komt de FSM in de **sReset** state. Ook als de gebruiker het **reset** signal indrukt, gaat de FSM naar deze state, ongeacht van de huidige toestand. Deze state is slechts 1 klokcyclus actief en gaat meteen naar de **sStop** state. De controle blijft in deze toestand totdat de **btn_play** button ingedrukt wordt. In de **sPlay** state kan er overgegaan worden naar de **sPause** state en terug door opnieuw gebruik te maken van de **btn_play** button. Zowel in **sPlay** als is **sPause** kan er overgegaan worden naar **sStop** als de gebruiker de **btn_stop** button indrukt.

Om de complexiteit te beperken zijn er maar 4 stuur-uitgangen. Deze vormen een one-hot encoding van de huidige state.

Het state-diagram en de entity staan hieronder afgebeeld.

{{% multiHcolumn %}}
{{% column %}}
![State diagram](/images/700/fsm-Page-1.drawio.png)
{{% /column %}}
{{% column %}}
![Entity](/images/700/fsm-entity.drawio.png)
{{% /column %}}
{{% column %}}
{{< include_file "/static/hdlsrc/700/fsm.vhd" "vhdl" >}}
{{% /column %}}
{{% /multiHcolumn %}}

<!-- Different types for notices are: info (yellow), tip (green), warning (red), note (blue)-->
{{% notice tip %}}
Let er op dat het signaal van een button eerst laag moet worden vóórdat er een nieuw signal geïnterpreteerd kan worden!!
{{% /notice %}}

<a href="/hdlsrc/700/muziek_speler_controle_tb.vhd" download>Hier</a> vind je een testbench.
