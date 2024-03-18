---
title: 'Reset'
pre: "<i class='fas fa-book'></i> "
chapter: false
weight: 440
draft: false
---

Typisch is het gewenst om een **reset** ingang te hebben om alles terug naar een **gekende begintoestand** te brengen. Er zijn typisch 2 manieren om dit te doen, een **synchrone** reset of een **asynchrone** reset.


<div class="multicolumn">
    <div class="column">

<h2>Asynchrone reset </h2>
Onderstaand voorbeeld is van een D flip-flop met asynchrone reset, Je ziet hier dat de reset onderdeel is van de sensitivity list. De reset staat hier als eerste in het process.      
    </div>
    <div class="column">

<h2>Synchrone reset </h2>
Onderstaand voorbeeld is van een D flip-flop met synchrone reset, Je ziet hier dat de reset geen onderdeel is van de sensitivity list. De reset staat hier na de if van de stijgende flank van de clock.   
    </div>
</div>

<div class="multicolumn">
    <div class="column">

{{< highlight vhdl >}}
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity asynchronous_reset is
Port (input, clock, reset: in std_logic;
        output: out std_logic);
end asynchronous_reset;

architecture Behavioral of asynchronous_reset is

begin

SEQ: process(clock,reset)
begin

    if reset =  '1' then
        output <= '0';
    else
        if clock'event and clock = '1' then
            output <= input;    
        end if;
    end if;

end process;
end Behavioral;
        {{< /highlight >}}

    </div>
    <div class="column">      
            {{< highlight vhdl >}}
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity synchronous_reset is
  Port (input, clock, reset: in std_logic;
        output: out std_logic);
end synchronous_reset;

architecture Behavioral of synchronous_reset is

begin

SEQ: process(clock)
begin
 
   if clock'event and clock = '1' then
       if reset =  '1' then
            output <= '0';
        else
            output <= input;    
        end if;
    end if;

end process;
end Behavioral;
        {{< /highlight >}}        
    </div>
</div>
  

{{% notice warning %}}
Voor sequentiële processen zijn er maximaal 2 signalen (clock en eventueel reset) die in de sensitivity list staan. Bij combinatorische processen zijn het alle signalen.
{{% /notice %}}
<br/>
<br/>
![ff_withreset.png](/images/wavedrom/ff_withreset.png)