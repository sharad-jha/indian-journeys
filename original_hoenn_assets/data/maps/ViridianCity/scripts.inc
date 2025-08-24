#include "constants/map_scripts.h"

ViridianCity_MapScripts::
    map_script MAP_SCRIPT_ON_TRANSITION, ViridianCity_OnTransition
    .byte 0

ViridianCity_OnTransition:
    setflag FLAG_VISITED_VIRIDIAN_CITY
    end

ViridianCity_EventScript_Gentleman::
    lock
    faceplayer
    msgbox ViridianCity_Text_GentlemanGreeting, MSGBOX_DEFAULT
    release
    end

ViridianCity_EventScript_Woman::
    lock
    faceplayer
    msgbox ViridianCity_Text_WomanGreeting, MSGBOX_DEFAULT
    release
    end

ViridianCity_Text_GentlemanGreeting:
    .string "Welcome to Viridian City!\p"
    .string "This is a peaceful city where\n"
    .string "trainers can rest and prepare.$"

ViridianCity_Text_WomanGreeting:
    .string "The Pokémon Center is over there.\p"
    .string "You can heal your Pokémon\n"
    .string "whenever you need to.$"
