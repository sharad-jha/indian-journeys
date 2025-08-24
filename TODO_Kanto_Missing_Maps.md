# TODO: Missing Kanto Region Maps

## Overview
This document tracks enterable buildings, dungeons, houses, caves, entrances, and tunnels in the Kanto region that are missing map files and need to be added to the project.

## Missing Locations

### 🏥 Pokemon Centers (CRITICAL - Missing All)
- **Status**: ❌ ALL MISSING
- **Locations**: All Pokemon Centers across Kanto region
- **Source**: Available in `pokefirered-master/data/maps/`
- **Priority**: HIGH - These are essential for gameplay

### 🛒 Pokemon Marts (CRITICAL - Missing All)
- **Status**: ❌ ALL MISSING  
- **Locations**: All Pokemon Marts across Kanto region
- **Source**: Available in `pokefirered-master/data/maps/`
- **Priority**: HIGH - These are essential for gameplay

### 🏢 Special Buildings (Missing Several)
- **Status**: ❌ MISSING
- **Locations**:
  - PalletTown_OaksLab (Professor Oak's Lab)
  - CeladonCity_GameCorner (Game Corner)
  - CeladonCity_DepartmentStore_2F, 3F, 4F, 5F, Roof (Department Store floors)
  - SaffronCity_SilphCo_1F, 2F, 3F, 4F, 5F, 6F, 7F, 8F, 9F, 10F, 11F (Silph Co. floors)
  - FuchsiaCity_SafariZone_Office (Safari Zone Office)
  - CinnabarIsland_PokemonLab_Entrance, CinnabarIsland_PokemonLab_Lounge, CinnabarIsland_PokemonLab_ResearchRoom, CinnabarIsland_PokemonLab_ExperimentRoom (Pokemon Lab)
  - IndigoPlateau_PokemonCenter_1F, IndigoPlateau_PokemonCenter_2F (Elite Four Pokemon Center)
  - IndigoPlateau_LancesRoom (Elite Four Lance's Room)
  - IndigoPlateau_HallOfFame (Hall of Fame)
- **Source**: Available in `pokefirered-master/data/maps/`
- **Priority**: MEDIUM - Important for story progression

### 🏠 Houses (Missing Several)
- **Status**: ❌ MISSING
- **Locations**:
  - PalletTown_PlayersHouse_1F, PalletTown_PlayersHouse_2F (Player's House)
  - PalletTown_RivalsHouse (Rival's House)
  - CeruleanCity_House3, CeruleanCity_House4, CeruleanCity_House5
  - VermilionCity_House4, VermilionCity_House5, VermilionCity_House6
  - CeladonCity_House2, CeladonCity_House3, CeladonCity_House4, CeladonCity_House5
  - SaffronCity_House1, SaffronCity_House2, SaffronCity_House3, SaffronCity_House4, SaffronCity_House5
  - FuchsiaCity_House2, FuchsiaCity_House3, FuchsiaCity_House4, FuchsiaCity_House5
  - CinnabarIsland_House1, CinnabarIsland_House2
  - OneIsland_House1, OneIsland_House2, OneIsland_House3, OneIsland_House4
  - TwoIsland_House1, TwoIsland_House2, TwoIsland_House3, TwoIsland_House4
  - ThreeIsland_House1, ThreeIsland_House2, ThreeIsland_House3, ThreeIsland_House4
  - FourIsland_House1, FourIsland_House2, FourIsland_House3, FourIsland_House4
  - FiveIsland_House1, FiveIsland_House2, FiveIsland_House3, FiveIsland_House4
  - SixIsland_House1, SixIsland_House2, SixIsland_House3, SixIsland_House4
  - SevenIsland_House1, SevenIsland_House2, SevenIsland_House3, SevenIsland_House4
- **Source**: Available in `pokefirered-master/data/maps/`
- **Priority**: LOW - Cosmetic/exploration content

### 🏔️ Caves and Dungeons (Missing Several)
- **Status**: ❌ MISSING
- **Locations**:
  - MtMoon_1F, MtMoon_B1F, MtMoon_B2F (Mt. Moon)
  - RockTunnel_1F, RockTunnel_B1F (Rock Tunnel)
  - DiglettsCave_NorthEntrance, DiglettsCave_SouthEntrance (Diglett's Cave)
  - SeafoamIslands_1F, SeafoamIslands_B1F, SeafoamIslands_B2F, SeafoamIslands_B3F, SeafoamIslands_B4F (Seafoam Islands)
  - VictoryRoad_1F, VictoryRoad_2F, VictoryRoad_3F (Victory Road)
  - CeruleanCave_1F, CeruleanCave_2F, CeruleanCave_B1F (Cerulean Cave)
- **Source**: Available in `pokefirered-master/data/maps/`
- **Priority**: HIGH - Essential for exploration and story

### 🏭 Special Locations (Missing Several)
- **Status**: ❌ MISSING
- **Locations**:
  - PowerPlant_Entrance, PowerPlant_1F, PowerPlant_2F, PowerPlant_3F, PowerPlant_4F, PowerPlant_5F, PowerPlant_6F, PowerPlant_7F, PowerPlant_8F, PowerPlant_9F, PowerPlant_10F, PowerPlant_11F, PowerPlant_12F, PowerPlant_13F, PowerPlant_14F, PowerPlant_15F, PowerPlant_16F, PowerPlant_17F, PowerPlant_18F, PowerPlant_19F, PowerPlant_20F, PowerPlant_21F, PowerPlant_22F, PowerPlant_23F, PowerPlant_24F, PowerPlant_25F (Power Plant)
  - PokemonMansion_1F, PokemonMansion_2F, PokemonMansion_3F, PokemonMansion_B1F (Pokemon Mansion)
  - PokemonTower_1F, PokemonTower_2F, PokemonTower_3F, PokemonTower_4F, PokemonTower_5F, PokemonTower_6F, PokemonTower_7F (Pokemon Tower)
  - UndergroundPath_NorthSouthTunnel, UndergroundPath_WestEastTunnel (Underground Path)
  - CyclingRoad_NorthEntrance, CyclingRoad_SouthEntrance (Cycling Road)
  - SafariZone_Center, SafariZone_East, SafariZone_North, SafariZone_West (Safari Zone)
- **Source**: Available in `pokefirered-master/data/maps/`
- **Priority**: MEDIUM - Important for exploration

### 🏝️ Sevii Islands (Missing All)
- **Status**: ❌ ALL MISSING
- **Locations**: All Sevii Islands locations (One Island through Seven Island)
- **Source**: Available in `pokefirered-master/data/maps/`
- **Priority**: LOW - Post-game content

## Action Plan

### Phase 1: Critical Infrastructure (HIGH PRIORITY)
1. **Copy Pokemon Centers** from `pokefirered-master/data/maps/` to `data/maps/`
2. **Copy Pokemon Marts** from `pokefirered-master/data/maps/` to `data/maps/`
3. **Copy Professor Oak's Lab** (PalletTown_OaksLab)

### Phase 2: Story Progression (MEDIUM PRIORITY)
1. **Copy Elite Four locations** (Indigo Plateau)
2. **Copy Silph Co. floors** (Saffron City)
3. **Copy Department Store floors** (Celadon City)
4. **Copy Game Corner** (Celadon City)
5. **Copy Safari Zone** (Fuchsia City)

### Phase 3: Exploration Content (MEDIUM PRIORITY)
1. **Copy all cave systems** (Mt. Moon, Rock Tunnel, etc.)
2. **Copy Power Plant** (Route 10)
3. **Copy Pokemon Mansion** (Cinnabar Island)
4. **Copy Pokemon Tower** (Lavender Town)

### Phase 4: Cosmetic Content (LOW PRIORITY)
1. **Copy additional houses** for each city
2. **Copy Sevii Islands** locations
3. **Copy Underground Path** entrances

## Notes
- All missing maps are available in the `pokefirered-master/data/maps/` directory
- Each location typically has a `map.json` file that needs to be copied
- Some locations may have multiple floors or sections
- Priority should be given to locations essential for gameplay progression

## Status
- **Created**: [Current Date]
- **Last Updated**: [Current Date]
- **Completion**: 0% (All phases pending)
