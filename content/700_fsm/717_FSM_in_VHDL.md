---
title: 'FSM in VHDL'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 717
draft: false
---

Om een beschrijving te maken van de behandelde FSM in VHDL, wordt er weer gebruikt gemaakt van een *opsommingstype*. Vervolgens worden er 2 signalen aangemaakt van dit nieuw-gemaakte type:

```vhdl
type T_demo_fsm_states is (sReset, sGroen, sOranje, sRood);
signal current_state, next_state: T_demo_fsm_states;
```

{{% multiHcolumn %}}
{{% column %}}
Met deze twee signalen gedefinieerd en gedeclareerd, is het terug business-as-usual. Er is een tekening van het ontwerp, dus rest er enkel nog om hier een beschrijving van te maken.

* register voor het **state-register**: &#x2714;
* multiplexer voor de **output functie**: &#x2714;
* combinatorisch voor de **next-state functie**: &#x2714;
{{% /column %}}
{{% column %}}
{{% figure src="/images/700/moore_FSM.png" title="Moore FSM"%}}
{{% /column %}}
{{% /multiHcolumn %}}


{{% multiHcolumnT %}}
{{% column %}}
### Next state function
```vhdl
PFSM_NSF: process(current_state, halt)
begin
    case current_state is
        when sGroen =>
            next_state <= sOranje;
        when sOranje =>
            next_state <= sRood;
        when others => 
            if halt = '1' then 
                next_state <= sReset; 
            else 
                next_state <= sGroen; 
            end if;
    end case;
end process;
```
{{% /column %}}
{{% column %}}
### State register
```vhdl
PFSM_REG: process(clock_i)
begin
    if rising_edge(clock_i) then 
        if reset_i = '1' then 
            current_state <= sReset;
        else
            current_state <= next_state;
        end if;
    end if;
end process;
```
{{% /column %}}
{{% column %}}
### Output function
```vhdl
PFSM_OF: process(current_state)
begin
    groen_o <= '0';
    oranje_o <= '0';
    rood_o <= '0';
    case current_state is
        when sRood =>    rood_o <= '1';
        when sOranje =>  oranje_o <= '1';
        when sGroen =>   groen_o <= '1';
        when others =>   groen_o <= '1'; 
                         oranje_o <= '1'; 
                         rood_o <= '1';
    end case;
end process;
```
{{% /column %}}
{{% /multiHcolumnT %}}