#include "constants/map_scripts.h"

CeruleanCity_MapScripts::
    map_script MAP_SCRIPT_ON_TRANSITION, CeruleanCity_OnTransition
    .byte 0

CeruleanCity_OnTransition:
    setflag FLAG_VISITED_CERULEAN_CITY
    end

CeruleanCity_EventScript_Gentleman::
    lock
    faceplayer
    msgbox CeruleanCity_Text_GentlemanGreeting, MSGBOX_DEFAULT
    release
    end

CeruleanCity_Text_GentlemanGreeting:
    .string "Welcome to Cerulean City!\\p"
    .string "This city is known for its\\n"
    .string "water-type Pokémon and the\\l"
    .string "Cerulean Gym.\\p"
    .string "The Gym Leader Misty is\\n"
    .string "a water Pokémon expert!$"
