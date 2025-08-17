EventScript_UseFlash::
	lockall
	callnative CanUseHM05Flash
	goto_if_eq VAR_RESULT, FALSE, EventScript_FlashRegionRestricted
	animateflash 1
	setflashlevel 1
	releaseall
	end

EventScript_FlashRegionRestricted::
	msgbox gText_HMNotUsableInKanto, MSGBOX_DEFAULT
	releaseall
	end
