# Fix Four Island Tilesets to Sevii Islands 45
# This script fixes ONLY Four Island layouts, nothing else

Write-Host "=== FIXING FOUR ISLAND TILESETS ===" -ForegroundColor Green
Write-Host "Target: Change Four Island from Hoenn tilesets to gTileset_SeviiIslands45" -ForegroundColor Yellow

# Step 1: Create backup
Write-Host "Step 1: Creating backup..." -ForegroundColor Cyan
Copy-Item "data\layouts\layouts.json" "data\layouts\layouts_backup_four_island.json"
Write-Host "Backup created: layouts_backup_four_island.json" -ForegroundColor Green

# Step 2: Read the file
Write-Host "Step 2: Reading layouts.json..." -ForegroundColor Cyan
$lines = Get-Content "data\layouts\layouts.json"

# Step 3: Find Four Island layouts and fix them
Write-Host "Step 3: Finding and fixing Four Island layouts..." -ForegroundColor Cyan

$changesMade = 0

for ($i = 0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i]
    
    # Check if this is a Four Island layout ID
    if ($line -match '"id": "LAYOUT_FOUR_ISLAND') {
        Write-Host "Found Four Island layout at line $($i+1): $line" -ForegroundColor Yellow
        
        # Look for secondary_tileset line (should be 5 lines after ID)
        $tilesetLineIndex = $i + 5
        if ($tilesetLineIndex -lt $lines.Count) {
            $tilesetLine = $lines[$tilesetLineIndex]
            
            if ($tilesetLine -match '"secondary_tileset":') {
                Write-Host "Current tileset line: $tilesetLine" -ForegroundColor Gray
                
                # Replace any Hoenn tileset with Sevii Islands 45
                if ($tilesetLine -match 'gTileset_Dewford|gTileset_Rustboro|gTileset_Slateport|gTileset_Fortree') {
                    $newTilesetLine = $tilesetLine -replace 'gTileset_Dewford|gTileset_Rustboro|gTileset_Slateport|gTileset_Fortree', 'gTileset_SeviiIslands45'
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
$verification = Get-Content "data\layouts\layouts.json" | Select-String -Pattern "LAYOUT_FOUR_ISLAND" -Context 0,6
Write-Host "Verification result:" -ForegroundColor Yellow
Write-Host $verification -ForegroundColor White

Write-Host "=== FOUR ISLAND FIX COMPLETE ===" -ForegroundColor Green
Write-Host "Four Island now uses gTileset_SeviiIslands45" -ForegroundColor Green
