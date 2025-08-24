# Inter-Region Warping System Technical Documentation

## Overview

This document provides comprehensive technical details of the inter-region warping implementation between **Pallet Town (Kanto)** and **Littleroot Town (Hoenn)**. The system allows players to travel between regions using warp trucks after completing specific game milestones.

## System Architecture

### Core Components

1. **Warp Trucks**: Physical objects in both towns
2. **Script System**: Assembly scripts handling player interaction
3. **Flag System**: Game flags controlling access and state
4. **Map System**: Destination coordinates and map transitions
5. **Visual Effects**: Screen transitions for immersive experience

---

## Littleroot Town → Pallet Town Warping

### Object Implementation

**File**: `data/maps/LittlerootTown/map.json`
```json
{
  "local_id": "LOCALID_LITTLEROOT_KANTO_TRUCK",
  "graphics_id": "OBJ_EVENT_GFX_TRUCK",
  "x": 18,
  "y": 12,
  "elevation": 4,
  "movement_type": "MOVEMENT_TYPE_FACE_RIGHT",
  "movement_range_x": 0,
  "movement_range_y": 0,
  "trainer_type": "TRAINER_TYPE_NONE",
  "trainer_sight_or_berry_tree_id": "0",
  "script": "LittlerootTown_EventScript_KantoTruck",
  "flag": "0"
}
```

### Script Implementation

**File**: `data/maps/LittlerootTown/scripts.inc`

#### Main Interaction Script
```asm
LittlerootTown_EventScript_KantoTruck::
    lock
    faceplayer
    checkflag FLAG_WARP_TRUCK_UNLOCKED
    goto_if_eq VAR_RESULT, TRUE, LittlerootTown_EventScript_KantoTruckUnlocked
    msgbox LittlerootTown_Text_KantoTruckLocked, MSGBOX_DEFAULT
    release
    end
```

#### Unlocked State Script
```asm
LittlerootTown_EventScript_KantoTruckUnlocked::
    msgbox LittlerootTown_Text_KantoTruckUnlocked, MSGBOX_YESNO
    compare VAR_RESULT, YES
    goto_if_eq VAR_RESULT, YES, LittlerootTown_EventScript_GoToKanto
    msgbox LittlerootTown_Text_KantoTruckMaybeLater, MSGBOX_DEFAULT
    release
    end
```

#### Warp Execution Script
```asm
LittlerootTown_EventScript_GoToKanto::
    msgbox LittlerootTown_Text_KantoTruckDeparting, MSGBOX_DEFAULT
    fadescreen FADE_TO_BLACK
    delay 20
    warp MAP_PALLET_TOWN, 0, 10, 10
    fadescreen FADE_FROM_BLACK
    release
    end
```

### Access Control

**Unlock Condition**: `FLAG_WARP_TRUCK_UNLOCKED`
**Unlock Trigger**: Defeat Hoenn Elite Four (`FLAG_ELITE_4_DEFEATED`)

**File**: `data/scripts/hall_of_fame.inc`
```asm
EverGrandeCity_HallOfFame_EventScript_CheckTravelUnlocks::
    @ Unlock Warp Truck (Hoenn Elite Four defeated)
    checkflag FLAG_ELITE_4_DEFEATED
    goto_if_eq VAR_RESULT, TRUE, EverGrandeCity_HallOfFame_EventScript_UnlockWarpTruck
    goto EverGrandeCity_HallOfFame_EventScript_CheckFerryUnlock

EverGrandeCity_HallOfFame_EventScript_UnlockWarpTruck::
    setflag FLAG_WARP_TRUCK_UNLOCKED
    goto EverGrandeCity_HallOfFame_EventScript_CheckFerryUnlock
```

### Dialogue Messages

**File**: `data/maps/LittlerootTown/text.inc`
```asm
LittlerootTown_Text_KantoTruckLocked:
    .string "This truck appears to be locked.\p"
    .string "It seems to be waiting for\n"
    .string "something special to happen…$"

LittlerootTown_Text_KantoTruckUnlocked:
    .string "This truck can take you to\n"
    .string "the Kanto region!\p"
    .string "Would you like to travel there?$"

LittlerootTown_Text_KantoTruckMaybeLater:
    .string "Maybe later then.$"

LittlerootTown_Text_KantoTruckDeparting:
    .string "The truck's engine roars to life.\p"
    .string "You feel the world shifting\n"
    .string "around you as you travel to Kanto…$"
```

