# 🚢 INTER-REGION FERRY SYSTEM - TECHNICAL DOCUMENTATION

## 📋 TABLE OF CONTENTS
1. [System Overview](#system-overview)
2. [Architecture & Design](#architecture--design)
3. [Core Files & Locations](#core-files--locations)
4. [Script Implementation](#script-implementation)
5. [Map Objects & NPCs](#map-objects--npcs)
6. [Unlock Conditions & Flags](#unlock-conditions--flags)
7. [Travel Mechanics](#travel-mechanics)
8. [Dialogue System](#dialogue-system)
9. [Future Customization Guide](#future-customization-guide)
10. [Troubleshooting](#troubleshooting)
11. [Integration Points](#integration-points)

---

## 🎯 SYSTEM OVERVIEW

### **Purpose**
The Inter-Region Ferry System enables travel between the Hoenn and Kanto regions using region-specific ferry services:
- **Kanto**: Seagallop Hi-Speed Services (Vermilion City)
- **Hoenn**: SS Tidal Services (Slateport City)

### **Key Features**
- ✅ **Exclusive Access**: Each service only available from its respective city
- ✅ **Conditional Unlock**: Requires defeating both Elite Four
- ✅ **Direct Travel**: No intermediate stops or loading screens
- ✅ **Authentic Branding**: Uses region-appropriate ferry services
- ✅ **Seamless Integration**: Works alongside existing Seagallop system

---

## 🏗️ ARCHITECTURE & DESIGN

### **System Flow**
```
Player Interaction → Script Check → Unlock Verification → Dialogue → Movement → Warp
```

### **Design Principles**
1. **Separation of Concerns**: Each region handles its own ferry logic
2. **Consistent Interface**: Same interaction pattern in both regions
3. **Conditional Access**: Controlled by game progression flags
4. **User-Friendly**: Clear dialogue and feedback

### **Data Flow**
```
Map Object → Event Script → Flag Check → Dialogue Branch → Movement → Warp Event
```

---

## 📁 CORE FILES & LOCATIONS

### **Primary Implementation Files**

#### **1. Kanto Side (Vermilion City)**
```
📁 data/maps/VermilionCity/
├── 📄 scripts.inc          # Main ferry scripts and dialogue
├── 📄 map.json             # Map object definitions
└── 📄 text.inc             # Text strings (if separate)
```

#### **2. Hoenn Side (Slateport Harbor)**
```
📁 data/maps/SlateportCity_Harbor/
├── 📄 scripts.inc          # Main ferry scripts and dialogue
├── 📄 map.json             # Map object definitions
└── 📄 text.inc             # Text strings (if separate)
```

#### **3. Unlock System**
```
📁 data/scripts/
└── 📄 hall_of_fame.inc     # Ferry unlock logic
```

### **Supporting Files**
```
📁 include/constants/
├── 📄 flags.h              # Flag definitions
└── 📄 vars.h               # Variable definitions

📁 src/
└── 📄 script.c             # Script execution engine
```

---

## 🔧 SCRIPT IMPLEMENTATION

### **Script Structure Pattern**

Each ferry system follows this consistent pattern:

```assembly
@ Inter-Region Ferry System
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

### **Key Script Functions**

#### **1. Main Attendant Script**
- **Purpose**: Primary interaction point
- **Location**: Both Vermilion City and Slateport Harbor
- **Function**: Handles player interaction and ferry logic

#### **2. Locked State Script**
- **Purpose**: Informs player about unlock requirements
- **Trigger**: When `FLAG_FERRY_UNLOCKED` is not set
- **Function**: Explains Elite Four defeat requirement

#### **3. Decline Script**
- **Purpose**: Handles player refusal
- **Trigger**: When player selects "No"
- **Function**: Provides friendly exit message

#### **4. Boarding Script**
- **Purpose**: Handles player movement to ferry
- **Function**: Applies movement animation before warp

---

## 🔧 SCRIPT IMPLEMENTATION

### **Script Structure Pattern**

Each ferry system follows this consistent pattern:

```assembly
@ Inter-Region Ferry System
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

### **Key Script Functions**

#### **1. Main Attendant Script**
- **Purpose**: Primary interaction point
- **Location**: Both Vermilion City and Slateport Harbor
- **Function**: Handles player interaction and ferry logic

#### **2. Locked State Script**
- **Purpose**: Informs player about unlock requirements
- **Trigger**: When `FLAG_FERRY_UNLOCKED` is not set
- **Function**: Explains Elite Four defeat requirement

#### **3. Decline Script**
- **Purpose**: Handles player refusal
- **Trigger**: When player selects "No"
- **Function**: Provides friendly exit message

#### **4. Boarding Script**
- **Purpose**: Handles player movement to ferry
- **Function**: Applies movement animation before warp

---

## 🗺️ MAP OBJECTS & NPCS

### **Object Definitions**

#### **Vermilion City Ferry Attendant**
```json
{
  "type": "object",
  "graphics_id": "OBJ_EVENT_GFX_CAPTAIN",
  "x": 32,
  "y": 18,
  "elevation": 3,
  "movement_type": "MOVEMENT_TYPE_FACE_LEFT",
  "movement_range_x": 0,
  "movement_range_y": 0,
  "trainer_type": "TRAINER_TYPE_NONE",
  "trainer_sight_or_berry_tree_id": "0",
  "script": "VermilionCity_EventScript_InterRegionFerryAttendant",
  "flag": "0"
}
```

#### **Slateport Harbor Ferry Attendant**
```json
{
  "graphics_id": "OBJ_EVENT_GFX_CAPTAIN",
  "x": 15,
  "y": 12,
  "elevation": 3,
  "movement_type": "MOVEMENT_TYPE_FACE_LEFT",
  "movement_range_x": 0,
  "movement_range_y": 0,
  "trainer_type": "TRAINER_TYPE_NONE",
  "trainer_sight_or_berry_tree_id": "0",
  "script": "SlateportCity_Harbor_EventScript_InterRegionFerryAttendant",
  "flag": "0"
}
```

### **NPC Graphics**
- **Graphics ID**: `OBJ_EVENT_GFX_CAPTAIN`
- **Appearance**: Captain sprite for both regions
- **Behavior**: Static, facing left (towards harbor)
- **Interaction**: Face-to-face dialogue

---

## 🚢 TRAVEL MECHANICS

### **Warp System**

#### **Kanto → Hoenn (Vermilion → Slateport)**
```assembly
warp MAP_SLATEPORT_CITY_HARBOR, 12, 13
```
- **Source**: Vermilion City (32, 18)
- **Destination**: Slateport Harbor (12, 13)
- **Service**: Seagallop Hi-Speed Services

#### **Hoenn → Kanto (Slateport → Vermilion)**
```assembly
warp MAP_VERMILION_CITY, 15, 25
```
- **Source**: Slateport Harbor (15, 12)
- **Destination**: Vermilion City (15, 25)
- **Service**: SS Tidal Services

### **Movement Animation**

#### **Boarding Movement**
```assembly
[Location]_Movement_BoardInterRegionFerry:
    walk_right
    walk_right
    walk_up
    step_end
```

#### **Movement Application**
```assembly
call [Location]_EventScript_BoardInterRegionFerry
```

### **Coordinate System**
- **X-Axis**: Left to Right (0-255)
- **Y-Axis**: Top to Bottom (0-255)
- **Elevation**: 0 (ground), 3 (above ground)

---

## 💬 DIALOGUE SYSTEM

### **Dialogue Structure**

#### **1. Welcome Message (Yes/No Choice)**
```assembly
VermilionCity_Text_WelcomeToInterRegionFerry:
    .string "CAPTAIN: Welcome to Seagallop\n"
    .string "Hi-Speed Services!\p"
    .string "Would you like to sail to the Hoenn\n"
    .string "region? It's quite a journey!$"
```

#### **2. Boarding Confirmation**
```assembly
VermilionCity_Text_BoardingInterRegionFerry:
    .string "CAPTAIN: All aboard! Next stop,\n"
    .string "Slateport City in Hoenn!$"
```

#### **3. Locked State Message**
```assembly
VermilionCity_Text_InterRegionFerryUnavailable:
    .string "CAPTAIN: I'm sorry, but the inter-region\n"
    .string "ferry service is currently unavailable.\p"
    .string "This route only opens to trainers who\n"
    .string "have proven themselves by defeating\l"
    .string "both the Hoenn and Kanto Elite Four!$"
```

#### **4. Decline Message**
```assembly
VermilionCity_Text_ComeBackForInterRegionFerry:
    .string "CAPTAIN: Come back anytime when\n"
    .string "you're ready to sail to Hoenn!$"
```

### **Dialogue Flow**
```
Welcome → Yes/No Choice → Boarding Confirmation → Movement → Warp
                ↓
            Decline Message
```

### **Text Formatting**
- **\n**: Line break
- **\p**: Paragraph break
- **\l**: Left-aligned text
- **{PLAYER}**: Player name placeholder

---

## 🔧 FUTURE CUSTOMIZATION GUIDE

### **1. Adding New Ferry Routes**

#### **Step 1: Create New Script**
```assembly
NewLocation_EventScript_NewFerryAttendant::
    lock
    faceplayer
    goto_if_unset FLAG_NEW_FERRY_UNLOCKED, NewLocation_EventScript_NewFerryLocked
    msgbox NewLocation_Text_WelcomeToNewFerry, MSGBOX_YESNO
    goto_if_eq VAR_RESULT, NO, NewLocation_EventScript_DeclineNewFerry
    msgbox NewLocation_Text_BoardingNewFerry, MSGBOX_DEFAULT
    closemessage
    call NewLocation_EventScript_BoardNewFerry
    warp MAP_NEW_DESTINATION, X, Y
    waitstate
    release
    end
```

#### **Step 2: Add Map Object**
```json
{
  "type": "object",
  "graphics_id": "OBJ_EVENT_GFX_CAPTAIN",
  "x": X_COORD,
  "y": Y_COORD,
  "elevation": 3,
  "movement_type": "MOVEMENT_TYPE_FACE_LEFT",
  "script": "NewLocation_EventScript_NewFerryAttendant",
  "flag": "0"
}
```

#### **Step 3: Add Dialogue**
```assembly
NewLocation_Text_WelcomeToNewFerry:
    .string "CAPTAIN: Welcome to [Service Name]!\p"
    .string "Would you like to sail to [Destination]?$"
```

### **2. Modifying Unlock Conditions**

#### **Change Elite Four Requirement**
```assembly
EverGrandeCity_HallOfFame_EventScript_CheckFerryUnlock::
    checkflag FLAG_CUSTOM_UNLOCK_CONDITION
    goto_if_ne VAR_RESULT, TRUE, EverGrandeCity_HallOfFame_EventScript_TravelUnlockEnd
    setflag FLAG_FERRY_UNLOCKED
    goto EverGrandeCity_HallOfFame_EventScript_TravelUnlockEnd
```

### **3. Customizing Dialogue**

#### **Add Dynamic Dialogue**
```assembly
VermilionCity_EventScript_InterRegionFerryAttendant::
    lock
    faceplayer
    goto_if_unset FLAG_FERRY_UNLOCKED, VermilionCity_EventScript_InterRegionFerryLocked
    
    @ Check for special conditions
    checkflag FLAG_SPECIAL_EVENT
    goto_if_eq VAR_RESULT, TRUE, VermilionCity_EventScript_SpecialFerryDialogue
    
    msgbox VermilionCity_Text_WelcomeToInterRegionFerry, MSGBOX_YESNO
    goto_if_eq VAR_RESULT, NO, VermilionCity_EventScript_DeclineInterRegionFerry
    msgbox VermilionCity_Text_BoardingInterRegionFerry, MSGBOX_DEFAULT
    closemessage
    call VermilionCity_EventScript_BoardInterRegionFerry
    warp MAP_SLATEPORT_CITY_HARBOR, 12, 13
    waitstate
    release
    end
```

---

## 🔍 TROUBLESHOOTING

### **Common Issues**

#### **1. Ferry Not Appearing**
- **Check**: Map object coordinates in `map.json`
- **Check**: Script reference in map object
- **Check**: Flag `FLAG_FERRY_UNLOCKED` is set

#### **2. Warp Not Working**
- **Check**: Destination map exists
- **Check**: Coordinates are valid
- **Check**: Map connections are set up

#### **3. Dialogue Not Showing**
- **Check**: Text strings are properly defined
- **Check**: Script syntax is correct
- **Check**: MSGBOX parameters are valid

### **Key Files for Modifications**
- **Scripts**: `data/maps/VermilionCity/scripts.inc`, `data/maps/SlateportCity_Harbor/scripts.inc`
- **Map Objects**: `data/maps/VermilionCity/map.json`, `data/maps/SlateportCity_Harbor/map.json`
- **Unlock Logic**: `data/scripts/hall_of_fame.inc`
- **Flags**: `include/constants/flags.h`

---

## 📝 CONCLUSION

The Inter-Region Ferry System provides a robust foundation for inter-region travel with clear separation of concerns, consistent interfaces, and extensible architecture. The modular design allows for easy customization and enhancement while maintaining compatibility with existing game systems.

### **Key Strengths**
- ✅ **Modular Design**: Easy to modify individual components
- ✅ **Consistent Interface**: Same interaction pattern across regions
- ✅ **Extensible Architecture**: Ready for future enhancements
- ✅ **Clear Documentation**: Well-documented for maintainability
- ✅ **Integration Ready**: Works with existing game systems

### **Future Considerations**
- **Performance**: Monitor warp execution time
- **User Experience**: Consider adding travel animations
- **Content**: Expand dialogue variety
- **Features**: Add ferry-specific events and encounters

---

*This documentation serves as a comprehensive guide for understanding, maintaining, and extending the Inter-Region Ferry System. For questions or additional customization needs, refer to the core files listed in this document.*

## 🔓 UNLOCK CONDITIONS & FLAGS

### **Flag System**

#### **Primary Flag**
```c
FLAG_FERRY_UNLOCKED
```
- **Purpose**: Controls ferry system availability
- **Set When**: Both Elite Four are defeated
- **Checked By**: Both ferry attendants

#### **Prerequisite Flags**
```c
FLAG_ELITE_4_DEFEATED      // Hoenn Elite Four
FLAG_KANTO_ELITE_4_DEFEATED // Kanto Elite Four
```

### **Unlock Logic**

Located in `data/scripts/hall_of_fame.inc`:

```assembly
EverGrandeCity_HallOfFame_EventScript_CheckFerryUnlock::
    checkflag FLAG_ELITE_4_DEFEATED
    goto_if_ne VAR_RESULT, TRUE, EverGrandeCity_HallOfFame_EventScript_TravelUnlockEnd
    checkflag FLAG_KANTO_ELITE_4_DEFEATED
    goto_if_ne VAR_RESULT, TRUE, EverGrandeCity_HallOfFame_EventScript_TravelUnlockEnd
    setflag FLAG_FERRY_UNLOCKED
    goto EverGrandeCity_HallOfFame_EventScript_TravelUnlockEnd
```

### **Flag Usage in Scripts**
```assembly
goto_if_unset FLAG_FERRY_UNLOCKED, [Location]_EventScript_InterRegionFerryLocked
```

---

## 🚢 TRAVEL MECHANICS

### **Warp System**

#### **Kanto → Hoenn (Vermilion → Slateport)**
```assembly
warp MAP_SLATEPORT_CITY_HARBOR, 12, 13
```
- **Source**: Vermilion City (32, 18)
- **Destination**: Slateport Harbor (12, 13)
- **Service**: Seagallop Hi-Speed Services

#### **Hoenn → Kanto (Slateport → Vermilion)**
```assembly
warp MAP_VERMILION_CITY, 15, 25
```
- **Source**: Slateport Harbor (15, 12)
- **Destination**: Vermilion City (15, 25)
- **Service**: SS Tidal Services

### **Movement Animation**

#### **Boarding Movement**
```assembly
[Location]_Movement_BoardInterRegionFerry:
    walk_right
    walk_right
    walk_up
    step_end
```

#### **Movement Application**
```assembly
call [Location]_EventScript_BoardInterRegionFerry
```

### **Coordinate System**
- **X-Axis**: Left to Right (0-255)
- **Y-Axis**: Top to Bottom (0-255)
- **Elevation**: 0 (ground), 3 (above ground)

---

## 💬 DIALOGUE SYSTEM

### **Dialogue Structure**

#### **1. Welcome Message (Yes/No Choice)**
```assembly
VermilionCity_Text_WelcomeToInterRegionFerry:
    .string "CAPTAIN: Welcome to Seagallop\n"
    .string "Hi-Speed Services!\p"
    .string "Would you like to sail to the Hoenn\n"
    .string "region? It's quite a journey!$"
```

#### **2. Boarding Confirmation**
```assembly
VermilionCity_Text_BoardingInterRegionFerry:
    .string "CAPTAIN: All aboard! Next stop,\n"
    .string "Slateport City in Hoenn!$"
```

#### **3. Locked State Message**
```assembly
VermilionCity_Text_InterRegionFerryUnavailable:
    .string "CAPTAIN: I'm sorry, but the inter-region\n"
    .string "ferry service is currently unavailable.\p"
    .string "This route only opens to trainers who\n"
    .string "have proven themselves by defeating\l"
    .string "both the Hoenn and Kanto Elite Four!$"
```

#### **4. Decline Message**
```assembly
VermilionCity_Text_ComeBackForInterRegionFerry:
    .string "CAPTAIN: Come back anytime when\n"
    .string "you're ready to sail to Hoenn!$"
```

### **Dialogue Flow**
```
Welcome → Yes/No Choice → Boarding Confirmation → Movement → Warp
                ↓
            Decline Message
```

### **Text Formatting**
- **\n**: Line break
- **\p**: Paragraph break
- **\l**: Left-aligned text
- **{PLAYER}**: Player name placeholder

---

## 🔧 FUTURE CUSTOMIZATION GUIDE

### **1. Adding New Ferry Routes**

#### **Step 1: Create New Script**
```assembly
NewLocation_EventScript_NewFerryAttendant::
    lock
    faceplayer
    goto_if_unset FLAG_NEW_FERRY_UNLOCKED, NewLocation_EventScript_NewFerryLocked
    msgbox NewLocation_Text_WelcomeToNewFerry, MSGBOX_YESNO
    goto_if_eq VAR_RESULT, NO, NewLocation_EventScript_DeclineNewFerry
    msgbox NewLocation_Text_BoardingNewFerry, MSGBOX_DEFAULT
    closemessage
    call NewLocation_EventScript_BoardNewFerry
    warp MAP_NEW_DESTINATION, X, Y
    waitstate
    release
    end
```

#### **Step 2: Add Map Object**
```json
{
  "type": "object",
  "graphics_id": "OBJ_EVENT_GFX_CAPTAIN",
  "x": X_COORD,
  "y": Y_COORD,
  "elevation": 3,
  "movement_type": "MOVEMENT_TYPE_FACE_LEFT",
  "script": "NewLocation_EventScript_NewFerryAttendant",
  "flag": "0"
}
```

#### **Step 3: Add Dialogue**
```assembly
NewLocation_Text_WelcomeToNewFerry:
    .string "CAPTAIN: Welcome to [Service Name]!\p"
    .string "Would you like to sail to [Destination]?$"
```

### **2. Modifying Unlock Conditions**

#### **Change Elite Four Requirement**
```assembly
EverGrandeCity_HallOfFame_EventScript_CheckFerryUnlock::
    checkflag FLAG_CUSTOM_UNLOCK_CONDITION
    goto_if_ne VAR_RESULT, TRUE, EverGrandeCity_HallOfFame_EventScript_TravelUnlockEnd
    setflag FLAG_FERRY_UNLOCKED
    goto EverGrandeCity_HallOfFame_EventScript_TravelUnlockEnd
```

#### **Add Multiple Unlock Conditions**
```assembly
EverGrandeCity_HallOfFame_EventScript_CheckFerryUnlock::
    checkflag FLAG_ELITE_4_DEFEATED
    goto_if_ne VAR_RESULT, TRUE, EverGrandeCity_HallOfFame_EventScript_TravelUnlockEnd
    checkflag FLAG_KANTO_ELITE_4_DEFEATED
    goto_if_ne VAR_RESULT, TRUE, EverGrandeCity_HallOfFame_EventScript_TravelUnlockEnd
    checkflag FLAG_ADDITIONAL_CONDITION
    goto_if_ne VAR_RESULT, TRUE, EverGrandeCity_HallOfFame_EventScript_TravelUnlockEnd
    setflag FLAG_FERRY_UNLOCKED
    goto EverGrandeCity_HallOfFame_EventScript_TravelUnlockEnd
```

### **3. Customizing Dialogue**

#### **Add Dynamic Dialogue**
```assembly
VermilionCity_EventScript_InterRegionFerryAttendant::
    lock
    faceplayer
    goto_if_unset FLAG_FERRY_UNLOCKED, VermilionCity_EventScript_InterRegionFerryLocked
    
    @ Check for special conditions
    checkflag FLAG_SPECIAL_EVENT
    goto_if_eq VAR_RESULT, TRUE, VermilionCity_EventScript_SpecialFerryDialogue
    
    msgbox VermilionCity_Text_WelcomeToInterRegionFerry, MSGBOX_YESNO
    goto_if_eq VAR_RESULT, NO, VermilionCity_EventScript_DeclineInterRegionFerry
    msgbox VermilionCity_Text_BoardingInterRegionFerry, MSGBOX_DEFAULT
    closemessage
    call VermilionCity_EventScript_BoardInterRegionFerry
    warp MAP_SLATEPORT_CITY_HARBOR, 12, 13
    waitstate
    release
    end

VermilionCity_EventScript_SpecialFerryDialogue::
    msgbox VermilionCity_Text_SpecialFerryMessage, MSGBOX_YESNO
    goto_if_eq VAR_RESULT, NO, VermilionCity_EventScript_DeclineInterRegionFerry
    msgbox VermilionCity_Text_SpecialBoardingMessage, MSGBOX_DEFAULT
    closemessage
    call VermilionCity_EventScript_BoardInterRegionFerry
    warp MAP_SLATEPORT_CITY_HARBOR, 12, 13
    waitstate
    release
    end
```

### **4. Adding Ferry Animations**

#### **Custom Movement Patterns**
```assembly
VermilionCity_Movement_BoardInterRegionFerry:
    walk_right
    walk_right
    walk_up
    walk_up
    walk_right
    step_end
```

#### **Add Sound Effects**
```assembly
VermilionCity_EventScript_BoardInterRegionFerry::
    playse SE_FERRY_OUT
    applymovement LOCALID_PLAYER, VermilionCity_Movement_BoardInterRegionFerry
    waitmovement 0
    return
```

### **5. Implementing Ferry Schedules**

#### **Time-Based Availability**
```assembly
VermilionCity_EventScript_InterRegionFerryAttendant::
    lock
    faceplayer
    
    @ Check time of day
    gettimeofday
    goto_if_eq VAR_RESULT, TIME_MORNING, VermilionCity_EventScript_MorningFerry
    goto_if_eq VAR_RESULT, TIME_DAY, VermilionCity_EventScript_DayFerry
    goto_if_eq VAR_RESULT, TIME_EVENING, VermilionCity_EventScript_EveningFerry
    goto VermilionCity_EventScript_NightFerryClosed
    end

VermilionCity_EventScript_NightFerryClosed::
    msgbox VermilionCity_Text_FerryClosedAtNight, MSGBOX_DEFAULT
    release
    end
```

### **6. Adding Ferry Costs**

#### **Item-Based Payment**
```assembly
VermilionCity_EventScript_InterRegionFerryAttendant::
    lock
    faceplayer
    goto_if_unset FLAG_FERRY_UNLOCKED, VermilionCity_EventScript_InterRegionFerryLocked
    
    @ Check for ferry ticket
    checkitem ITEM_FERRY_TICKET, 1
    goto_if_eq VAR_RESULT, FALSE, VermilionCity_EventScript_NoFerryTicket
    
    msgbox VermilionCity_Text_WelcomeToInterRegionFerry, MSGBOX_YESNO
    goto_if_eq VAR_RESULT, NO, VermilionCity_EventScript_DeclineInterRegionFerry
    
    @ Consume ticket
    removeitem ITEM_FERRY_TICKET, 1
    
    msgbox VermilionCity_Text_BoardingInterRegionFerry, MSGBOX_DEFAULT
    closemessage
    call VermilionCity_EventScript_BoardInterRegionFerry
    warp MAP_SLATEPORT_CITY_HARBOR, 12, 13
    waitstate
    release
    end

VermilionCity_EventScript_NoFerryTicket::
    msgbox VermilionCity_Text_NeedFerryTicket, MSGBOX_DEFAULT
    release
    end
```

---

## 🔍 TROUBLESHOOTING

### **Common Issues**

#### **1. Ferry Not Appearing**
- **Check**: Map object coordinates in `map.json`
- **Check**: Script reference in map object
- **Check**: Flag `FLAG_FERRY_UNLOCKED` is set

#### **2. Warp Not Working**
- **Check**: Destination map exists
- **Check**: Coordinates are valid
- **Check**: Map connections are set up

#### **3. Dialogue Not Showing**
- **Check**: Text strings are properly defined
- **Check**: Script syntax is correct
- **Check**: MSGBOX parameters are valid

#### **4. Movement Animation Issues**
- **Check**: Movement script exists
- **Check**: Coordinates are reachable
- **Check**: No obstacles in path

### **Debug Commands**

#### **Check Flag Status**
```assembly
@ Add to script for debugging
checkflag FLAG_FERRY_UNLOCKED
goto_if_eq VAR_RESULT, TRUE, Debug_FerryUnlocked
msgbox Debug_Text_FerryLocked, MSGBOX_DEFAULT
goto Debug_End

Debug_FerryUnlocked::
msgbox Debug_Text_FerryUnlocked, MSGBOX_DEFAULT

Debug_End::
release
end
```

#### **Check Player Position**
```assembly
@ Add to script for debugging
getplayerxy VAR_0x8000, VAR_0x8001
msgbox Debug_Text_PlayerPosition, MSGBOX_DEFAULT
release
end
```

---

## 🔗 INTEGRATION POINTS

### **Existing Systems**

#### **1. Seagallop System**
- **Location**: `data/scripts/seagallop.inc`
- **Integration**: Coexists with inter-region ferry
- **Conflict**: None - different destinations

#### **2. Warp Truck System**
- **Location**: `data/maps/LittlerootTown/scripts.inc`
- **Integration**: Alternative inter-region travel
- **Conflict**: None - different unlock conditions

#### **3. Hall of Fame System**
- **Location**: `data/scripts/hall_of_fame.inc`
- **Integration**: Controls ferry unlock
- **Modification**: Add new unlock conditions here

### **Potential Extensions**

#### **1. Multiple Ferry Routes**
- Add new ferry attendants in different cities
- Create new unlock conditions
- Implement route selection system

#### **2. Ferry Schedules**
- Time-based availability
- Weather-dependent operation
- Seasonal routes

#### **3. Ferry Upgrades**
- Faster travel options
- Luxury ferry services
- Special event ferries

#### **4. Ferry Events**
- Random encounters during travel
- Special dialogue based on story progress
- Ferry-specific side quests

---

## 📝 CONCLUSION

The Inter-Region Ferry System provides a robust foundation for inter-region travel with clear separation of concerns, consistent interfaces, and extensible architecture. The modular design allows for easy customization and enhancement while maintaining compatibility with existing game systems.

### **Key Strengths**
- ✅ **Modular Design**: Easy to modify individual components
- ✅ **Consistent Interface**: Same interaction pattern across regions
- ✅ **Extensible Architecture**: Ready for future enhancements
- ✅ **Clear Documentation**: Well-documented for maintainability
- ✅ **Integration Ready**: Works with existing game systems

### **Future Considerations**
- **Performance**: Monitor warp execution time
- **User Experience**: Consider adding travel animations
- **Content**: Expand dialogue variety
- **Features**: Add ferry-specific events and encounters

---

*This documentation serves as a comprehensive guide for understanding, maintaining, and extending the Inter-Region Ferry System. For questions or additional customization needs, refer to the core files listed in this document.*
