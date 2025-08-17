SSAnne_Deck_MapScripts::
	.byte 0

@ Trainers
SSAnne_Deck_EventScript_Sailor1::
	trainerbattle_single TRAINER_SS_ANNE_SAILOR_1, SSAnne_Deck_Text_Sailor1Intro, SSAnne_Deck_Text_Sailor1Defeat
	msgbox SSAnne_Deck_Text_Sailor1PostBattle, MSGBOX_AUTOCLOSE
	end

SSAnne_Deck_EventScript_Sailor2::
	trainerbattle_single TRAINER_SS_ANNE_SAILOR_2, SSAnne_Deck_Text_Sailor2Intro, SSAnne_Deck_Text_Sailor2Defeat
	msgbox SSAnne_Deck_Text_Sailor2PostBattle, MSGBOX_AUTOCLOSE
	end

SSAnne_Deck_EventScript_Gentleman1::
	trainerbattle_single TRAINER_SS_ANNE_GENTLEMAN_1, SSAnne_Deck_Text_Gentleman1Intro, SSAnne_Deck_Text_Gentleman1Defeat
	msgbox SSAnne_Deck_Text_Gentleman1PostBattle, MSGBOX_AUTOCLOSE
	end

@ Inter-Region Ferry System - Return to Hoenn
SSAnne_Deck_EventScript_HoennFerryAttendant::
	lock
	faceplayer
	goto_if_unset FLAG_FERRY_UNLOCKED, SSAnne_Deck_EventScript_FerryLocked
	msgbox SSAnne_Deck_Text_WelcomeToHoennFerry, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, NO, SSAnne_Deck_EventScript_DeclineFerry
	msgbox SSAnne_Deck_Text_BoardingHoennFerry, MSGBOX_DEFAULT
	closemessage
	call SSAnne_Deck_EventScript_BoardHoennFerry
	warp MAP_SLATEPORT_CITY_HARBOR, 15, 12
	waitstate
	release
	end

SSAnne_Deck_EventScript_FerryLocked::
	msgbox SSAnne_Deck_Text_FerryCurrentlyUnavailable, MSGBOX_DEFAULT
	release
	end

SSAnne_Deck_EventScript_DeclineFerry::
	msgbox SSAnne_Deck_Text_ComeBackAnytime, MSGBOX_DEFAULT
	release
	end

SSAnne_Deck_EventScript_BoardHoennFerry::
	applymovement LOCALID_PLAYER, SSAnne_Deck_Movement_BoardFerry
	waitmovement 0
	return

SSAnne_Deck_Movement_BoardFerry:
	walk_left
	walk_left
	walk_down
	step_end

@ Trainer Battle Text
SSAnne_Deck_Text_Sailor1Intro:
	.string "Ahoy! Welcome aboard the S.S. Anne!\n"
	.string "Let's have a sea battle!$"

SSAnne_Deck_Text_Sailor1Defeat:
	.string "You've got sea legs, mate!$"

SSAnne_Deck_Text_Sailor1PostBattle:
	.string "This ship connects regions across\n"
	.string "the world. Amazing, isn't it?$"

SSAnne_Deck_Text_Sailor2Intro:
	.string "I sail the seven seas!\n"
	.string "Care for a battle?$"

SSAnne_Deck_Text_Sailor2Defeat:
	.string "Landlubber beat me!$"

SSAnne_Deck_Text_Sailor2PostBattle:
	.string "The ocean connects all regions.\n"
	.string "That's the beauty of sailing!$"

SSAnne_Deck_Text_Gentleman1Intro:
	.string "Good day! I'm traveling between\n"
	.string "regions. Care for a match?$"

SSAnne_Deck_Text_Gentleman1Defeat:
	.string "Splendid battle, my good fellow!$"

SSAnne_Deck_Text_Gentleman1PostBattle:
	.string "Inter-region travel is quite the\n"
	.string "adventure, wouldn't you say?$"

@ Ferry Text
SSAnne_Deck_Text_WelcomeToHoennFerry:
	.string "CAPTAIN: Welcome aboard!\n"
	.string "Would you like to return to the\l"
	.string "Hoenn region via Slateport City?$"

SSAnne_Deck_Text_BoardingHoennFerry:
	.string "CAPTAIN: All aboard! Setting sail\n"
	.string "for Slateport City in Hoenn!$"

SSAnne_Deck_Text_FerryCurrentlyUnavailable:
	.string "CAPTAIN: Sorry, but this ferry service\n"
	.string "is only available to trainers who have\l"
	.string "defeated both regional Elite Four!$"

SSAnne_Deck_Text_ComeBackAnytime:
	.string "CAPTAIN: Feel free to explore Kanto,\n"
	.string "then come back when you're ready!$"
