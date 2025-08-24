# Fix All Remaining Layouts to Region-Specific Tilesets
# This script fixes all remaining layouts to use region-specific tilesets

Write-Host "=== FIXING ALL REMAINING LAYOUTS ===" -ForegroundColor Green
Write-Host "Target: Update all remaining layouts to use region-specific tilesets" -ForegroundColor Yellow

# Step 1: Create backup
Write-Host "Step 1: Creating backup..." -ForegroundColor Cyan
Copy-Item "data\layouts\layouts.json" "data\layouts\layouts_backup_all_remaining.json"
Write-Host "Backup created: layouts_backup_all_remaining.json" -ForegroundColor Green

# Step 2: Read the file
Write-Host "Step 2: Reading layouts.json..." -ForegroundColor Cyan
$lines = Get-Content "data\layouts\layouts.json"

# Step 3: Fix all remaining layouts
Write-Host "Step 3: Fixing all remaining layouts..." -ForegroundColor Cyan
$changesMade = 0
$kantoChanges = 0
$hoennChanges = 0

for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match '"primary_tileset": "gTileset_General"') {
        # Look back 4 lines for the ID
        if ($i -ge 4) {
            $idLine = $lines[$i-4]
            if ($idLine -match '"id": "([^"]+)"') {
                $layoutId = $matches[1]
                
                # Determine if it's Kanto or Hoenn
                if ($layoutId -match "KANTO|PALLET|VIRIDIAN|PEWTER|CERULEAN|VERMILION|CELADON|SAFFRON|FUCHSIA|LAVENDER|ISLAND|SEVII|CINNABAR|NAVEL|BIRTH|FARAWAY|SOUTHERN|MIRAGE") {
                    # Kanto layout
                    $newTileset = 'gTileset_General_Kanto'
                    $kantoChanges++
                    Write-Host "Kanto layout: $layoutId -> $newTileset" -ForegroundColor Yellow
                } else {
                    # Hoenn layout (everything else)
                    $newTileset = 'gTileset_General_Hoenn'
                    $hoennChanges++
                    Write-Host "Hoenn layout: $layoutId -> $newTileset" -ForegroundColor Cyan
                }
                
                # Update the tileset
                $lines[$i] = $lines[$i] -replace 'gTileset_General', $newTileset
                $changesMade++
            }
        }
    }
}

Write-Host "Step 4: Total changes made: $changesMade" -ForegroundColor Cyan
Write-Host "Kanto changes: $kantoChanges" -ForegroundColor Yellow
Write-Host "Hoenn changes: $hoennChanges" -ForegroundColor Cyan

# Step 5: Save the file
Write-Host "Step 5: Saving changes..." -ForegroundColor Cyan
$lines | Out-File -FilePath "data\layouts\layouts.json" -Encoding UTF8
Write-Host "File saved successfully!" -ForegroundColor Green

Write-Host "=== ALL REMAINING LAYOUTS FIX COMPLETE ===" -ForegroundColor Green
Write-Host "Updated $changesMade layouts to use region-specific tilesets" -ForegroundColor Green