---

## Pallet Town → Littleroot Town Warping

### Object Implementation

**Status**: ❌ **MISSING** - No truck object defined in `data/maps/PalletTown/map.json`

**Required Implementation**:
```json
{
  "local_id": "LOCALID_PALLET_HOENN_TRUCK",
  "graphics_id": "OBJ_EVENT_GFX_TRUCK",
  "x": 10,
  "y": 15,
  "elevation": 4,
  "movement_type": "MOVEMENT_TYPE_FACE_LEFT",
  "movement_range_x": 0,
  "movement_range_y": 0,
  "trainer_type": "TRAINER_TYPE_NONE",
  "trainer_sight_or_berry_tree_id": "0",
  "script": "PalletTown_EventScript_HoennTruck",
  "flag": "0"
}
```

### Script Implementation

**File**: `data/maps/PalletTown/scripts.inc`

#### Main Interaction Script
```asm
PalletTown_EventScript_HoennTruck::
    lock
    faceplayer
    msgbox PalletTown_Text_HoennTruckGreeting, MSGBOX_YESNO
    compare VAR_RESULT, YES
    goto_if_eq VAR_RESULT, YES, PalletTown_EventScript_ReturnToHoenn
    msgbox PalletTown_Text_HoennTruckMaybeLater, MSGBOX_DEFAULT
    release
    end
```

#### Warp Execution Script
```asm
PalletTown_EventScript_ReturnToHoenn::
    msgbox PalletTown_Text_HoennTruckDeparting, MSGBOX_DEFAULT
    fadescreen FADE_TO_BLACK
    delay 20
    warp MAP_LITTLEROOT_TOWN, 0, 18, 12
    fadescreen FADE_FROM_BLACK
    release
    end
```

### Access Control

**Unlock Condition**: Always available (no flag check required)
**Note**: This creates a one-way system where return to Hoenn is always possible

### Dialogue Messages

```asm
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
```

---

## Graphics System

### Truck Graphics

**Graphics ID**: `OBJ_EVENT_GFX_TRUCK` (ID: 94)
**File**: `include/constants/event_objects.h`
```c
#define OBJ_EVENT_GFX_TRUCK                       94
```

### Graphics Files

**Status**: ❌ **MISSING** - Required files not found
**Required Files**:
- `graphics/object_events/pics/objects/truck.png`
- `graphics/object_events/pics/objects/truck.pal`

**Source**: FireRed assets at `pokefirered-master/graphics/object_events/pics/objects/truck.*`

---

## Flag System

### Core Flags

| Flag | Purpose | Set When | Used For |
|------|---------|----------|----------|
| `FLAG_WARP_TRUCK_UNLOCKED` | Unlocks Kanto truck access | Hoenn Elite Four defeated | Littleroot → Pallet warping |
| `FLAG_ELITE_4_DEFEATED` | Tracks Hoenn Elite Four completion | Hall of Fame entry | Triggers truck unlock |

### Flag Management

**Setting Flags**:
```asm
setflag FLAG_WARP_TRUCK_UNLOCKED
```

**Checking Flags**:
```asm
checkflag FLAG_WARP_TRUCK_UNLOCKED
goto_if_eq VAR_RESULT, TRUE, ScriptName
```

---

## Map Coordinates

### Warp Destinations

| From | To | Coordinates | Map |
|------|----|-------------|-----|
| Littleroot Town | Pallet Town | (10, 10) | `MAP_PALLET_TOWN` |
| Pallet Town | Littleroot Town | (18, 12) | `MAP_LITTLEROOT_TOWN` |

### Coordinate System
- **X**: Horizontal position (0-31 typically)
- **Y**: Vertical position (0-31 typically)
- **Elevation**: Layer height (0=ground, 3=above ground, 4=above buildings)

---

## Visual Effects

### Screen Transitions

**Fade Out**:
```asm
fadescreen FADE_TO_BLACK
delay 20
```

**Fade In**:
```asm
fadescreen FADE_FROM_BLACK
```

### Timing
- **Delay**: 20 frames (approximately 0.33 seconds)
- **Purpose**: Smooth transition between regions

