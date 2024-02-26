---
title: 'Cheat sheet'
chapter: true
weight: 920
draft: false
---

# Cheat sheet

<table>
<tr><th colspan=2>Algemeen</th></tr>
<tr>
    <td>VHDL</td>
    <td>&bull; is een hoofdletter<b>ON</b>gevoelige hardware <b>beschrijvings</b>taal</td>
</tr>

<tr>
    <td>structuur</td>
    <td>libraries<br/>entity<br/>architecture</td>
</tr>

<tr>
    <td>libraries</td>
    <td>
        library IEEE;<br/>
        use IEEE.STD_LOGIC_1164.ALL;<br/>
    </td>
</tr>

<tr>
    <td>entity</td>
    <td><b>entity</b> <i>lorem</i> <b>is</b><br/>
    &nbsp; &nbsp; A: <b>in</b> STD_LOGIC;<br/>
    &nbsp; &nbsp; B: <b>in</b> STD_LOGIC;<br/>
    &nbsp; &nbsp; Z: <b>out</b> STD_LOGIC_VECTOR(n-1 downto 0)<br/>
    <b>end</b> lorem<br/>
    -- direction kan zijn: in, out, inout, buffer, linkage
    </td>
</tr>

<tr>
    <td>architecture</td>
    <td>
        <b>architecture</b> <i>x</i> <b>of</b> <i>y</i> <b>is</b><br/>
        &nbsp; &nbsp; -- declaraties van: constanten, signalen, componenten, ..<br/>
        <b>begin</b><br/>
        &nbsp; &nbsp; -- beschrijving van het design<br/>
        <b>end architecture;</b><br/>
    </td>
</tr>

</table>


<table>
<tr><th colspan=2>Entity</th></tr>
<tr>
    <td>VHDL</td>
    <td>&bull; is een hoofdletter<b>ON</b>gevoelige hardware <b>beschrijvings</b>taal</td>
</tr>

<tr>
    <td>structuur</td>
    <td>libraries<br/>entity<br/>architecture</td>
</tr>

<tr>
    <td>libraries</td>
    <td>
        library IEEE;<br/>
        use IEEE.STD_LOGIC_1164.ALL;<br/>
    </td>
</tr>

<tr>
    <td>entity</td>
    <td><b>entity</b> <i>lorem</i> <b>is</b><br/>
    &nbsp; &nbsp; A: <b>in</b> STD_LOGIC;<br/>
    &nbsp; &nbsp; B: <b>in</b> STD_LOGIC;<br/>
    &nbsp; &nbsp; Z: <b>out</b> STD_LOGIC_VECTOR(n-1 downto 0)<br/>
    <b>end</b> lorem<br/>
    -- direction kan zijn: in, out, inout, buffer, linkage
    </td>
</tr>

<tr>
    <td>architecture</td>
    <td>
        <b>architecture</b> <i>x</i> <b>of</b> <i>y</i> <b>is</b><br/>
        &nbsp; &nbsp; -- declaraties van: constanten, signalen, componenten, ..<br/>
        <b>begin</b><br/>
        &nbsp; &nbsp; -- beschrijving van het design<br/>
        <b>end architecture;</b><br/>
    </td>
</tr>

</table>