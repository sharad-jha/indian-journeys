#include "constants/map_scripts.h"

PewterCity_MapScripts::
    map_script MAP_SCRIPT_ON_TRANSITION, PewterCity_OnTransition
    .byte 0

PewterCity_OnTransition:
    setflag FLAG_VISITED_PEWTER_CITY
    end

PewterCity_EventScript_Gentleman::
    lock
    faceplayer
    msgbox PewterCity_Text_GentlemanGreeting, MSGBOX_DEFAULT
    release
    end

PewterCity_EventScript_Woman::
    lock
    faceplayer
    msgbox PewterCity_Text_WomanGreeting, MSGBOX_DEFAULT
    release
    end

PewterCity_Text_GentlemanGreeting:
    .string "Welcome to Pewter City!\\p"
    .string "This city is known for its\\n"
    .string "rock-type Pokémon and the\\l"
    .string "Pewter Gym.\\p"
    .string "The Gym Leader Brock is\\n"
    .string "a rock-solid trainer!$"

PewterCity_Text_WomanGreeting:
    .string "The Pewter Museum of Science\\n"
    .string "is a must-visit attraction.\\p"
    .string "It has fascinating exhibits\\n"
    .string "about Pokémon evolution.$"
