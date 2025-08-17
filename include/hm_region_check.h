#ifndef GUARD_HM_REGION_CHECK_H
#define GUARD_HM_REGION_CHECK_H

#include "global.h"

// HM usage check functions
bool8 CanUseHM01Cut(void);
bool8 CanUseHM02Fly(void);
bool8 CanUseHM03Surf(void);
bool8 CanUseHM04Strength(void);
bool8 CanUseHM05Flash(void);
bool8 CanUseHM06RockSmash(void);
bool8 CanUseHM07Waterfall(void);
bool8 CanUseHM08Dive(void);

// Utility functions
const u8* GetHMRegionRestrictionMessage(u16 hmItem);
void SetHMObtainedInCurrentRegion(u16 hmItem);

#endif // GUARD_HM_REGION_CHECK_H
