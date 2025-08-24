# KANTO TILESET FIX PROJECT - CONTEXT DOCUMENT

## PROJECT OVERVIEW

**Date Created:** December 2024  
**Last Updated:** Current Session  
**Status:** In Progress - Step 1 (Cerulean City Fix)

### Primary Problem
The Kanto region in the project is incorrectly using Hoenn region tilesets and palettes instead of the correct Kanto assets, despite having all the proper Kanto tileset files copied from the FireRed source.

### Root Cause
The `data/layouts/layouts.json` file incorrectly assigns Hoenn tilesets (like `gTileset_Petalburg`) to Kanto locations instead of the correct Kanto tilesets (like `gTileset_CeruleanCity`).

## TECHNICAL CONTEXT

### File Structure
```
C:\Users\nj\Documents\GitHub\indian-journeys\
├── data/
│   ├── layouts/
│   │   └── layouts.json (MAIN TARGET FILE)
│   └── tilesets/
│       ├── primary/ (General tilesets)
│       └── secondary/ (City-specific tilesets)
│           ├── cerulean_city/ ✅ (Exists with correct assets)
│           ├── vermilion_city/ ✅ (Exists with correct assets)
│           ├── celadon_city/ ✅ (Exists with correct assets)
│           └── ... (other Kanto cities)
├── pokefirered-master/ (Source of Kanto assets)
└── tileset_fixes/ (Our working directory)
    ├── backups/
    ├── logs/
    └── [fix scripts and summaries]
```

### Key Concepts
- **Primary Tileset**: Common tileset (e.g., `gTileset_General`, `gTileset_Building`)
- **Secondary Tileset**: City-specific tileset (e.g., `gTileset_CeruleanCity`, `gTileset_VermilionCity`)
- **Layout**: Defines map structure and associated tilesets
- **Palettes**: Color data for tilesets

### Current State (After Restore)
```json
{
  "id": "LAYOUT_CERULEAN_CITY",
  "name": "CeruleanCity_Layout",
  "width": 32,
  "height": 32,
  "primary_tileset": "gTileset_General",
  "secondary_tileset": "gTileset_Petalburg", // ❌ Should be gTileset_CeruleanCity
  "border_filepath": "data/layouts/CeruleanCity/border.bin",
  "blockdata_filepath": "data/layouts/CeruleanCity/map.bin"
}
```

## APPROACH & METHODOLOGY

### Core Principles
1. **High Verbosity**: Every step is logged and explained in detail
2. **Small Tasks**: One city at a time, one script at a time
3. **Many Chunks**: Break everything into granular, manageable pieces
4. **Batch-Based Approach**: All changes via `.bat` scripts for consistency
5. **Targeted Fixes**: Only change specific cities, avoid global replacements
6. **Verification**: Each step must be verified before proceeding

### Script Execution Pattern
1. User executes `.bat` script
2. User provides output/summary
3. Assistant verifies changes
4. Assistant creates next script
5. Repeat until all cities are fixed

### Backup Strategy
- Create backup before each fix: `layouts_backup_before_[city]_targeted_fix.json`
- Keep all backups in `tileset_fixes/backups/`
- Never overwrite previous backups

## CRITICAL LEARNINGS

### PowerShell Issues in Batch Files
**Problem**: Complex PowerShell commands with quotes cause "Set-Content' is not recognized" errors.

**Solution**: 
- Use simple PowerShell commands without complex quoting
- Create separate `.ps1` files for complex operations
- Clean up temporary `.ps1` files after use

### Global Replacement Problem
**Problem**: Using `-replace 'gTileset_Petalburg', 'gTileset_CeruleanCity'` affects ALL cities, not just Cerulean City.

**Solution**: 
- Use line-number targeting approach
- Find specific layout by ID and name
- Calculate exact line number for secondary_tileset
- Modify only that specific line

### Verification Strategy
**Problem**: Need to ensure fixes work and don't affect other cities.

**Solution**:
- Check that target city now uses correct tileset
- Verify target city no longer uses incorrect tileset
- Confirm other cities are NOT affected
- Create detailed logs and summaries

## CURRENT STATUS

### Completed
- ✅ Project analysis and problem identification
- ✅ Asset verification (all Kanto tilesets exist)
- ✅ Restored `layouts.json` from original backup
- ✅ Created targeted fix approach for Cerulean City

### In Progress
- 🔄 **Step 1**: Cerulean City targeted fix
  - Script: `step1_fix_cerulean_city_targeted.bat`
  - Status: Ready to execute
  - Approach: Line-number targeting to avoid global replacement

