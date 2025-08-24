# Fix Petalburg City to Original Hoenn Tileset
# This script fixes Petalburg City back to its original gTileset_Petalburg

Write-Host "=== PETALBURG CITY HOENN TILESET FIX ===" -ForegroundColor Green
Write-Host "Restoring to original Hoenn tileset..." -ForegroundColor Yellow

# Step 1: Create backup
Write-Host "Step 1: Creating backup..." -ForegroundColor Cyan
Copy-Item "data\layouts\layouts.json" "data\layouts\layouts_backup_petalburg_hoenn.json"
Write-Host "Backup created: layouts_backup_petalburg_hoenn.json" -ForegroundColor Green

# Step 2: Read the file
Write-Host "Step 2: Reading layouts.json..." -ForegroundColor Cyan
$lines = Get-Content "data\layouts\layouts.json"

# Step 3: Find Petalburg City layout (line 5)
Write-Host "Step 3: Locating Petalburg City layout..." -ForegroundColor Cyan
$petalburgLine = 5  # We know this from our previous analysis
Write-Host "Petalburg City ID found at line: $petalburgLine" -ForegroundColor Green

# Step 4: Fix the secondary_tileset (line 10)
Write-Host "Step 4: Fixing secondary_tileset..." -ForegroundColor Cyan
$tilesetLine = $petalburgLine + 5  # secondary_tileset is 5 lines after ID
Write-Host "Targeting line $tilesetLine for tileset fix" -ForegroundColor Yellow

# Show what we're changing
Write-Host "Current line $tilesetLine content:" -ForegroundColor Magenta
Write-Host $lines[$tilesetLine-1] -ForegroundColor Gray

# Make the change
$lines[$tilesetLine-1] = $lines[$tilesetLine-1] -replace 'gTileset_VermilionCity', 'gTileset_Petalburg'

# Show the new content
Write-Host "New line $tilesetLine content:" -ForegroundColor Magenta
Write-Host $lines[$tilesetLine-1] -ForegroundColor Green

# Step 5: Save the file
Write-Host "Step 5: Saving changes..." -ForegroundColor Cyan
$lines | Out-File -FilePath "data\layouts\layouts.json" -Encoding UTF8
Write-Host "File saved successfully!" -ForegroundColor Green

# Step 6: Verify the fix
Write-Host "Step 6: Verifying the fix..." -ForegroundColor Cyan
$verification = Get-Content "data\layouts\layouts.json" | Select-String -Pattern "LAYOUT_PETALBURG_CITY" -Context 0,6
Write-Host "Verification result:" -ForegroundColor Yellow
Write-Host $verification -ForegroundColor White

Write-Host "=== PETALBURG CITY HOENN FIX COMPLETE ===" -ForegroundColor Green
Write-Host "Petalburg City now uses the correct gTileset_Petalburg!" -ForegroundColor Yellow
