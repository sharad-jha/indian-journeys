# 🚢 Inter-Region Ferry System - Simple Documentation

## Overview
The Inter-Region Ferry System allows travel between Hoenn and Kanto regions using region-specific ferry services:
- **Kanto**: Seagallop Hi-Speed Services (Vermilion City)
- **Hoenn**: SS Tidal Services (Slateport City)

## Key Features
- ✅ Exclusive access from each region's harbor
- ✅ Unlocks after defeating both Elite Four
- ✅ Direct travel between regions
- ✅ Authentic region-specific branding

---

## Technical Implementation

### Core Files
```
📁 data/maps/VermilionCity/
├── scripts.inc          # Kanto ferry scripts
└── map.json             # Ferry attendant object

📁 data/maps/SlateportCity_Harbor/
├── scripts.inc          # Hoenn ferry scripts  
└── map.json             # Ferry attendant object

📁 data/scripts/
└── hall_of_fame.inc     # Unlock logic
```

### Script Structure
Each ferry follows this pattern:
```assembly
[Location]_EventScript_InterRegionFerryAttendant::
    lock
    faceplayer
    goto_if_unset FLAG_FERRY_UNLOCKED, [Location]_EventScript_InterRegionFerryLocked
    msgbox [Location]_Text_WelcomeToInterRegionFerry, MSGBOX_YESNO
    goto_if_eq VAR_RESULT, NO, [Location]_EventScript_DeclineInterRegionFerry
    msgbox [Location]_Text_BoardingInterRegionFerry, MSGBOX_DEFAULT
    closemessage
    call [Location]_EventScript_BoardInterRegionFerry
    warp [DESTINATION_MAP], [X], [Y]
    waitstate
    release
    end
```

### Map Objects
**Vermilion City Ferry Attendant:**
```json
{
  "graphics_id": "OBJ_EVENT_GFX_CAPTAIN",
  "x": 32, "y": 18,
  "script": "VermilionCity_EventScript_InterRegionFerryAttendant"
}
```

**Slateport Harbor Ferry Attendant:**
```json
{
  "graphics_id": "OBJ_EVENT_GFX_CAPTAIN", 
  "x": 15, "y": 12,
  "script": "SlateportCity_Harbor_EventScript_InterRegionFerryAttendant"
}
```

---

## Unlock System

### Flags
- `FLAG_FERRY_UNLOCKED` - Controls ferry availability
- `FLAG_ELITE_4_DEFEATED` - Hoenn Elite Four defeated
- `FLAG_KANTO_ELITE_4_DEFEATED` - Kanto Elite Four defeated

### Unlock Logic
```assembly
EverGrandeCity_HallOfFame_EventScript_CheckFerryUnlock::
    checkflag FLAG_ELITE_4_DEFEATED
    goto_if_ne VAR_RESULT, TRUE, EverGrandeCity_HallOfFame_EventScript_TravelUnlockEnd
    checkflag FLAG_KANTO_ELITE_4_DEFEATED
    goto_if_ne VAR_RESULT, TRUE, EverGrandeCity_HallOfFame_EventScript_TravelUnlockEnd
    setflag FLAG_FERRY_UNLOCKED
    goto EverGrandeCity_HallOfFame_EventScript_TravelUnlockEnd
```

---

## Travel Mechanics

### Warp Destinations
- **Kanto → Hoenn**: `warp MAP_SLATEPORT_CITY_HARBOR, 12, 13`
- **Hoenn → Kanto**: `warp MAP_VERMILION_CITY, 15, 25`

### Movement Animation
```assembly
[Location]_Movement_BoardInterRegionFerry:
    walk_right
    walk_right
    walk_up
    step_end
```

---

## Dialogue System

### Key Messages
```assembly
VermilionCity_Text_WelcomeToInterRegionFerry:
    .string "CAPTAIN: Welcome to Seagallop\n"
    .string "Hi-Speed Services!\p"
    .string "Would you like to sail to the Hoenn\n"
    .string "region? It's quite a journey!$"

VermilionCity_Text_InterRegionFerryUnavailable:
    .string "CAPTAIN: I'm sorry, but the inter-region\n"
    .string "ferry service is currently unavailable.\p"
    .string "This route only opens to trainers who\n"
    .string "have proven themselves by defeating\l"
    .string "both the Hoenn and Kanto Elite Four!$"
```

---

