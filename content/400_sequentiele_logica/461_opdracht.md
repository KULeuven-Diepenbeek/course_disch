---
title: 'Opdracht 4: Register file'
chapter: false
weight: 461
pre: "<i class='fas fa-pen-square'></i> "
draft: false
---

{{% multiHcolumn %}}
{{% column %}}
Na het maken van de ALU in de vorige opdracht, moet er voor opdracht 4 een **Register file** gemaakt worden. 

Een register file is een onderdeel van een processor dat eigenlijk niet veel meer bevat dan **een set registers**. De specificaties van de register file voor deze opdracht zijn als volgt:

* de data-breedte is 32 bits
* er zijn 8 registers in de register file
* de reg file beschikt over 2 lees-poorten
  * src1 & data1
  * src2 & data2
* de reg file beschikt over 1 schrijf-poort
  * dest, data & we
{{% /column %}}
{{% column %}}
{{% figure src="/images/400/regfile.png" title="Blokschema van de register file"  %}}
{{% /column %}}
{{% column %}}
{{% figure src="/images/400/wavedrom.png" title="Waveform van de register file"  %}}
{{% /column %}}
{{% /multiHcolumn %}}





<!--
{signal: [
  {name: 'clock',        wave: 'p......|....'},
  {name: 'x0',           wave: '2......|....', data: ['0x0', 'A1', 'A2', 'A3']},
  {name: 'x1',           wave: '2......|....', data: ['0x0', 'A1', 'A2', 'A3']},
  {name: 'x2',           wave: '2.3....|....', data: ['0x0', 'A0', 'A2', 'A3']},
  {name: 'x3',           wave: '2......|....', data: ['0x0', 'A1', 'A2', 'A3']},
  {name: 'x4',           wave: '2......|....', data: ['0x0', 'A1', 'A2', 'A3']},
  {name: 'x5',           wave: '2......|....', data: ['0x0', 'A1', 'A2', 'A3']},
  {name: 'x6',           wave: '2....4.|....', data: ['0x0', 'A1', 'A2', 'A3']},
  {name: 'x7',           wave: '2......|....', data: ['0x0', 'A1', 'A2', 'A3']},
  {},
  {name: 'write enable', wave: '010.10.|....'},
  {name: 'dest',         wave: '262.62.|....', data: ['0x0','0x2','0x0','0x6','0x0']},
  {name: 'data',         wave: 'x3x.4x.|....', data: ['A0', 'A1']},
  {},
  {name: 'src1',         wave: '2......|6.6.', data: ['0x0','0x6','0x5']},
  {name: 'data1',        wave: '2......|.4.2', data: ['0x0','A1','0x0']},
  {},
  {name: 'src2',         wave: '2......|6...', data: ['0x0','0x2']},
  {name: 'data2',        wave: '2......|.3..', data: ['0x0','A0']},
]}
-->

* **Voor de lees-poorten** wordt de **src_x** input gebruikt om de inhoud van het overeenkomende registeraan de **data_x** uitgang te zetten. Beide leespoorten werken onafhankelijk van elkaar.
* **Voor de schrijf-poort** wordt de inhoud op de **data** input gekopieerd naar het register dat aangeduid wordt met ingang **dest** op voorwaarde dat de **write enable** hoog is.

{{% multiHcolumn %}}
{{% column %}}
{{% figure src="/images/400/regfile_ent.png" title="Entity van de register file"  %}}
{{% /column %}}
{{% column %}}
{{< include_file "/static/hdlsrc/400/regfile.vhd" "vhdl" >}}
{{% /column %}}
{{% /multiHcolumn %}}

### Don't Panic!

Het zou kunnen dat het bovenstaande schema er nogal "druk en overweldigend" uitziet ... en dat is perfect ok. Dit is ook nog maar de 4 opdracht die er gemaakt moet worden. Als een probleem te groot lijkt, helpt het vaak om het op te delen in kleindere problemen die gemakkelijker te overwinnen zijn.

{{% multiHcolumn %}}
{{% column %}}
{{% figure src="/images/400/regfile.png" title="Blokschema van de register file"  %}}
{{% /column %}}
{{% column %}}
{{% figure src="/images/400/regfile_alpha.png" %}}
{{% /column %}}
{{% column %}}
{{% figure src="/images/400/regfile_beta.png" %}}
{{% /column %}}
{{% column %}}
{{% figure src="/images/400/regfile_gamma.png" %}}
{{% /column %}}
{{% /multiHcolumn %}}

{{% multiHcolumn %}}
{{% column %}}
{{% /column %}}
{{% column %}}
De tweede leespoort, is gewoon een kopie van de eerste leespoort.
{{% /column %}}
{{% column %}}
De tweede leespoort weglaten is een gemakkelijke tussenstap.
{{% /column %}}
{{% column %}}
De n-1 registers zijn allemaal gelijkaardig aan het n<sup>e</sup> register.
{{% /column %}}
{{% /multiHcolumn %}}
