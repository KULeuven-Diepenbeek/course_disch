---
title: 'Versiebeheer'
chapter: false
weight: 10
draft: false
---

Er worden masaal veel documenten geproduceerd, geëditeerd en gedeeld. Dit geldt ook voor programma-code. Zoals hiervoor vermeld, is **HDL-code** niets meer dan simpele tekstdocumenten, analoog aan een C- of python-bestand. Om door het bos de bomen nog te zien, is er software beschikbaar om hiermee om te gaan. De meest gekende software hiervoor is ongetwijfeld: **Git**. Het gebruik van **Git** wordt gedoceerd als onderdeel van *Electronic Engineering Skills (4952)*. Aangezien Git gebruikt wordt binnen dit opleidingsonderdeel, volgt hier een *primer* van nodige principes voor deze labo-reeks.

<!-- Different types for notices are: info (yellow), tip (green), warning (red), note (blue)-->
{{% notice tip %}}
**Spoiler:** Git kan ook gebruikt worden voor HDL-code.
{{% /notice %}}

<!-- De labo's binnen dit onderdeel dienen ingediend te worden via een GitHub repository. Hiervoor wordt er gewerkt met GitHub Classrooms. Er is een classroom aangemaakt [DISCH](https://classroom.github.com/classrooms/58585791-disch), waarin je de assignments van deze labo reeks terugvindt. Voor iedere assignment is er een invite beschikbaar:

* Assignment 1: https://classroom.github.com/a/wSMqAEQW
* Assignment 2: https://classroom.github.com/a/fXgFzrME

Van zodra je de invite aanvaard hebt (nadat je bent ingelogd op GitHub), wordt er voor dié specifieke assigment een repository gemaakt. In deze repository kan je werken tot aan de deadline. -->

## Waarom?

Er zijn tal van voordelen bij het gebruik van een versiebeheersysteem (Version Control System (VCS)):

{{% multiHcolumn %}}
{{% column %}}
* Samenwerking en workflow:
  * Teamwork
  * Branching & merging
  * Oplossen van conflicten
* Track changes en geschiedenis 
  * Gedetailleerde geschiedenis
  * Traceerbaarheid
  * Herstellen van fouten
* Code integriteit en veiligheid
  * Backups
  * Terugdraaien naar vorige versies
  * Toegangscontrolle
* Efficientie en productiviteit
  * Snellere ontwikkeling
  * Geautomatiseerde processen
{{% /column %}}
{{% column %}}
Alhoewel deze voordelen al lang zijn ingeburgerd bij de **software ontwikkelaars**, blijven de **hardware ontwikkelaars** achterop hinken. Door jullie over de leercurve te helpen en bij te staan om de voordelen hiervan in te zien, wordt er getracht dit bij te benen.

Voor het gebruik van de labo's is er een [Forgejo](https://forgejo.org/) server opgezet.

![Forgejo logo](/images/001/forgejo.png)

Er bestaan een aantal git-gebaseerde VCS-en die gratis beschikbaar zijn ([Github](http://www.github.com), [GitLab](https://about.gitlab.com/), [Bitbucket](https://bitbucket.org/), ...). De keuze om *self-hosted* aan de slag te gaan komt voornamelijk voort uit het aanbieden van open-source alternatieven voor de commerciële producten.

{{% /column %}}
{{% /multiHcolumn %}}

## Hoe?

De **Forgejo**-server is bedoeld voor *intern* gebruik. Om deze af te schermen van de buitenwereld, is de server enkel toegangkelijk via een **Virtual Private Network (VPN)** ([meer op Wikipedia](https://en.wikipedia.org/wiki/Virtual_private_network)). Door een verbinding te maken met de **OpenVPN** server, komt jouw toestel terecht in een virtueel netwerk. Vanop dat virtuele netwerk, is de Forgejo server bereikbaar via de link: [http://vcs.esands.vpn](http://vcs.esands.vpn).

<!-- ---------------------------------------------------------------------- -->
{{% multiHcolumn %}}
{{% column %}}
![VPN](/images/001/setup_simple.png)

Na OpenVPN te installeren ([link](https://openvpn.net/client/)), moeten de nodige configuratiebestanden aangeboden worden. Deze worden per email verzonden en bestaan uit:

* een configuratie bestand (**client.ovpn**)
* een persoonlijke sleutel (**cert_client.key**)
* een certificaat voor deze sleutel (**cert_client.crt**)
* een certificaat voor de sleutel van de CA (**ca.crt**)
* een sleutel voor de TLS authenticatie (**ta.key**)

{{% /column %}}
{{% column %}}
![forgejo](/images/001/vcs.png)
{{% /column %}}
{{% /multiHcolumn %}}

<!-- ---------------------------------------------------------------------- -->

{{% multiHcolumn %}}
{{% column %}}
![password](/images/001/forgejo_1.png)
{{% /column %}}
{{% column %}}
#### Nieuw wachtwoord

Wanneer jullie voor de eerste keer inloggen (met het wachtwoord dat tijdens de les vernoemd wordt), zullen jullie verplicht worden om een nieuw **wachtwoord** in te stellen.

Kies het nieuwe wachtwoord verstandig, want het gaat nodig zijn voor de interactie met de vcs.
{{% /column %}}
{{% /multiHcolumn %}}

<!-- ---------------------------------------------------------------------- -->

{{% multiHcolumn %}}
{{% column %}}
#### Gecreëerde repositories

Voor ieder van jullie is er een set van repositories gemaakt. Deze repositories zijn **private**

Wanneer de **deadline** van een assignment bereikt is, wordt het **eigenaarsschap** van deze repo overgedragen naar de docenten. Jullie blijven wel ten allen tijden **leesrechten** behouden.

Let er dus zeker op dat je jouw *oplossing* tijdig naar de git repository pusht.

Voor iedere assignment is er een aparte repository gemaakt. Deze repositories hebben al een deel folders en bestanden waarvan je kan vertrekken. **Deze structuur moet ten allen tijde behouden blijven.**

{{% /column %}}
{{% column %}}
![password](/images/001/forgejo_2.png)
{{% /column %}}
{{% /multiHcolumn %}}

<!-- ---------------------------------------------------------------------- -->

{{% multiHcolumn %}}
{{% column %}}
![password](/images/001/forgejo_3.png)
{{% /column %}}
{{% column %}}
#### Doe een checkout

Om een lokale copy te bekomen van de repository, moet er een checkout gedaan worden. Gebruik hiervoor de URL die zichtbaar is in de repo.
{{% /column %}}
{{% /multiHcolumn %}}


