---
title: 'Voorbeeld verkeerslicht timer'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 30
draft: false
---

### Voorbeeld Mealy FSM: verkeerslichten met timer

{{% multiHcolumn %}}
{{% column %}}
We voegen twee tellers toe om ervoor te zorgen dat de verkeerslichten langer rood en groen blijven dan oranje.

* We veronderstellen dat de tellers op nul blijven staan zolang het start signaal hoog is. 
* Als het start signaal laag wordt, telt de overeenkomstige teller op totdat een maximum is bereikt. Bij de korte teller is dit maximum ("0111") kleiner dan bij de lange teller ("1111").
* Bij het bereiken van het maximum wordt het ready signaal hoog.


#### FSM schematisch:

{{% figure src="/images/900/910_fsm/FSM_verkeerslicht_timer.png" %}}

{{% /column %}}
{{% column %}}
{{% figure src="/images/900/910_fsm/FSM_verkeerslicht_timer_block_diagram.png" %}}
{{% /column %}}
{{% /multiHcolumn %}}



### Teller met maximum waarde als parameter

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity teller is
generic(    max_waarde: std_logic_vector(3 downto 0));
port(       clk, start: in std_logic;
            ready: out std_logic);
end teller;

architecture arch of teller is
    signal tel_waarde: std_logic_vector(3 downto 0);
begin
    p_teller: process(clk)
    begin
        if clk'event and clk = '1' then
            if start = '1' then
                tel_waarde <= "0000";
                ready <= '0';
            elsif tel_waarde = max_waarde then
                tel_waarde <= "0000";
                ready <= '1';
            else
                tel_waarde <= tel_waarde + 1;
                ready <= '0';
            end if;
        end if;
    end process;
end arch;
```

### Datapad

{{% multiHcolumn %}}
{{% column %}}
```vhdl
library ieee;
use ieee.std_logic_1164.all;
entity datapad is
    port(   clk, start_kort, start_lang: in std_logic;
            ready_kort, ready_lang: out std_logic);
end datapad;

architecture arch of datapad is
    component teller is
        generic(max_waarde: std_logic_vector(3 downto 0));
        port(   clk, start: in std_logic;
                ready: out std_logic);
    end component;
begin
    teller_lang: teller
        generic map(max_waarde => "1111")
        port map(   clk => clk,
                    start => start_lang,
                    ready => ready_lang);
    
    teller_kort: teller
        generic map(max_waarde => "0111")
        port map(   clk => clk,
                    start => start_kort,
                    ready => ready_kort);
end arch;
```
{{% /column %}}
{{% column %}}
* In het datapad wordt de parameteriseerbare teller twee maal geïnstantieerd. 
* In de eerste instantiatie wordt de maximale waarde ingesteld op "1111". 
* In de tweede instantiatie wordt de maximale waarde ingesteld op "0111".
{{% /column %}}
{{% /multiHcolumn %}}



#### Next state functie

{{% multiHcolumn %}}
{{% column %}}
```vhdl
p_next: process(state, rst, ready_lang, ready_kort)
begin
    if rst = '1' then
        next_state <= rst_state;
    else
        case state is
            when rst_state =>   next_state <= green_state;
            when green_state => if ready_lang = '1' then
                                    next_state <= yellow_state;
                                else
                                    next_state <= green_state;
                                end if;
            when yellow_state =>    if ready_kort = '1' then
                                        next_state <= red_state;
                                    else
                                        next_state <= yellow_state;
                                    end if;
            when red_state =>       if ready_lang = '1' then
                                        next_state <= geen_state;
                                    else
                                        next_state <= red_state;
                                    end if;                                
            when others =>          next_state <= rst_state; 
        end case;
    end if;
end process;
```
{{% /column %}}
{{% column %}}
{{% figure src="/images/900/910_fsm/teller_next_state.png" %}}
{{% /column %}}
{{% /multiHcolumn %}}


#### State register

{{% multiHcolumn %}}
{{% column %}}
```vhdl
p_reg: process(clk)
begin
    if clk'event and clk = '1' then
        state <= next_state;
    end if;
end process;
```
{{% /column %}}
{{% column %}}
{{% figure src="/images/900/910_fsm/teller_state_register.png" %}}
{{% /column %}}
{{% /multiHcolumn %}}


#### Output functie


{{% multiHcolumn %}}
{{% column %}}
```vhdl
p_out: process(state, ready_lang, ready_kort)
begin
    case state is
        when rst_state =>
            red <= '0'; yellow <= '0'; green <= '0'; start_lang     <=  '1'; start_kort <= '0';
        when green_state =>
            red <= '0'; yellow <= '0'; green <= '1'; start_lang <=  '0';
            if ready_lang = '1' then start_kort <= '1';
            else start_kort <= '0';
            end if;
        when yellow_state =>
            red <= '0'; yellow <= '1'; green <= '0'; start_kort <=  '0';
            if ready_kort = '1' then start_lang <= '1';
            else start_lang <= '0';
        end if;
        when red_state =>
            red <= '1'; yellow <= '0'; green <= '0'; start_kort <=  '0';
            if ready_lang = '1' then start_lang <= '1';
            else start_lang <= '0';
            end if;
        when others =>
            red <= '0'; yellow <= '0'; green <= '0'; start_lang     <=  '0'; start_kort <= '0';
    end case;
end process;
```
{{% /column %}}
{{% column %}}
{{% figure src="/images/900/910_fsm/teller_output_functie.png" %}}
{{% /column %}}
{{% /multiHcolumn %}}
