# KANTO IMPLEMENTATION CONTEXT DOCUMENTATION

## 🎯 PROJECT OVERVIEW

**Goal**: Implement complete Kanto region functionality from FireRed original assets into the Indian Journeys project, including all scripts, events, items, TMs, and game mechanics.

**Current Status**: Phase 2 (Gym Leader Scripts) in progress - 2/8 gym leaders completed.

## 📊 COMPREHENSIVE ASSET STATUS

### ✅ COMPLETED (100% Done)
- **Graphics & NPCs**: 91 Kanto NPCs with complete graphics and palettes
- **Maps & Layouts**: 100+ Kanto map directories with proper layouts
- **Trainers & Battles**: 100+ Kanto trainers with complete party data
- **Items & TMs**: FireRed-specific items and 51 TMs defined
- **Constants**: All object event and trainer constants mapped

### ❌ MISSING (0% Done)
- **Scripts & Events**: 54 Kanto event scripts need porting
- **Game Mechanics**: All interactive gameplay elements missing

## 🏗️ IMPLEMENTATION APPROACH

### **Methodology**: Phased Implementation with High Verbosity
1. **Break down into very small tasks** (1-2 steps each)
2. **Execute step-by-step with detailed logging**
3. **Verify each step before proceeding**
4. **Create backups before major changes**
5. **Test integration points**

### **File Structure Pattern**:
```
data/maps/[LocationName]/scripts.inc  # Event scripts
data/maps/[LocationName]/text.inc     # Text strings
data/event_scripts.s                   # Main include file
```

### **Integration Pattern**:
1. Copy script files from `pokefirered-master/data/maps/[Location]/`
2. Copy text files from `pokefirered-master/data/maps/[Location]/`
3. Add includes to `data/event_scripts.s`
4. Fix trainer constant references (TRAINER_LEADER_X → TRAINER_X)
5. Verify all dependencies exist

### **Detailed Task Steps for Each Gym Leader**:

#### **Step-by-Step Implementation Process**:
1. **Preparation**:
   - Check if destination directory exists: `data/maps/[LocationName]/`
   - Create directory if needed
   - Verify source files exist in `pokefirered-master/data/maps/[LocationName]/`

2. **Copy Script Files**:
   - Copy `scripts.inc` from source to destination
   - Copy `text.inc` from source to destination
   - Verify both files were copied successfully

3. **Add Includes to Main File**:
   - Open `data/event_scripts.s`
   - Add `.include "data/maps/[LocationName]/scripts.inc"`
   - Add `.include "data/maps/[LocationName]/text.inc"`
   - Place includes in appropriate section (after existing includes)

4. **Fix Trainer Constants**:
   - Open the copied `scripts.inc` file
   - Find `TRAINER_LEADER_[NAME]` references
   - Replace with `TRAINER_[NAME]`
   - Verify the trainer constant exists in `include/constants/opponents.h`

5. **Verification**:
   - Check if script file exists in destination
   - Check if text file exists in destination
   - Check if includes are added to `event_scripts.s`
   - Check if trainer constant exists
   - Check if trainer constant is correctly referenced

6. **Documentation**:
   - Update progress in this context document
   - Mark gym leader as completed
   - Note any issues or special considerations

## 📋 IMPLEMENTATION PHASES

### **PHASE 1: ANALYSIS AND PLANNING** ✅ COMPLETED
- Created backup of `event_scripts.s`
- Analyzed FireRed master scripts structure
- Found 54 Kanto-related script files
- Found 191 Kanto map script files
- Created implementation plan

### **PHASE 2: GYM LEADER SCRIPTS** 🚧 IN PROGRESS
**Goal**: Implement all 8 Kanto gym leaders with full battle functionality

**Completed**:
- ✅ **Brock (Pewter City Gym)**
  - Copied `scripts.inc` and `text.inc`
  - Added includes to `event_scripts.s`
  - Fixed trainer constant: `TRAINER_LEADER_BROCK` → `TRAINER_BROCK`
  - Status: Ready for testing

