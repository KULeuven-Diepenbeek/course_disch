---
title: 'Voorbeeld verkeerslicht'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 20
draft: false
---



### Voorbeeld Moore FSM: verkeerslichten

<div class="multicolumn">
    <div class="column">

{{% md %}}

* In rst_state zijn alle uitgangen laag (geen enkel licht brandt).
* In green_state is de green uitgang hoog en de rest laag (het groen licht brandt).
* In yellow_state is de yellow uitgang hoog en de rest laag (het oranje licht brandt).
* In red_state is de red uitgang hoog en de rest laag (het rood licht brandt).
* We kiezen ervoor om enkel vanuit red_state de mogelijkheid te voorzien om naar rst_state te gaan.

#### FSM schematisch:

{{% figure src="/images/zelfstudie_FSM/FSM_verkeerslicht_schematisch.png" %}}

{{% /md %}}

</div>
<div class="column">

{{% figure src="/images/zelfstudie_FSM/FSM_verkeerslicht.png" %}}

</div>
</div>


### States
```vhdl
type my_state is (rst_state, green_state, yellow_state, red_state);
signal next_state, state: my_state;
```

### Next state functie

<div class="multicolumn">
    <div class="column">


{{% md %}}

```vhdl
p_next: process(state, rst)
begin
    case state is
        when rst_state =>   if rst = '1' then
                                next_state <= rst_state;
                            else
                                next_state <= green_state;
                            end if;
        when green_state => next_state <= yellow_state;
        when yellow_state =>next_state <= red_state;
        when red_state =>   if rst = '1' then
                                next_state <= rst_state;
                            else
                                next_state <= green_state;
                            end if;
        when others =>      next_state <= rst_state;
    end case;
end process;
```

{{% /md %}}


</div>
<div class="column">

{{% figure src="/images/zelfstudie_FSM/next_state.png" %}}

</div>
</div>

#### state register

<div class="multicolumn">
    <div class="column">


{{% md %}}

```vhdl
p_reg: process(clk)
begin
    if clk'event and clk = '1' then
        state <= next_state;
    end if;
end process;
```

{{% /md %}}


</div>
<div class="column">

{{% figure src="/images/zelfstudie_FSM/state_register.png" %}}

</div>
</div>

#### Output functie

<div class="multicolumn">
    <div class="column">


{{% md %}}

```vhdl
p_out: process(state)
begin
    case state is
        when rst_state =>
            red <= '0';
            yellow <= '0';
            green <= '0';
        when green_state =>
            red <= '0';
            yellow <= '0';
            green <= '1';
        when yellow_state =>
            red <= '0';
            yellow <= '1';
            green <= '0';
        when red_state =>
            red <= '1';
            yellow <= '0';
            green <= '0';
        when others =>
            red <= '0';
            yellow <= '0';
            green <= '0';
    end case;
end process;
```

{{% /md %}}


</div>
<div class="column">

{{% figure src="/images/zelfstudie_FSM/output_functie.png" %}}

</div>
</div>

{{% notice note %}}
Opdracht: <br/>
Pas de FSM voor de aansturing van verkeerslichten aan zodat er vanuit elke toestand naar rst_state kan worden gesprongen. Teken het nieuwe toestandsdiagramma. Schrijf de nieuwe next state functie (de output functie verandert niet)
{{% /notice %}}