# Hoenn Music Mapping for Kanto Region - Complete Implementation Plan

## Overview
This plan maps Kanto region locations to existing Hoenn music files to ensure complete audio coverage without ROM size increase.

## Phase Structure

### **PHASE 1: Kanto Cities → Hoenn Cities**
**File:** `phase1_kanto_cities_music.bat`
**Status:** ✅ Ready to execute

**Mapping:**
- Pallet Town → MUS_LITTLEROOT (small starter town)
- Viridian City → MUS_OLDALE (first major city)
- Pewter City → MUS_RUSTBORO (traditional city with gym)
- Cerulean City → MUS_DEWFORD (coastal city)
- Vermilion City → MUS_SLATEPORT (port city)
- Celadon City → MUS_LILYCOVE (large commercial city)
- Saffron City → MUS_MAUVILLE (central hub city)
- Fuchsia City → MUS_FORTREE (unique themed city)
- Cinnabar Island → MUS_MOSSDEEP (island city)
- Lavender Town → MUS_FALLARBOR (quiet, peaceful town)

---

### **PHASE 2: Kanto Routes → Hoenn Routes**
**Files:** 
- `phase2_kanto_routes_music_batch1.bat` (Routes 1-10)
- `phase2_kanto_routes_music_batch2.bat` (Routes 11-20)
- `phase2_kanto_routes_music_batch3.bat` (Routes 21-25)
**Status:** ✅ Ready to execute

**Mapping:**
- Route 1 → MUS_ROUTE101 (simple grass route)
- Route 2 → MUS_ROUTE104 (forest route)
- Route 3 → MUS_ROUTE110 (mountain route)
- Route 4 → MUS_ROUTE119 (complex route)
- Route 5 → MUS_ROUTE120 (open route)
- Route 6 → MUS_ROUTE110 (urban route)
- Route 7 → MUS_ROUTE104 (simple route)
- Route 8 → MUS_ROUTE119 (complex route)
- Route 9 → MUS_ROUTE120 (mountain route)
- Route 10 → MUS_ROUTE110 (mountain route)
- Route 11 → MUS_ROUTE104 (simple route)
- Route 12 → MUS_ROUTE119 (complex route)
- Route 13 → MUS_ROUTE120 (open route)
- Route 14 → MUS_ROUTE119 (complex route)
- Route 15 → MUS_ROUTE104 (simple route)
- Route 16 → MUS_ROUTE110 (urban route)
- Route 17 → MUS_ROUTE119 (complex route)
- Route 18 → MUS_ROUTE120 (open route)
- Route 19 → MUS_ROUTE120 (water route)
- Route 20 → MUS_ROUTE120 (water route)
- Route 21 → MUS_ROUTE120 (water route)
- Route 22 → MUS_ROUTE110 (mountain route)
- Route 23 → MUS_VICTORY_ROAD (elite four approach)
- Route 24 → MUS_ROUTE119 (complex route)
- Route 25 → MUS_ROUTE120 (open route)

---

### **PHASE 3: Kanto Buildings → Hoenn Buildings**
**Files:**
- `phase3_kanto_buildings_music_batch1.bat` (Pokemon Centers)
- `phase3_kanto_buildings_music_batch2.bat` (Pokemon Marts)
- `phase3_kanto_buildings_music_batch3.bat` (Gyms)
- `phase3_kanto_buildings_music_batch4.bat` (Special Buildings)
**Status:** 🔄 In Progress (Batch 1 ready)

**Mapping:**
- Pokemon Centers → MUS_POKE_CENTER (same function)
- Pokemon Marts → MUS_POKE_MART (same function)
- Gyms → MUS_GYM (same function)
- Player's House → MUS_LITTLEROOT (home theme)
- Professor Oak's Lab → MUS_BIRCH_LAB (same function)
- Silph Co. → MUS_LILYCOVE (corporate building)
- Pokemon Tower → MUS_MT_PYRE (spiritual building)
- Game Corner → MUS_GAME_CORNER (same function)
- Department Store → MUS_LILYCOVE (shopping theme)

---

### **PHASE 4: Kanto Caves/Dungeons → Hoenn Caves/Dungeons**
**Files:**
- `phase4_kanto_caves_music_batch1.bat` (Major Caves)
- `phase4_kanto_caves_music_batch2.bat` (Special Locations)
**Status:** ⏳ Not Created

**Mapping:**
- Mt. Moon → MUS_GRANITE_CAVE (cave theme)
- Rock Tunnel → MUS_RUSTURF_TUNNEL (tunnel theme)
- Diglett's Cave → MUS_GRANITE_CAVE (cave theme)
- Seafoam Islands → MUS_CAVE_OF_ORIGIN (water cave)
- Victory Road → MUS_VICTORY_ROAD (same function)
- Cerulean Cave → MUS_CAVE_OF_ORIGIN (legendary cave)

---

### **PHASE 5: Kanto Special Locations → Hoenn Special Locations**
**Files:**
- `phase5_kanto_special_locations_music.bat`
**Status:** ⏳ Not Created

**Mapping:**
- Safari Zone → MUS_SAFARI_ZONE (same function)
- Power Plant → MUS_NEW_MAUVILLE (industrial theme)
- Pokemon Mansion → MUS_ABANDONED_SHIP (mysterious building)
- Indigo Plateau → MUS_EVER_GRANDE (elite four location)

---

### **PHASE 6: Sevii Islands → Hoenn Islands**
**Files:**
- `phase6_sevii_islands_music.bat`
**Status:** ⏳ Not Created

**Mapping:**
- One Island → MUS_DEWFORD (island theme)
- Two Island → MUS_DEWFORD (island theme)
- Three Island → MUS_DEWFORD (island theme)
- Four Island → MUS_DEWFORD (island theme)
- Five Island → MUS_DEWFORD (island theme)
- Six Island → MUS_DEWFORD (island theme)
- Seven Island → MUS_DEWFORD (island theme)

---

## Execution Order

1. **Execute Phase 1:** `phase1_kanto_cities_music.bat`
2. **Execute Phase 2A:** `phase2_kanto_routes_music_batch1.bat`
3. **Execute Phase 2B:** `phase2_kanto_routes_music_batch2.bat`
4. **Execute Phase 2C:** `phase2_kanto_routes_music_batch3.bat`
5. **Execute Phase 3A:** `phase3_kanto_buildings_music_batch1.bat`
6. **Continue with remaining phases...**

## Benefits

- **Zero Audio Duplication:** Uses existing Hoenn music files
- **ROM Size Optimization:** No additional audio files needed
- **Consistent Experience:** Maintains audio quality across regions
- **Easy Maintenance:** Single audio system for both regions
- **Thematic Mapping:** Each Kanto location gets appropriate music

## Backup System

All batch files create backups in `backup_kanto_music\` directory before making changes.

## Verification

After each phase, verify the changes by checking the updated map.json files and testing in-game audio.