- ✅ **Misty (Cerulean City Gym)**
  - Copied `scripts.inc` and `text.inc`
  - Added includes to `event_scripts.s`
  - Fixed trainer constant: `TRAINER_LEADER_MISTY` → `TRAINER_MISTY`
  - Status: Ready for testing

**Remaining** (6 gym leaders):
- ⏳ Lt. Surge (Vermilion City Gym)
- ⏳ Erika (Celadon City Gym)
- ⏳ Koga (Fuchsia City Gym)
- ⏳ Sabrina (Saffron City Gym)
- ⏳ Blaine (Cinnabar Island Gym)
- ⏳ Giovanni (Viridian City Gym)

### **PHASE 3: ELITE FOUR & CHAMPION SCRIPTS** ⏳ PENDING
**Goal**: Implement Elite Four and Champion battle scripts
- Lorelei, Bruno, Agatha, Lance, Blue

**Implementation Steps**:
1. **Lorelei (Elite Four #1)**:
   - Copy `pokefirered-master/data/maps/IndigoPlateau_LoreleisRoom/scripts.inc`
   - Copy `pokefirered-master/data/maps/IndigoPlateau_LoreleisRoom/text.inc`
   - Add includes to `event_scripts.s`
   - Fix trainer constant: `TRAINER_LEADER_LORELEI` → `TRAINER_LORELEI`

2. **Bruno (Elite Four #2)**:
   - Copy `pokefirered-master/data/maps/IndigoPlateau_BrunosRoom/scripts.inc`
   - Copy `pokefirered-master/data/maps/IndigoPlateau_BrunosRoom/text.inc`
   - Add includes to `event_scripts.s`
   - Fix trainer constant: `TRAINER_LEADER_BRUNO` → `TRAINER_BRUNO`

3. **Agatha (Elite Four #3)**:
   - Copy `pokefirered-master/data/maps/IndigoPlateau_AgathasRoom/scripts.inc`
   - Copy `pokefirered-master/data/maps/IndigoPlateau_AgathasRoom/text.inc`
   - Add includes to `event_scripts.s`
   - Fix trainer constant: `TRAINER_LEADER_AGATHA` → `TRAINER_AGATHA`

4. **Lance (Elite Four #4)**:
   - Copy `pokefirered-master/data/maps/IndigoPlateau_LancesRoom/scripts.inc`
   - Copy `pokefirered-master/data/maps/IndigoPlateau_LancesRoom/text.inc`
   - Add includes to `event_scripts.s`
   - Fix trainer constant: `TRAINER_LEADER_LANCE` → `TRAINER_LANCE`

5. **Blue (Champion)**:
   - Copy `pokefirered-master/data/maps/IndigoPlateau_ChampionsRoom/scripts.inc`
   - Copy `pokefirered-master/data/maps/IndigoPlateau_ChampionsRoom/text.inc`
   - Add includes to `event_scripts.s`
   - Fix trainer constant: `TRAINER_LEADER_BLUE` → `TRAINER_BLUE`

### **PHASE 4: STORY EVENT SCRIPTS** ⏳ PENDING
**Goal**: Implement major story events
- Team Rocket encounters
- Silph Co. takeover
- Pokemon Tower events
- SS Anne events
- Pokemon Mansion

**Implementation Steps**:
1. **Team Rocket Events**:
   - Copy all `pokefirered-master/data/maps/[TeamRocketLocation]/scripts.inc`
   - Copy all `pokefirered-master/data/maps/[TeamRocketLocation]/text.inc`
   - Add includes to `event_scripts.s`
   - Fix trainer constants for all Team Rocket members

2. **Silph Co. Events**:
   - Copy `pokefirered-master/data/maps/SaffronCity_SilphCo/scripts.inc`
   - Copy `pokefirered-master/data/maps/SaffronCity_SilphCo/text.inc`
   - Add includes to `event_scripts.s`
   - Fix trainer constants for Giovanni and Team Rocket

3. **Pokemon Tower Events**:
   - Copy `pokefirered-master/data/maps/LavenderTown_PokemonTower/scripts.inc`
   - Copy `pokefirered-master/data/maps/LavenderTown_PokemonTower/text.inc`
   - Add includes to `event_scripts.s`
   - Fix trainer constants for Team Rocket

4. **SS Anne Events**:
   - Copy `pokefirered-master/data/maps/SSAnne/scripts.inc`
   - Copy `pokefirered-master/data/maps/SSAnne/text.inc`
   - Add includes to `event_scripts.s`
   - Fix trainer constants for SS Anne trainers

5. **Pokemon Mansion Events**:
   - Copy `pokefirered-master/data/maps/CinnabarIsland_PokemonMansion/scripts.inc`
   - Copy `pokefirered-master/data/maps/CinnabarIsland_PokemonMansion/text.inc`
   - Add includes to `event_scripts.s`
   - Fix trainer constants for mansion trainers

### **PHASE 5: SPECIAL LOCATION SCRIPTS** ⏳ PENDING
**Goal**: Implement special location functionality
- Safari Zone
- Game Corner
- Pokemon Centers
- Marts

**Implementation Steps**:
1. **Safari Zone**:
   - Copy `pokefirered-master/data/maps/FuchsiaCity_SafariZone/scripts.inc`
   - Copy `pokefirered-master/data/maps/FuchsiaCity_SafariZone/text.inc`
   - Add includes to `event_scripts.s`
   - Implement Safari Zone mechanics

2. **Game Corner**:
   - Copy `pokefirered-master/data/maps/CeladonCity_GameCorner/scripts.inc`
   - Copy `pokefirered-master/data/maps/CeladonCity_GameCorner/text.inc`
   - Add includes to `event_scripts.s`
   - Implement slot machine mechanics

3. **Pokemon Centers**:
   - Copy all `pokefirered-master/data/maps/[City]_PokemonCenter/scripts.inc`
   - Copy all `pokefirered-master/data/maps/[City]_PokemonCenter/text.inc`
   - Add includes to `event_scripts.s`
   - Implement healing mechanics

4. **Marts**:
   - Copy all `pokefirered-master/data/maps/[City]_PokemonMart/scripts.inc`
   - Copy all `pokefirered-master/data/maps/[City]_PokemonMart/text.inc`
   - Add includes to `event_scripts.s`
   - Implement shopping mechanics

### **PHASE 6: INTEGRATION & TESTING** ⏳ PENDING
**Goal**: Test all implementations and fix any issues

**Implementation Steps**:
1. **Compilation Testing**:
   - Run build process to check for compilation errors
   - Fix any syntax errors in scripts
   - Fix any missing includes or references

2. **Functionality Testing**:
   - Test each gym leader battle
   - Test Elite Four battles
   - Test story events
   - Test special locations

3. **Integration Testing**:
   - Verify all trainer constants are correctly mapped
   - Verify all text strings are properly referenced
   - Verify all flags are set correctly
   - Verify all items and TMs are given properly

4. **Bug Fixing**:
   - Fix any issues found during testing
   - Update scripts as needed
   - Re-test after fixes

5. **Final Verification**:
   - Complete end-to-end testing
   - Verify all Kanto functionality works
   - Document any remaining issues

## 🔧 TECHNICAL LEARNINGS

### **Trainer Constant Mapping**:
- FireRed uses `TRAINER_LEADER_X` format
- Our project uses `TRAINER_X` format
- **Solution**: Replace all `TRAINER_LEADER_X` with `TRAINER_X` in scripts

### **File Dependencies**:
- Each gym needs both `scripts.inc` and `text.inc`
- Both files must be included in `event_scripts.s`
- Scripts reference text strings by name

### **Backup Strategy**:
- Created `event_scripts.s.backup` before modifications
- Each phase creates its own backup
- Can rollback if issues occur

### **Verification Process**:
1. Check if script files exist
2. Check if text files exist
3. Check if includes are added to `event_scripts.s`
4. Check if trainer constants exist
5. Check if trainer constants are correctly referenced

## 🎮 GAME MECHANICS UNDERSTANDING

### **Gym Battle Flow**:
1. Player approaches gym leader
2. Gym leader gives intro speech
3. Battle begins with gym leader's team
4. If player wins:
   - Badge is awarded
   - TM is given
   - Post-battle dialogue
   - Flags are set for story progression
5. If player loses:
   - Defeat dialogue
   - Player can try again

### **Key Script Functions**:
- `trainerbattle_single`: Initiates trainer battle
- `setflag`: Sets story progression flags
- `giveitem_msg`: Gives items to player
- `msgbox`: Displays dialogue
- `famechecker`: Updates fame checker

### **Important Flags**:
- `FLAG_DEFEATED_BROCK`: Tracks if Brock is defeated
- `FLAG_BADGE01_GET`: Tracks Boulder Badge acquisition
- `FLAG_GOT_TM39_FROM_BROCK`: Tracks TM39 acquisition

## 🚀 NEXT STEPS

### **Immediate (Continue Phase 2)**:
1. Implement Lt. Surge (Vermilion City Gym)
2. Implement Erika (Celadon City Gym)
3. Implement Koga (Fuchsia City Gym)
4. Implement Sabrina (Saffron City Gym)
5. Implement Blaine (Cinnabar Island Gym)
6. Implement Giovanni (Viridian City Gym)

### **After Phase 2**:
1. Move to Phase 3 (Elite Four & Champion)
2. Move to Phase 4 (Story Events)
3. Move to Phase 5 (Special Locations)
4. Move to Phase 6 (Integration & Testing)

## 🔍 TROUBLESHOOTING GUIDE

### **Common Issues**:
1. **Script not found**: Check if file was copied correctly
2. **Text not found**: Check if text.inc was included
3. **Trainer not found**: Check if trainer constant exists
4. **Include not working**: Check if path is correct in event_scripts.s

### **Verification Commands**:
```powershell
# Check if script exists
Test-Path "data\maps\[Location]\scripts.inc"

# Check if text exists
Test-Path "data\maps\[Location]\text.inc"

# Check if include is added
Select-String "[Location]/scripts.inc" "data\event_scripts.s"

# Check if trainer constant exists
Select-String "TRAINER_[NAME]" "include\constants\opponents.h"
```

### **PowerShell Commands for Each Task**:

#### **For Each Gym Leader Implementation**:
```powershell
# Step 1: Check if directory exists
Test-Path "data\maps\[LocationName]"

# Step 2: Copy script files
Copy-Item "pokefirered-master\data\maps\[LocationName]\scripts.inc" "data\maps\[LocationName]\scripts.inc"
Copy-Item "pokefirered-master\data\maps\[LocationName]\text.inc" "data\maps\[LocationName]\text.inc"

# Step 3: Add includes to event_scripts.s
Add-Content "data\event_scripts.s" "	.include `"data/maps/[LocationName]/scripts.inc`""
Add-Content "data\event_scripts.s" "	.include `"data/maps/[LocationName]/text.inc`""

# Step 4: Fix trainer constants
(Get-Content "data\maps\[LocationName]\scripts.inc") -replace "TRAINER_LEADER_[NAME]", "TRAINER_[NAME]" | Set-Content "data\maps\[LocationName]\scripts.inc"

# Step 5: Verify implementation
Test-Path "data\maps\[LocationName]\scripts.inc"
Test-Path "data\maps\[LocationName]\text.inc"
Select-String "[LocationName]/scripts.inc" "data\event_scripts.s"
Select-String "TRAINER_[NAME]" "include\constants\opponents.h"
```

#### **For Elite Four Implementation**:
```powershell
# Same pattern as gym leaders, but with Elite Four locations:
# - IndigoPlateau_LoreleisRoom
# - IndigoPlateau_BrunosRoom
# - IndigoPlateau_AgathasRoom
# - IndigoPlateau_LancesRoom
# - IndigoPlateau_ChampionsRoom
```

#### **For Story Events Implementation**:
```powershell
# Same pattern, but with story event locations:
# - SaffronCity_SilphCo
# - LavenderTown_PokemonTower
# - SSAnne
# - CinnabarIsland_PokemonMansion
# - [TeamRocketLocations]
```

## 📁 FILE LOCATIONS

### **Source Files (FireRed Master)**:
- Scripts: `pokefirered-master/data/maps/[Location]/scripts.inc`
- Text: `pokefirered-master/data/maps/[Location]/text.inc`

### **Destination Files (Our Project)**:
- Scripts: `data/maps/[Location]/scripts.inc`
- Text: `data/maps/[Location]/text.inc`
- Main include: `data/event_scripts.s`

### **Backup Files**:
- Main backup: `data/event_scripts.s.backup`

## 🎯 SUCCESS CRITERIA

### **Phase 2 Success**:
- All 8 gym leaders have functional battle scripts
- All gym leaders give proper badges and TMs
- All gym leaders have proper dialogue
- All trainer constants are correctly referenced

### **Overall Project Success**:
- Complete Kanto region functionality
- All original FireRed features working
- No missing scripts or events
- Full story progression possible

## 📝 NOTES FOR TOMORROW

### **Resume Point**:
- **Current Phase**: Phase 2 (Gym Leader Scripts)
- **Current Task**: Implement Lt. Surge (Vermilion City Gym)
- **Progress**: 2/8 gym leaders completed

### **Key Information**:
- All NPCs and graphics are already ported
- All trainer data and party information exists
- Only scripts and events need to be implemented
- Use the same pattern as Brock and Misty for remaining gym leaders

### **Priority Order**:
1. Complete Phase 2 (6 remaining gym leaders)
2. Move to Phase 3 (Elite Four & Champion)
3. Move to Phase 4 (Story Events)
4. Move to Phase 5 (Special Locations)
5. Move to Phase 6 (Integration & Testing)

### **Detailed Task Breakdown for Tomorrow**:

#### **Immediate Next Task: Lt. Surge (Vermilion City Gym)**
**Location**: `VermilionCity_Gym`
**Steps**:
1. **Check source files exist**:
   ```powershell
   Test-Path "pokefirered-master\data\maps\VermilionCity_Gym\scripts.inc"
   Test-Path "pokefirered-master\data\maps\VermilionCity_Gym\text.inc"
   ```

2. **Check destination directory**:
   ```powershell
   Test-Path "data\maps\VermilionCity_Gym"
   ```

3. **Copy files**:
   ```powershell
   Copy-Item "pokefirered-master\data\maps\VermilionCity_Gym\scripts.inc" "data\maps\VermilionCity_Gym\scripts.inc"
   Copy-Item "pokefirered-master\data\maps\VermilionCity_Gym\text.inc" "data\maps\VermilionCity_Gym\text.inc"
   ```

4. **Add includes to event_scripts.s**:
   ```powershell
   Add-Content "data\event_scripts.s" "	.include `"data/maps/VermilionCity_Gym/scripts.inc`""
   Add-Content "data\event_scripts.s" "	.include `"data/maps/VermilionCity_Gym/text.inc`""
   ```

5. **Fix trainer constant**:
   ```powershell
   (Get-Content "data\maps\VermilionCity_Gym\scripts.inc") -replace "TRAINER_LEADER_SURGE", "TRAINER_SURGE" | Set-Content "data\maps\VermilionCity_Gym\scripts.inc"
   ```

6. **Verify implementation**:
   ```powershell
   Test-Path "data\maps\VermilionCity_Gym\scripts.inc"
   Test-Path "data\maps\VermilionCity_Gym\text.inc"
   Select-String "VermilionCity_Gym/scripts.inc" "data\event_scripts.s"
   Select-String "TRAINER_SURGE" "include\constants\opponents.h"
   ```

#### **Following Tasks (in order)**:
1. **Erika (Celadon City Gym)** - Location: `CeladonCity_Gym`
2. **Koga (Fuchsia City Gym)** - Location: `FuchsiaCity_Gym`
3. **Sabrina (Saffron City Gym)** - Location: `SaffronCity_Gym`
4. **Blaine (Cinnabar Island Gym)** - Location: `CinnabarIsland_Gym`
5. **Giovanni (Viridian City Gym)** - Location: `ViridianCity_Gym`

**Use the same pattern for each, replacing:**
- `VermilionCity_Gym` with the appropriate location
- `TRAINER_LEADER_SURGE` with the appropriate trainer constant
- `TRAINER_SURGE` with the appropriate trainer constant

---

**Last Updated**: [Current Date]
**Current Status**: Phase 2 in progress (2/8 gym leaders completed)
**Next Action**: Implement Lt. Surge (Vermilion City Gym)
