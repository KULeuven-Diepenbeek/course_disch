---
title: 'Opdracht 7: FSM'
pre: "<i class='fas fa-pen-square'></i> "
chapter: false
weight: 740
draft: false
---

Voor deze opdracht dien je zelf een **Moore-FSM** te beschrijven. 

Er is een datapad ontworpen dat de een lift aanstuurt. De signalen die het controlepad moet aansturen zijn: **move_up**, **move_down**, **close_doors** en **open_doors**. Alle vier deze signalen zijn van het type **STD_LOGIC**. Instructies die gegeven worden, mogen (alle vier) maar 1 klok-periode **hoog** blijven.


{{% multiHcolumn %}}
{{% column %}}

Om de sturing te organiseren zijn een ook een deel ingangs-signalen.

* **door_are_open**: Dit signaal is hoog als de deuren VOLLEDIG open zijn.
* **safe_to_ride**: Dit signaal is hoog als de deuren dicht zijn **en** de deuren worden niet aangestuurd om te openen.

Tenslotte zijn er ook nog twee ingangs-vectoren. Beide vectoren zijn one-hot-geëncodeerd (Dit wilt zeggen dat er hoogstens 1 bit '1' kan zijn.)

* **floor_request**: Deze vector geeft aan naar welke verdieping de lift zich moet begeven.
* **carriage_at_floor**: Deze vector geeft aan naar welke verdieping de lift zich begeeft.
{{% /column %}}
{{% column %}}
```vhdl
entity fsm is
    generic(
        number_of_floors : natural := 16
    );
    port(
        clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        floor_request : in STD_LOGIC_VECTOR(number_of_floors-1 downto 0);
        carriage_at_floor : in STD_LOGIC_VECTOR(number_of_floors-1 downto 0);
        safe_to_ride : in STD_LOGIC;
        doors_are_open: in STD_LOGIC;
        move_up : out STD_LOGIC;
        move_down : out STD_LOGIC;
        open_doors : out STD_LOGIC;
        close_doors : out STD_LOGIC
    );
end entity fsm;
```
{{% /column %}}
{{% /multiHcolumn %}}

De breedte van de twee laatst vernoemde vectoren is in te stellen mbv een generic.