---

## Script Flow Diagrams

### Littleroot → Pallet Flow
```
Player interacts with truck
    ↓
Check FLAG_WARP_TRUCK_UNLOCKED
    ↓
If locked: Show locked message
If unlocked: Show travel prompt
    ↓
Player chooses YES/NO
    ↓
If YES: Execute warp sequence
    ↓
Fade to black → Warp → Fade from black
```

### Pallet → Littleroot Flow
```
Player interacts with truck
    ↓
Show return prompt (no flag check)
    ↓
Player chooses YES/NO
    ↓
If YES: Execute warp sequence
    ↓
Fade to black → Warp → Fade from black
```

---

## Technical Implementation Details

### Script Structure

**Standard Pattern**:
1. **Lock**: Prevent other interactions
2. **Face Player**: Orient NPC toward player
3. **Check Conditions**: Verify access requirements
4. **Show Dialogue**: Present options to player
5. **Handle Choice**: Branch based on player decision
6. **Execute Warp**: Perform transition with effects
7. **Release**: Allow other interactions

### Error Handling

**Missing Graphics**: System gracefully handles missing truck graphics
**Missing Object**: Script exists but no visual representation
**Flag Issues**: Proper flag checking prevents unauthorized access

---

## Current Issues and Solutions

### Known Issues

1. **Missing Pallet Town Truck Object**
   - **Problem**: No truck object in `PalletTown/map.json`
   - **Solution**: Add truck object with correct coordinates

2. **Missing Truck Graphics**
   - **Problem**: No `truck.png` or `truck.pal` files
   - **Solution**: Copy from FireRed assets

3. **One-Way System**
   - **Problem**: Only Littleroot → Pallet warping works
   - **Solution**: Implement Pallet Town truck object

### Implementation Checklist

- [ ] Add truck object to `PalletTown/map.json`
- [ ] Copy truck graphics from FireRed assets
- [ ] Test bidirectional warping
- [ ] Verify flag system functionality
- [ ] Test visual effects and timing

---

## Testing Procedures

### Functional Testing

1. **Access Control Test**
   - Verify truck is locked before Elite Four
   - Verify truck unlocks after Elite Four

2. **Warping Test**
   - Test Littleroot → Pallet warping
   - Test Pallet → Littleroot warping
   - Verify correct destination coordinates

3. **Visual Test**
   - Verify truck graphics display correctly
   - Verify screen transitions work smoothly

### Integration Testing

1. **Flag System Test**
   - Verify `FLAG_ELITE_4_DEFEATED` sets correctly
   - Verify `FLAG_WARP_TRUCK_UNLOCKED` sets correctly

2. **Save System Test**
   - Verify flags persist across save/load
   - Verify warping works after game restart

---

## File Dependencies

### Core Files
- `data/maps/LittlerootTown/map.json`
- `data/maps/LittlerootTown/scripts.inc`
- `data/maps/LittlerootTown/text.inc`
- `data/maps/PalletTown/map.json` (needs truck object)
- `data/maps/PalletTown/scripts.inc`
- `data/maps/PalletTown/text.inc`

### Supporting Files
- `data/scripts/hall_of_fame.inc`
- `data/scripts/inter_region_travel.inc`
- `include/constants/event_objects.h`
- `graphics/object_events/pics/objects/truck.png` (missing)
- `graphics/object_events/pics/objects/truck.pal` (missing)

---

## Future Enhancements

### Potential Improvements

1. **Bidirectional Unlock System**
   - Require Kanto Elite Four for return access
   - Add `FLAG_KANTO_ELITE_4_DEFEATED` flag

2. **Enhanced Visual Effects**
   - Add sound effects for truck engine
   - Implement particle effects during transition

3. **Story Integration**
   - Add dialogue explaining the truck's origin
   - Integrate with existing storylines

4. **Multiple Transport Options**
   - Add ferry system for coastal travel
   - Implement teleportation devices

---

## Conclusion

The inter-region warping system provides a foundation for seamless travel between Kanto and Hoenn regions. While the core functionality is implemented, several visual and object components need to be completed for full functionality. The system demonstrates proper use of game flags, script management, and coordinate-based warping.

**Current Status**: Partially implemented (one-way warping functional)
**Priority**: Complete Pallet Town truck object and graphics implementation