## Future Customization

### Adding New Routes
1. Create new script following the pattern above
2. Add map object with correct coordinates
3. Add dialogue text
4. Update unlock conditions if needed

### Modifying Unlock Conditions
Edit `data/scripts/hall_of_fame.inc` to change when ferry becomes available.

### Customizing Dialogue
Modify text strings in the respective `scripts.inc` files.

---

## Troubleshooting

### Common Issues
- **Ferry not appearing**: Check map object coordinates and script reference
- **Warp not working**: Verify destination map exists and coordinates are valid
- **Dialogue not showing**: Check text string definitions and script syntax

### Key Files for Modifications
- Scripts: `data/maps/VermilionCity/scripts.inc`, `data/maps/SlateportCity_Harbor/scripts.inc`
- Map Objects: `data/maps/VermilionCity/map.json`, `data/maps/SlateportCity_Harbor/map.json`
- Unlock Logic: `data/scripts/hall_of_fame.inc`

---

## Integration Points

### Existing Systems
- **Seagallop System**: Coexists (different destinations)
- **Warp Truck System**: Alternative inter-region travel
- **Hall of Fame System**: Controls ferry unlock

### Potential Extensions
- Multiple ferry routes
- Time-based availability
- Ferry costs/tickets
- Special events during travel

---

# 🚛 Inter-Region Truck Warping System

## Overview
The Inter-Region Truck Warping System provides an alternative travel method between Hoenn and Kanto regions:
- **Hoenn**: Warp Truck in Littleroot Town
- **Kanto**: Warp Truck in Pallet Town

## Key Features
- ✅ Integrated with Littleroot Town intro sequence
- ✅ Unlocks after defeating Hoenn Elite Four
- ✅ Conditional visibility based on story progression
- ✅ Seamless integration with existing intro flow

---

## Technical Implementation

### Core Files
```
📁 data/maps/LittlerootTown/
├── scripts.inc          # Truck scripts and visibility logic
└── map.json             # Truck object definition

📁 data/maps/PalletTown/
├── scripts.inc          # Kanto truck scripts
└── map.json             # Truck object definition

📁 data/scripts/
└── hall_of_fame.inc     # Unlock logic
```

### Truck Visibility System
```assembly
LittlerootTown_EventScript_CheckKantoTruckVisibility::
    @ Show Kanto truck after initial sequence is complete
    goto_if_lt VAR_LITTLEROOT_INTRO_STATE, 3, LittlerootTown_EventScript_HideKantoTruck
    goto_if_lt VAR_LITTLEROOT_TOWN_STATE, 4, LittlerootTown_EventScript_HideKantoTruck
    clearflag FLAG_HIDE_LITTLEROOT_TOWN_KANTO_TRUCK
    return

LittlerootTown_EventScript_HideKantoTruck::
    setflag FLAG_HIDE_LITTLEROOT_TOWN_KANTO_TRUCK
    return
```

### Script Structure
```assembly
LittlerootTown_EventScript_KantoTruck::
    lock
    faceplayer
    checkflag FLAG_WARP_TRUCK_UNLOCKED
    goto_if_eq VAR_RESULT, TRUE, LittlerootTown_EventScript_KantoTruckUnlocked
    msgbox LittlerootTown_Text_KantoTruckLocked, MSGBOX_DEFAULT
    release
    end

LittlerootTown_EventScript_KantoTruckUnlocked::
    msgbox LittlerootTown_Text_KantoTruckUnlocked, MSGBOX_YESNO
    compare VAR_RESULT, YES
    goto_if_eq VAR_RESULT, YES, LittlerootTown_EventScript_GoToKanto
    msgbox LittlerootTown_Text_KantoTruckMaybeLater, MSGBOX_DEFAULT
    release
    end

LittlerootTown_EventScript_GoToKanto::
    msgbox LittlerootTown_Text_KantoTruckDeparting, MSGBOX_DEFAULT
    fadescreen FADE_TO_BLACK
    delay 20
    warp MAP_PALLET_TOWN, 0, 10, 10
    fadescreen FADE_FROM_BLACK
    release
    end
```

### Map Objects
**Littleroot Town Kanto Truck:**
```json
{
  "local_id": "LOCALID_LITTLEROOT_KANTO_TRUCK",
  "graphics_id": "OBJ_EVENT_GFX_TRUCK",
  "x": 18, "y": 12,
  "elevation": 4,
  "script": "LittlerootTown_EventScript_KantoTruck",
  "flag": "FLAG_HIDE_LITTLEROOT_TOWN_KANTO_TRUCK"
}
```

