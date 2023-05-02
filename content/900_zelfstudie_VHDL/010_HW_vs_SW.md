---
title: 'Hardware vs software'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 10
draft: false
---

## Hardware vs software

<ul>
<li> beschrijvingstaal voor hardware &ne; programmeertaal </li>
<li> programmeertaal (bv. C): </li> 
<ul>
<li> hardware = processor </li>
<li> hardware is reeds ontworpen </li>
<li> code: beschrijft hoe hardware gebruikt moet worden </li>
<li> code wordt gecompileerd voor een specifieke processor </li>
</ul>
<li> hardware beschrijvingstaal (bv. VHDL) </li>
<ul>
<li> hardware = ontwerp op FPGA of ASIC </li>
<li> hardware moet ontworpen worden </li>
<li> code: beschrijft welke hardware ontworpen moet worden </li>
<li> code wordt gesynthetiseerd voor een specifieke FPGA of ASIC technologie </li>
</ul>
</ul>

## voorbeeld hardware

```vhdl
c <= a and b;
e <= c or d;
```
betekent hetzelfde als
```vhdl
e <= c or d;
c <= a and b;
```

{{% figure src="/images/zelfstudie/and_or_schamatic.png" title="schematische voorstelling"%}}

