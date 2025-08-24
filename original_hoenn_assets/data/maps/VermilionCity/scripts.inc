#include "constants/map_scripts.h"

VermilionCity_MapScripts::
    map_script MAP_SCRIPT_ON_TRANSITION, VermilionCity_OnTransition
    .byte 0

VermilionCity_OnTransition:
    setflag FLAG_VISITED_VERMILION_CITY
    end

VermilionCity_EventScript_Sailor::
    lock
    faceplayer
    msgbox VermilionCity_Text_SailorGreeting, MSGBOX_DEFAULT
    release
    end

VermilionCity_Text_SailorGreeting:
    .string "Welcome to Vermilion City!\\p"
    .string "This port city is known for\\n"
    .string "its electric-type Gym Leader.\\p"
    .string "Lt. Surge is a tough trainer\\n"
    .string "who uses electric Pokémon!$"