---

## Unlock System

### Flags
- `FLAG_WARP_TRUCK_UNLOCKED` - Controls truck availability
- `FLAG_ELITE_4_DEFEATED` - Hoenn Elite Four defeated
- `FLAG_HIDE_LITTLEROOT_TOWN_KANTO_TRUCK` - Controls truck visibility

### Unlock Logic
```assembly
EverGrandeCity_HallOfFame_EventScript_UnlockWarpTruck::
    setflag FLAG_WARP_TRUCK_UNLOCKED
    goto EverGrandeCity_HallOfFame_EventScript_CheckFerryUnlock
```

### Visibility Conditions
- **Hidden During**: Initial intro sequence (`VAR_LITTLEROOT_INTRO_STATE < 3`)
- **Hidden During**: Early story progression (`VAR_LITTLEROOT_TOWN_STATE < 4`)
- **Visible After**: Intro completion and story progression

---

## Travel Mechanics

### Warp Destinations
- **Hoenn → Kanto**: `warp MAP_PALLET_TOWN, 0, 10, 10`
- **Kanto → Hoenn**: `warp MAP_LITTLEROOT_TOWN, 0, 18, 12`

### Visual Effects
```assembly
fadescreen FADE_TO_BLACK
delay 20
warp MAP_PALLET_TOWN, 0, 10, 10
fadescreen FADE_FROM_BLACK
```

---

## Dialogue System

### Key Messages
```assembly
LittlerootTown_Text_KantoTruckLocked:
    .string "This truck appears to be locked.\p"
    .string "A note reads: 'Warp Truck to Kanto\n"
    .string "- Only for Champions who have\l"
    .string "defeated the Hoenn Elite Four!'$"

LittlerootTown_Text_KantoTruckUnlocked:
    .string "The truck is now unlocked!\p"
    .string "It seems to be some kind of\n"
    .string "transportation device.\p"
    .string "Would you like to travel to\n"
    .string "the Kanto region?$"

LittlerootTown_Text_KantoTruckDeparting:
    .string "The truck's engine starts up.\p"
    .string "You feel a strange sensation\n"
    .string "as the world around you shifts…$"
```

---

## Integration with Intro Sequence

### Visibility Logic
The truck integrates seamlessly with the existing Littleroot Town intro sequence:

1. **Initial State**: Truck hidden during intro
2. **Intro Completion**: Truck becomes visible after story progression
3. **Interaction**: Player can interact based on unlock status

### State Variables
- `VAR_LITTLEROOT_INTRO_STATE`: Controls intro sequence progress
- `VAR_LITTLEROOT_TOWN_STATE`: Controls town story progression

---

## Future Customization

### Adding New Truck Routes
1. Create new script following the pattern above
2. Add map object with correct coordinates and visibility flag
3. Add dialogue text
4. Update unlock conditions if needed

### Modifying Visibility Conditions
Edit `LittlerootTown_EventScript_CheckKantoTruckVisibility` to change when truck becomes visible.

### Customizing Dialogue
Modify text strings in `data/maps/LittlerootTown/scripts.inc`.

---

## Troubleshooting

### Common Issues
- **Truck not appearing**: Check visibility conditions and flag status
- **Warp not working**: Verify destination map exists and coordinates are valid
- **Dialogue not showing**: Check text string definitions and script syntax

### Key Files for Modifications
- Scripts: `data/maps/LittlerootTown/scripts.inc`, `data/maps/PalletTown/scripts.inc`
- Map Objects: `data/maps/LittlerootTown/map.json`, `data/maps/PalletTown/map.json`
- Unlock Logic: `data/scripts/hall_of_fame.inc`
- Flags: `include/constants/flags.h`

---

## Integration Points

### Existing Systems
- **Intro Sequence**: Seamlessly integrated with existing flow
- **Ferry System**: Alternative inter-region travel method
- **Hall of Fame System**: Controls truck unlock

### Potential Extensions
- Multiple truck routes
- Time-based availability
- Truck upgrades/enhancements
- Special events during travel

---

*This documentation provides essential technical details for understanding and modifying both the Inter-Region Ferry System and the Inter-Region Truck Warping System.*
