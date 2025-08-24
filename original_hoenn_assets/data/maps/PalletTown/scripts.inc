#include "constants/map_scripts.h"

PalletTown_MapScripts::
    map_script MAP_SCRIPT_ON_TRANSITION, PalletTown_OnTransition
    map_script MAP_SCRIPT_ON_FRAME_TABLE, PalletTown_OnFrame
    .byte 0

PalletTown_OnTransition:
    setflag FLAG_VISITED_PALLET_TOWN
    end

PalletTown_OnFrame:
    map_script_2 VAR_TEMP_0, 0, PalletTown_EventScript_CheckFirstVisit
    .2byte 0

PalletTown_EventScript_CheckFirstVisit:
    setvar VAR_TEMP_0, 1
    msgbox PalletTown_Text_WelcomeToPalletTown, MSGBOX_DEFAULT
    release
    end

PalletTown_EventScript_ProfessorOak::
    lock
    faceplayer
    msgbox PalletTown_Text_ProfessorOakGreeting, MSGBOX_DEFAULT
    release
    end

PalletTown_EventScript_Woman::
    lock
    faceplayer
    msgbox PalletTown_Text_WomanGreeting, MSGBOX_DEFAULT
    release
    end

PalletTown_Text_WelcomeToPalletTown:
    .string "Welcome to Pallet Town!\p"
    .string "A quiet and peaceful place.$"

PalletTown_Text_ProfessorOakGreeting:
    .string "Hello there! I'm Professor Oak.\p"
    .string "I study Pokémon for a living.\p"
    .string "It's wonderful to see a trainer\n"
    .string "from the Hoenn region!$"

PalletTown_Text_WomanGreeting:
    .string "This is where the journey begins\n"
    .string "for many young trainers.\p"
    .string "Professor Oak's lab is just\n"
    .string "up ahead.$"

PalletTown_EventScript_HoennTruck::
    lock
    faceplayer
    msgbox PalletTown_Text_HoennTruckGreeting, MSGBOX_YESNO
    compare VAR_RESULT, YES
    goto_if_eq VAR_RESULT, YES, PalletTown_EventScript_ReturnToHoenn
    msgbox PalletTown_Text_HoennTruckMaybeLater, MSGBOX_DEFAULT
    release
    end

PalletTown_EventScript_ReturnToHoenn::
    msgbox PalletTown_Text_HoennTruckDeparting, MSGBOX_DEFAULT
    fadescreen FADE_TO_BLACK
    delay 20
    warp MAP_LITTLEROOT_TOWN, 0, 18, 12
    fadescreen FADE_FROM_BLACK
    release
    end

PalletTown_Text_HoennTruckGreeting:
    .string "This truck can take you back\n"
    .string "to the Hoenn region.\p"
    .string "Would you like to return?$"

PalletTown_Text_HoennTruckMaybeLater:
    .string "Maybe later then.$"

PalletTown_Text_HoennTruckDeparting:
    .string "The truck's engine starts up.\p"
    .string "You feel a strange sensation\n"
    .string "as the world around you shifts…$"