### Pending
- **Step 2**: Vermilion City targeted fix
- **Step 3**: Celadon City targeted fix
- **Step 4**: Other Kanto cities (Pewter, Saffron, etc.)
- **Step 5**: Buildings and special locations
- **Step 6**: Final verification and cleanup

## SCRIPT TEMPLATE

### Fix Script Structure
```batch
@echo off
echo ========================================
echo STEP X: FIX [CITY] TILESET (TARGETED)
echo ========================================

:: 1. Create directories
:: 2. Backup current layouts.json
:: 3. Verify tileset exists
:: 4. Find exact line number
:: 5. Perform targeted fix
:: 6. Verify the fix
:: 7. Create summary
```

### Verification Script Structure
```batch
@echo off
echo ========================================
echo VERIFY [CITY] TILESET FIX
echo ========================================

:: 1. Check current assignment
:: 2. Verify correct tileset is used
:: 3. Verify incorrect tileset is not used
:: 4. Check other cities are not affected
:: 5. Generate verification report
```

## CITY MAPPING

### Kanto Cities to Fix
| City | Current Tileset | Correct Tileset | Status |
|------|----------------|-----------------|---------|
| Cerulean City | `gTileset_Petalburg` | `gTileset_CeruleanCity` | 🔄 In Progress |
| Vermilion City | `gTileset_Petalburg` | `gTileset_VermilionCity` | ⏳ Pending |
| Celadon City | `gTileset_Petalburg` | `gTileset_CeladonCity` | ⏳ Pending |
| Pewter City | `gTileset_Petalburg` | `gTileset_PewterCity` | ⏳ Pending |
| Saffron City | `gTileset_Petalburg` | `gTileset_SaffronCity` | ⏳ Pending |
| Fuchsia City | `gTileset_Petalburg` | `gTileset_FuchsiaCity` | ⏳ Pending |
| Cinnabar Island | `gTileset_Petalburg` | `gTileset_CinnabarIsland` | ⏳ Pending |

## COMMON COMMANDS

### PowerShell Commands That Work
```powershell
# Simple replacement (but global - use carefully)
powershell -Command "(Get-Content 'data\layouts\layouts.json') -replace 'gTileset_Petalburg', 'gTileset_CeruleanCity' | Set-Content 'data\layouts\layouts_temp.json'"

# Line-specific targeting (preferred)
echo $lines = Get-Content 'data\layouts\layouts.json' > fix.ps1
echo $lines[LINE_NUMBER-1] = $lines[LINE_NUMBER-1] -replace 'gTileset_Petalburg', 'gTileset_CeruleanCity' >> fix.ps1
echo $lines | Set-Content 'data\layouts\layouts_temp.json' >> fix.ps1
powershell -ExecutionPolicy Bypass -File fix.ps1
```

### Batch Commands
```batch
# Find line numbers
findstr /n "LAYOUT_CERULEAN_CITY" data\layouts\layouts.json

# Check if pattern exists
findstr "gTileset_CeruleanCity" data\layouts\layouts.json >nul
if %errorlevel% equ 0 (echo Found) else (echo Not found)

# Calculate line numbers
set /a TILESET_LINE=%CERULEAN_LINE%+4
```

## NEXT STEPS

### Immediate (Current Session)
1. Execute `step1_fix_cerulean_city_targeted.bat`
2. Verify Cerulean City fix
3. Create `step1_verify_cerulean_targeted_fix.bat`

### Tomorrow's Session
1. Start with Vermilion City fix
2. Continue with Celadon City
3. Work through remaining Kanto cities
4. Final verification and cleanup

## IMPORTANT REMINDERS

1. **ALWAYS** create backup before each fix
2. **NEVER** use global replacement without verification
3. **ALWAYS** verify other cities are not affected
4. **ALWAYS** use targeted line-number approach
5. **ALWAYS** create detailed logs and summaries
6. **ALWAYS** test one city at a time
7. **REMEMBER** the PowerShell quoting issues - keep commands simple

## FILES TO MONITOR

### Critical Files
- `data/layouts/layouts.json` (main target)
- `tileset_fixes/backups/` (all backups)
- `tileset_fixes/logs/` (all logs)

### Script Files
- `step1_fix_cerulean_city_targeted.bat` (current)
- `step1_verify_cerulean_targeted_fix.bat` (next)
- Future: `step2_fix_vermilion_city_targeted.bat`, etc.

## SUCCESS CRITERIA

- All Kanto cities use correct Kanto tilesets
- No Hoenn tilesets used for Kanto locations
- All fixes are targeted and don't affect other cities
- Complete backup and log trail
- Project can run independently of `pokefirered-master/`

---

**Note**: This document should be updated after each successful fix to maintain current context and learnings.


