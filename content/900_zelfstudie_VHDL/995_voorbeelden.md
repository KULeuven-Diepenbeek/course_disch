---
title: 'Voorbeelden'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 995
draft: false
---


#### Binair-naar-onehot decoder

{{< include_file "/static/hdlsrc/900/bin_to_onehot.vhd" "vhdl" >}}

#### BCD-naar-7-segment decoder

{{< include_file "/static/hdlsrc/900/bcd_to_7seg.vhd" "vhdl" >}}




<div  style="width:calc(100% - 300px); min-width:400px; float:left">
{{% md %}}

#### Conditionele toekenning m.b.v. with-select

* Deze toekenning is equivalent aan een multiplexer.
* Overlap is verboden.
* " others"  is altijd nodig.

{{% /md %}}


{{% highlight vhdl %}}
library ieee;
use ieee.std_logic_1164.all;
entity mux is
port(   a, b, c, d: in std_logic;
        s: in std_logic_vector(1 downto 0);
        z: out std_logic);
end mux;

architecture arch of mux is
begin
    with s select
        z <=    a when "00" ,
                b when "01" ,
                c when "10" ,
                d when others;
end arch;


{{% /highlight %}}

</div>
<div style="width:300px; float:left">

{{% figure src=/images/zelfstudie/mux_4_input.png %}}

</div>



<div  style="width:calc(100% - 300px); min-width:400px; float:left">

{{% md %}}

#### Conditionele toekenning m.b.v. when-else

Deze toekenning is eveneens equivalent aan een
multiplexer.

{{% /md %}}

{{% highlight vhdl %}}
library ieee;
use ieee.std_logic_1164.all;
entity mux is
port(   a, b, c, d: in std_logic;
        s: in std_logic_vector(1 downto 0);
        z: out std_logic);
end mux;

architecture arch of mux is
begin
    with s select
        z <=    a when (s = "00" ) else
                b when (s = "01" ) else
                c when (s = "10" ) else
                d;
end arch;


{{% /highlight %}}

</div>
<div style="width:300px; float:left">

{{% figure src=/images/zelfstudie/mux_4_input.png %}}

</div>


<div style="wdith:100%">
<div  style="width:calc(100% - 550px); min-width:400px; float:left">

{{% md %}}

#### Modulo 10 up counter


```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity comb_reg is
    port(   clk: in std_logic;
            q: out std_logic_vector(3 downto 0));
end comb_reg;

architecture arch_comb_reg of comb_reg is
    signal count: std_logic_vector(3 downto 0);
begin
    p_comb_reg: process(clk)
    begin
        if clk'event and clk = '1' then
            if count >= "1001"  then
                count <= "0000" ;
            else
                count <= count + 1;
            end if;
        end if;
    end process;
    q <= count;
end arch_comb_reg;
```

{{% /md %}}

</div>
<div style="width:500px; float:left">

{{% figure src=/images/zelfstudie/mod_10_upcounter.png %}}

</div>
</div>


<div  style="width:calc(100% - 550px); min-width:400px; float:left">

{{% md %}}

#### Cyclic shift register


```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity cyclic_shift is
    port(   clk: in std_logic;
            load_data: in std_logic;
            data_in: in std_logic_vector(7 downto 0);
            data_out: out std_logic_vector(7 downto 0));
end cyclic_shift;

architecture arch_cyclic_shift of cyclic_shift is
    signal shift_register: std_logic_vector(7 downto 0);
begin
    p_comb_reg: process(clk)
    begin
        if clk'event and clk = '1' then
            if load_data = '1'  then
                shift_register <= data_in;
            else
                shift_register(0) <= shift_register(7);
                shift_register(7 downto 1) <= shift_register(6 downto 0);
            end if;
        end if;
    end process;
    data_out <= shift_register;
end arch_cyclic_shift;
```

{{% /md %}}

</div>
<div style="width:500px; float:left">

{{% figure src=/images/zelfstudie/circular_shift_reg.png %}}

</div>
