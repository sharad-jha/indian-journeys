# Fix Seven Island Tilesets to Sevii Islands 67
# This script fixes ONLY Seven Island layouts, nothing else

Write-Host "=== FIXING SEVEN ISLAND TILESETS ===" -ForegroundColor Green
Write-Host "Target: Change Seven Island from Hoenn tilesets to gTileset_SeviiIslands67" -ForegroundColor Yellow

# Step 1: Create backup
Write-Host "Step 1: Creating backup..." -ForegroundColor Cyan
Copy-Item "data\layouts\layouts.json" "data\layouts\layouts_backup_seven_island.json"
Write-Host "Backup created: layouts_backup_seven_island.json" -ForegroundColor Green

# Step 2: Read the file
Write-Host "Step 2: Reading layouts.json..." -ForegroundColor Cyan
$lines = Get-Content "data\layouts\layouts.json"

# Step 3: Find Seven Island layouts and fix them
Write-Host "Step 3: Finding and fixing Seven Island layouts..." -ForegroundColor Cyan

$changesMade = 0

for ($i = 0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i]
    
    # Check if this is a Seven Island layout ID
    if ($line -match '"id": "LAYOUT_SEVEN_ISLAND') {
        Write-Host "Found Seven Island layout at line $($i+1): $line" -ForegroundColor Yellow
        
        # Look for secondary_tileset line (should be 5 lines after ID)
        $tilesetLineIndex = $i + 5
        if ($tilesetLineIndex -lt $lines.Count) {
            $tilesetLine = $lines[$tilesetLineIndex]
            
            if ($tilesetLine -match '"secondary_tileset":') {
                Write-Host "Current tileset line: $tilesetLine" -ForegroundColor Gray
                
                # Replace any Hoenn tileset with Sevii Islands 67
                if ($tilesetLine -match 'gTileset_Dewford|gTileset_Rustboro|gTileset_Slateport|gTileset_Fortree') {
                    $newTilesetLine = $tilesetLine -replace 'gTileset_Dewford|gTileset_Rustboro|gTileset_Slateport|gTileset_Fortree', 'gTileset_SeviiIslands67'
                    $lines[$tilesetLineIndex] = $newTilesetLine
                    Write-Host "Fixed to: $newTilesetLine" -ForegroundColor Green
                    $changesMade++
                } else {
                    Write-Host "Already correct or not a Hoenn tileset" -ForegroundColor Blue
                }
            }
        }
    }
}

Write-Host "Step 4: Total changes made: $changesMade" -ForegroundColor Cyan

# Step 5: Save the file
Write-Host "Step 5: Saving changes..." -ForegroundColor Cyan
$lines | Out-File -FilePath "data\layouts\layouts.json" -Encoding UTF8
Write-Host "File saved successfully!" -ForegroundColor Green

# Step 6: Verify the fix
Write-Host "Step 6: Verifying the fix..." -ForegroundColor Cyan
$verification = Get-Content "data\layouts\layouts.json" | Select-String -Pattern "LAYOUT_SEVEN_ISLAND" -Context 0,6
Write-Host "Verification result:" -ForegroundColor Yellow
Write-Host $verification -ForegroundColor White

Write-Host "=== SEVEN ISLAND FIX COMPLETE ===" -ForegroundColor Green
Write-Host "Seven Island now uses gTileset_SeviiIslands67" -ForegroundColor Green
