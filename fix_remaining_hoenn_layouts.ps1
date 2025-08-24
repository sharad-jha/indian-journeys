# Fix Remaining Hoenn Layouts
# This script fixes the remaining 4 Hoenn layouts to use gTileset_General_Hoenn

Write-Host "=== FIXING REMAINING HOENN LAYOUTS ===" -ForegroundColor Green
Write-Host "Target: Update 4 Hoenn layouts from gTileset_General to gTileset_General_Hoenn" -ForegroundColor Yellow

# Step 1: Create backup
Write-Host "Step 1: Creating backup..." -ForegroundColor Cyan
Copy-Item "data\layouts\layouts.json" "data\layouts\layouts_backup_remaining_hoenn.json"
Write-Host "Backup created: layouts_backup_remaining_hoenn.json" -ForegroundColor Green

# Step 2: Define Hoenn layouts to fix
Write-Host "Step 2: Defining Hoenn layouts to fix..." -ForegroundColor Cyan
$hoennLayouts = @(
    "LAYOUT_UNDERWATER_SOOTOPOLIS_CITY",
    "LAYOUT_PETALBURG_WOODS",
    "LAYOUT_NEW_MAUVILLE_ENTRANCE",
    "LAYOUT_NEW_MAUVILLE_INSIDE"
)

# Step 3: Read the file
Write-Host "Step 3: Reading layouts.json..." -ForegroundColor Cyan
$lines = Get-Content "data\layouts\layouts.json"

# Step 4: Fix Hoenn layouts
Write-Host "Step 4: Fixing Hoenn layouts..." -ForegroundColor Cyan
$changesMade = 0

for ($i = 0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i]
    
    # Check if this is a Hoenn layout ID
    foreach ($hoennLayout in $hoennLayouts) {
        if ($line -match "`"id`": `"$hoennLayout") {
            Write-Host "Found Hoenn layout: $hoennLayout at line $($i+1)" -ForegroundColor Yellow
            
            # Look for primary_tileset line (should be 4 lines after ID)
            $tilesetLineIndex = $i + 4
            if ($tilesetLineIndex -lt $lines.Count) {
                $tilesetLine = $lines[$tilesetLineIndex]
                
                if ($tilesetLine -match '"primary_tileset":') {
                    Write-Host "Current primary tileset: $tilesetLine" -ForegroundColor Gray
                    
                    # Replace gTileset_General with gTileset_General_Hoenn
                    if ($tilesetLine -match 'gTileset_General') {
                        $newTilesetLine = $tilesetLine -replace 'gTileset_General', 'gTileset_General_Hoenn'
                        $lines[$tilesetLineIndex] = $newTilesetLine
                        Write-Host "Updated to: $newTilesetLine" -ForegroundColor Green
                        $changesMade++
                    } else {
                        Write-Host "Already using Hoenn tileset or different tileset" -ForegroundColor Blue
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

Write-Host "=== REMAINING HOENN LAYOUTS FIX COMPLETE ===" -ForegroundColor Green
Write-Host "Updated $changesMade Hoenn layouts to use gTileset_General_Hoenn" -ForegroundColor Green
