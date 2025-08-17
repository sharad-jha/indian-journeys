#include "constants/map_scripts.h"

PewterGym_MapScripts::
    map_script MAP_SCRIPT_ON_LOAD, PewterGym_OnLoad
    map_script MAP_SCRIPT_ON_TRANSITION, PewterGym_OnTransition
    .byte 0

PewterGym_OnLoad:
    call_if_unset FLAG_DEFEATED_PEWTER_GYM, PewterGym_EventScript_CloseDoors
    end

PewterGym_OnTransition:
    setflag FLAG_VISITED_PEWTER_GYM
    end

PewterGym_EventScript_CloseDoors::
    setmetatile 4, 8, METATILE_GenericBuilding_TableEdge, TRUE
    setmetatile 5, 8, METATILE_GenericBuilding_TableEdge, TRUE
    setmetatile 6, 8, METATILE_GenericBuilding_TableEdge, TRUE
    setmetatile 7, 8, METATILE_GenericBuilding_TableEdge, TRUE
    setmetatile 8, 8, METATILE_GenericBuilding_TableEdge, TRUE
    setmetatile 9, 8, METATILE_GenericBuilding_TableEdge, TRUE
    setmetatile 10, 8, METATILE_GenericBuilding_TableEdge, TRUE
    setmetatile 11, 8, METATILE_GenericBuilding_TableEdge, TRUE
    return

PewterGym_EventScript_Brock::
    trainerbattle_single TRAINER_BROCK, PewterGym_Text_BrockIntro, PewterGym_Text_BrockDefeat, PewterGym_EventScript_BrockDefeated
    end

PewterGym_EventScript_BrockDefeated::
    msgbox PewterGym_Text_ReceivedBoulderBadge, MSGBOX_DEFAULT
    setflag FLAG_BADGE01_GET
    setflag FLAG_DEFEATED_PEWTER_GYM
    call PewterGym_EventScript_GiveHM01Cut
    msgbox PewterGym_Text_ExplainBoulderBadge, MSGBOX_DEFAULT
    release
    end

PewterGym_EventScript_GiveHM01Cut::
    giveitem ITEM_HM_CUT
    setflag FLAG_RECEIVED_HM_CUT
    callnative SetHMObtainedInCurrentRegion, ITEM_HM_CUT
    msgbox PewterGym_Text_ExplainCut, MSGBOX_DEFAULT
    return

PewterGym_Text_BrockIntro:
    .string "I'm BROCK!\\n"
    .string "I'm the PEWTER GYM LEADER!\\p"
    .string "I believe in rock-hard defense\\n"
    .string "and determination!\\p"
    .string "That's why my POKéMON are all\\n"
    .string "the rock type!\\p"
    .string "Do you still want to challenge me?\\n"
    .string "Fine then! Show me your best!$"

PewterGym_Text_BrockDefeat:
    .string "I took you for granted.\\p"
    .string "As proof of your victory, here's\\n"
    .string "the BOULDERBADGE!$"

PewterGym_Text_ReceivedBoulderBadge:
    .string "{PLAYER} received the BOULDERBADGE\\n"
    .string "from BROCK!$"

PewterGym_Text_ExplainBoulderBadge:
    .string "The BOULDERBADGE makes all\\n"
    .string "POKéMON up to Lv. 20 obey you.\\p"
    .string "It also enables the use of\\n"
    .string "the HM move CUT outside of battle.\\p"
    .string "Here, take this HM with you!$"

PewterGym_Text_ExplainCut:
    .string "HM01 contains CUT.\\p"
    .string "It can be used to cut down\\n"
    .string "small trees.$"
