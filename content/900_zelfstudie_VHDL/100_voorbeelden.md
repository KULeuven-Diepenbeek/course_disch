---
title: 'Voorbeelden'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 100
draft: false
---


#### Binair-naar-decimaal decoder

```vhdl
entity bin_to_dec is
port(   binair: in std_logic_vector(2 downto 0);
        decimaal: out std_logic_vector(0 to 7));
end bin_to_dec;

architecture arch of bin_to_dec is
begin
    p: process(binair)
    begin
        case binair is
            when "000"  => decimaal <= "10000000" ;
            when "001"  => decimaal <= "01000000" ;
            when "010"  => decimaal <= "00100000" ;
            when "011"  => decimaal <= "00010000" ;
            when "100"  => decimaal <= "00001000" ;
            when "101"  => decimaal <= "00000100" ;
            when "110"  => decimaal <= "00000010" ;
            when others => decimaal <= "00000001" ;
        end case;
    end process;
end arch;
```

#### BCD-naar-7-segment decoder

```vhdl
entity bcd_to_7seg is
    port(   bcd: in std_logic_vector(3 downto 0);
            seg7: out std_logic_vector(1 to 7));
end bcd_to_7seg;

architecture arch of bin_to_7seg is
begin
p: process(bcd)
    begin
        case bcd is
            when "0000"  => seg7 <= "1111110" ;
            when "0001"  => seg7 <= "0110000" ;
            when "0010"  => seg7 <= "1101101" ;
            when "0011"  => seg7 <= "1111001" ;
            when "0100"  => seg7 <= "0110011" ;
            when "0101"  => seg7 <= "1011011" ;
            when "0110"  => seg7 <= "1011111" ;
            when "0111"  => seg7 <= "1110000" ;
            when "1000"  => seg7 <= "1111111" ;
            when "1001"  => seg7 <= "1111011" ;
            when others => seg7 <= "-------" ;
        end case;
    end process;
end arch;
```

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
            if count >= " 1001"  then
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
