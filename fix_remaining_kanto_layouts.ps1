# Fix Remaining Kanto Layouts
# This script fixes the remaining 25 Kanto layouts to use gTileset_General_Kanto

Write-Host "=== FIXING REMAINING KANTO LAYOUTS ===" -ForegroundColor Green
Write-Host "Target: Update 25 Kanto layouts from gTileset_General to gTileset_General_Kanto" -ForegroundColor Yellow

# Step 1: Create backup
Write-Host "Step 1: Creating backup..." -ForegroundColor Cyan
Copy-Item "data\layouts\layouts.json" "data\layouts\layouts_backup_remaining_kanto.json"
Write-Host "Backup created: layouts_backup_remaining_kanto.json" -ForegroundColor Green

# Step 2: Define Kanto layouts to fix
Write-Host "Step 2: Defining Kanto layouts to fix..." -ForegroundColor Cyan
$kantoLayouts = @(
    "LAYOUT_ROUTE130_MIRAGE_ISLAND",
    "LAYOUT_ISLAND_CAVE",
    "LAYOUT_SOUTHERN_ISLAND_EXTERIOR",
    "LAYOUT_SOUTHERN_ISLAND_INTERIOR",
    "LAYOUT_FARAWAY_ISLAND_ENTRANCE",
    "LAYOUT_FARAWAY_ISLAND_INTERIOR",
    "LAYOUT_BIRTH_ISLAND_EXTERIOR",
    "LAYOUT_ISLAND_HARBOR",
    "LAYOUT_PEWTER_GYM",
    "LAYOUT_CINNABAR_ISLAND",
    "LAYOUT_NAVEL_ROCK_EXTERIOR",
    "LAYOUT_NAVEL_ROCK_INSIDE",
    "LAYOUT_NAVEL_ROCK_SUMMIT",
    "LAYOUT_NAVEL_ROCK_BASE",
    "LAYOUT_NAVEL_ROCK_SUMMIT_PATH_2F",
    "LAYOUT_NAVEL_ROCK_SUMMIT_PATH_3F",
    "LAYOUT_NAVEL_ROCK_SUMMIT_PATH_4F",
    "LAYOUT_NAVEL_ROCK_SUMMIT_PATH_5F",
    "LAYOUT_NAVEL_ROCK_BASE_PATH_B1F",
    "LAYOUT_NAVEL_ROCK_BASE_PATH_B2F",
    "LAYOUT_NAVEL_ROCK_BASE_PATH_B3F",
    "LAYOUT_NAVEL_ROCK_BASE_PATH_B4F",
    "LAYOUT_NAVEL_ROCK_BASE_PATH_B5F",
    "LAYOUT_NAVEL_ROCK_BASE_PATH_B6F",
    "LAYOUT_NAVEL_ROCK_BASE_PATH_B7F",
    "LAYOUT_NAVEL_ROCK_BASE_PATH_B8F",
    "LAYOUT_NAVEL_ROCK_BASE_PATH_B9F",
    "LAYOUT_NAVEL_ROCK_BASE_PATH_B10F",
    "LAYOUT_NAVEL_ROCK_BASE_PATH_B11F"
)

# Step 3: Read the file
Write-Host "Step 3: Reading layouts.json..." -ForegroundColor Cyan
$lines = Get-Content "data\layouts\layouts.json"

# Step 4: Fix Kanto layouts
Write-Host "Step 4: Fixing Kanto layouts..." -ForegroundColor Cyan
$changesMade = 0

for ($i = 0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i]
    
    # Check if this is a Kanto layout ID
    foreach ($kantoLayout in $kantoLayouts) {
        if ($line -match "`"id`": `"$kantoLayout") {
            Write-Host "Found Kanto layout: $kantoLayout at line $($i+1)" -ForegroundColor Yellow
            
            # Look for primary_tileset line (should be 4 lines after ID)
            $tilesetLineIndex = $i + 4
            if ($tilesetLineIndex -lt $lines.Count) {
                $tilesetLine = $lines[$tilesetLineIndex]
                
                if ($tilesetLine -match '"primary_tileset":') {
                    Write-Host "Current primary tileset: $tilesetLine" -ForegroundColor Gray
                    
                    # Replace gTileset_General with gTileset_General_Kanto
                    if ($tilesetLine -match 'gTileset_General') {
                        $newTilesetLine = $tilesetLine -replace 'gTileset_General', 'gTileset_General_Kanto'
                        $lines[$tilesetLineIndex] = $newTilesetLine
                        Write-Host "Updated to: $newTilesetLine" -ForegroundColor Green
                        $changesMade++
                    } else {
                        Write-Host "Already using Kanto tileset or different tileset" -ForegroundColor Blue
                    }
                }
            }
            break
        }
    }
}

Write-Host "Step 5: Total changes made: $changesMade" -ForegroundColor Cyan

# Step 6: Save the file
Write-Host "Step 6: Saving changes..." -ForegroundColor Cyan
$lines | Out-File -FilePath "data\layouts\layouts.json" -Encoding UTF8
Write-Host "File saved successfully!" -ForegroundColor Green

Write-Host "=== REMAINING KANTO LAYOUTS FIX COMPLETE ===" -ForegroundColor Green
Write-Host "Updated $changesMade Kanto layouts to use gTileset_General_Kanto" -ForegroundColor Green
