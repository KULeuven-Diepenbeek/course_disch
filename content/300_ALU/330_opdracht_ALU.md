---
title: 'Opdracht 3: ALU'
pre: "<i class='fas fa-pen-square'></i> "
chapter: false
weight: 330
draft: false
---

De ALU die je moet maken voor deze opdracht, ziet er uit zoals afgebeeld en de entity wordt ook gegeven.

{{% multiHcolumn %}}
{{% column %}}
{{% figure src="/images/300/ALU_entity.png" title="De ALU met alle in- en uitgangen" %}}
{{% /column %}}
{{% column %}}
{{< include_file "/static/hdlsrc/300/alu.vhd" "vhdl" >}}
{{% /column %}}
{{% /multiHcolumn %}}


<!-- Different types for notices are: info (yellow), tip (green), warning (red), note (blue)-->
{{% notice note %}}
Een ALU is volledig combinatorisch.
{{% /notice %}}
