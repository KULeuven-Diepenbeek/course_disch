---
title: 'Alternatieve omgeving'
chapter: false
weight: 11
draft: false
---

Als het niet mogelijk is om zelf Vivado te installeren op de jouw laptop, wordt er een alternatieve omgeving aangeboden. Hiervoor dien je wel enkele kleine stukjes software geïnstalleerd worden op jullie eigen machines.

<div style="float: right; margin-right: 50px;">
<h2> tl;dr</h2>
<ul>
<li> install <a href="https://mobaxterm.mobatek.net/download.html">MobaXterm</a> or <a href="https://putty.org/index.html">Putty</a>
<li> install <a href="https://www.tightvnc.com/download.php">TightVNC</a>
</ul>
</div>

![Setup](/images/001/setup.png)

Er is een server beschikbaar gemaakt waarop Vivado v2020.2 geïnstalleerd is. Deze server is **digitalE**(.esands.vpn) en is bereikbaar via 10.185.158.204 (of via de hostname zelf). Net als voor de Forgejo server te bereiken dient er een eerst een connectie gemaakt te worden met de **VPN server**.
<hr/>

### Remote access

<!-- <img src="../../images/001/logo_mobaxterm.png" style="float: right; margin: 0px 10px"/> -->

Door gebruik te maken van een VPN, wordt er toegang verschaft tot het netwerk. Het volgende dat nodig is, is een tool (of een set of tools) die bepaalde functionaliteiten biedt. De tool **MobaXterm** is gratis beschikbaar en biedt services zoals o.a. SSH en FTP functionaliteit en een X-window function. Download (de home edition) van [https://mobaxterm.mobatek.net/](https://mobaxterm.mobatek.net/download.html). Een andere Windows tool voor een SSH verbinding is [Putty](https://putty.org/index.html).

{{% multiHcolumn %}}
{{% column %}}
#### MobaXterm
![Moba 1](/images/001/moba_1.png)
{{% /column %}}
{{% column %}}
#### Putty
![Putty 1](/images/001/putty_1.png)
{{% /column %}}
{{% /multiHcolumn %}}



<!-- ![Moba 1](/images/001/moba_2.png) -->

<!-- Tenslotte dient de login en het wachtwoord ingevoerd te worden. Eens je verbonden ben, kan je, aan de linkerkant van het MobaXterm scherm, door het bestandssysteem gebladerd worden. -->

<!-- ![Moba 1](/images/001/moba_3.png) -->


<!-- Different types for notices are: info (yellow), tip (green), warning (red), note (blue)-->
{{% notice tip %}}
Indien je liever met een andere ssh-tool werkt (of command line), is dat geen enkel probleem.
{{% /notice %}}

<hr/>

### Tight VNC





{{% multiHcolumn %}}
{{% column %}}
<img src="../../images/001/logo_tightvnc.png" style="float: left; margin: 0px 10px"/>

De tweede tool die nodig is, is een VNC-viewer. **VNC (Virtual Network Computing)** is een grafische tool om een Desktop over te nemen. Op de server(s) in het virtuele netwerk moet een VNC-server gestart worden. Hierop kan er dan verbonden worden met een VNC-client. Een optie voor de VNC client is TightVNC. Dit kan gedownload worden op [https://www.tightvnc.com/](https://www.tightvnc.com/download.php).

Om de VNC server te starten dient er ingelogd te worden op server en het commando **vncstart** gerund te worden.

Vergeet niet op bij het afsluiten het **vncstop** commando te runnen.
{{% /column %}}
{{% column %}}
![vnc_1](/images/001/vnc_1.png)
{{% /column %}}
{{% /multiHcolumn %}}