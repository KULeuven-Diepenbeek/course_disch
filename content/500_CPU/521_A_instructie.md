---
title: 'A instructie'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 521
draft: false
---

Indien de **MSB** van een 16-bit instructie **'0'** is, dan wilt dit zeggen dat dit een **A-instructie** is. De overige 15 bits dienen vervolgens in het A register geladen te worden.

![A instructie](/images/A_instruction.png)

{{< image_courtesy 
  name="N. Nisan and S. Schocken"
  url="https://b1391bd6-da3d-477d-8c01-38cdf774495a.filesusr.com/ugd/44046b_b2cad2eea33847869b86c541683551a7.pdf"
  source="The Elements of Computing Systems"
  >}}

In de screenshot hieronder wordt er ingezoomd op een klein stukje in de simulatie van een programma. Op iedere **rising edge** van de klok wordt er gekeken of de MSB een '0' is. Indien dit het geval is, wordt de inhoud van **regA** aangepast. 

![Simulatie van een A-instructie](/images/screenshots/521_a_instruction.png)