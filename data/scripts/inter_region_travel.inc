@ Inter-Region Travel System Scripts
@ Handles unlocking of ferry and warp truck systems

Common_EventScript_CheckInterRegionTravelUnlocks::
	@ Check and unlock Warp Truck (Hoenn Elite Four defeated)
	checkflag FLAG_ELITE_4_DEFEATED
	goto_if_eq VAR_RESULT, TRUE, Common_EventScript_UnlockWarpTruck
	goto Common_EventScript_CheckFerryUnlock
	
Common_EventScript_UnlockWarpTruck::
	checkflag FLAG_WARP_TRUCK_UNLOCKED
	goto_if_eq VAR_RESULT, TRUE, Common_EventScript_CheckFerryUnlock
	setflag FLAG_WARP_TRUCK_UNLOCKED
	msgbox Common_Text_WarpTruckUnlocked, MSGBOX_DEFAULT
	goto Common_EventScript_CheckFerryUnlock
	
Common_EventScript_CheckFerryUnlock::
	@ Check and unlock Ferry (Both Elite Four defeated)
	checkflag FLAG_ELITE_4_DEFEATED
	goto_if_ne VAR_RESULT, TRUE, Common_EventScript_TravelUnlockEnd
	checkflag FLAG_KANTO_ELITE_4_DEFEATED
	goto_if_ne VAR_RESULT, TRUE, Common_EventScript_TravelUnlockEnd
	checkflag FLAG_FERRY_UNLOCKED
	goto_if_eq VAR_RESULT, TRUE, Common_EventScript_TravelUnlockEnd
	setflag FLAG_FERRY_UNLOCKED
	msgbox Common_Text_FerryUnlocked, MSGBOX_DEFAULT
	goto Common_EventScript_TravelUnlockEnd
	
Common_EventScript_TravelUnlockEnd::
	return

@ Manual Elite Four Flag Setting (for testing/completion)
Common_EventScript_SetKantoEliteFourDefeated::
	setflag FLAG_DEFEATED_KANTO_ELITE_4_LORELEI
	setflag FLAG_DEFEATED_KANTO_ELITE_4_BRUNO
	setflag FLAG_DEFEATED_KANTO_ELITE_4_AGATHA
	setflag FLAG_DEFEATED_KANTO_ELITE_4_LANCE
	setflag FLAG_KANTO_ELITE_4_DEFEATED
	setflag FLAG_DEFEATED_KANTO_CHAMPION_BLUE
	call Common_EventScript_CheckInterRegionTravelUnlocks
	msgbox Common_Text_KantoEliteFourCompleted, MSGBOX_DEFAULT
	return

Common_Text_WarpTruckUnlocked:
	.string "The Warp Truck to Kanto has been\n"
	.string "unlocked!\p"
	.string "You can now travel between Littleroot\n"
	.string "Town and Pallet Town!$"

Common_Text_FerryUnlocked:
	.string "The Inter-Region Ferry has been\n"
	.string "unlocked!\p"
	.string "You can now sail between Slateport\n"
	.string "City and the S.S. Anne!$"

Common_Text_KantoEliteFourCompleted:
	.string "Congratulations! You have defeated\n"
	.string "the Kanto Elite Four and Champion!\p"
	.string "Inter-region travel systems have\n"
	.string "been fully unlocked!$"

@ Test Script for Inter-Region Travel System
Common_EventScript_TestTravelSystem::
	lock
	faceplayer
	msgbox Common_Text_TravelTestIntro, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, NO, Common_EventScript_TestEnd
	call Common_EventScript_TestUnlockFerry
	goto Common_EventScript_TestEnd

Common_EventScript_TestUnlockWarpTruck::
	setflag FLAG_ELITE_4_DEFEATED
	call Common_EventScript_CheckInterRegionTravelUnlocks
	msgbox Common_Text_TravelTestWarpTruckUnlocked, MSGBOX_DEFAULT
	release
	end

Common_EventScript_TestUnlockFerry::
	setflag FLAG_ELITE_4_DEFEATED
	call Common_EventScript_SetKantoEliteFourDefeated
	msgbox Common_Text_TravelTestFerryUnlocked, MSGBOX_DEFAULT
	release
	end

Common_EventScript_TestResetFlags::
	clearflag FLAG_ELITE_4_DEFEATED
	clearflag FLAG_DEFEATED_KANTO_ELITE_4_LORELEI
	clearflag FLAG_DEFEATED_KANTO_ELITE_4_BRUNO
	clearflag FLAG_DEFEATED_KANTO_ELITE_4_AGATHA
	clearflag FLAG_DEFEATED_KANTO_ELITE_4_LANCE
	clearflag FLAG_KANTO_ELITE_4_DEFEATED
	clearflag FLAG_DEFEATED_KANTO_CHAMPION_BLUE
	clearflag FLAG_FERRY_UNLOCKED
	clearflag FLAG_WARP_TRUCK_UNLOCKED
	msgbox Common_Text_TravelTestFlagsReset, MSGBOX_DEFAULT
	release
	end

Common_EventScript_TestCheckStatus::
	call Common_EventScript_CheckInterRegionTravelUnlocks
	msgbox Common_Text_TravelTestStatusChecked, MSGBOX_DEFAULT
	release
	end

Common_EventScript_TestEnd::
	msgbox Common_Text_TravelTestGoodbye, MSGBOX_DEFAULT
	release
	end

Common_Text_TravelTestIntro:
	.string "SYSTEM TESTER: Welcome to the\n"
	.string "Inter-Region Travel Test System!\p"
	.string "Would you like me to unlock all\n"
	.string "travel systems for testing?$"

Common_Text_TravelTestMenu:
	.string "What would you like to test?$"

Common_Text_TravelTestWarpTruckUnlocked:
	.string "SYSTEM TESTER: Hoenn Elite Four\n"
	.string "completion simulated!\p"
	.string "The Warp Truck should now be\n"
	.string "unlocked in Littleroot Town!$"

Common_Text_TravelTestFerryUnlocked:
	.string "SYSTEM TESTER: Both Elite Four\n"
	.string "completions simulated!\p"
	.string "Ferry and Warp Truck should\n"
	.string "now be fully unlocked!$"

Common_Text_TravelTestFlagsReset:
	.string "SYSTEM TESTER: All travel flags\n"
	.string "have been reset.\p"
	.string "Travel systems are now locked\n"
	.string "again.$"

Common_Text_TravelTestStatusChecked:
	.string "SYSTEM TESTER: Travel unlock\n"
	.string "conditions have been checked\l"
	.string "and updated!$"

Common_Text_TravelTestGoodbye:
	.string "SYSTEM TESTER: Test complete!\n"
	.string "Enjoy your inter-region travels!$"
