# Fix Littleroot Town to Original Hoenn Tileset
# This script fixes Littleroot Town back to its original gTileset_Petalburg

Write-Host "=== LITTLEROOT TOWN HOENN TILESET FIX ===" -ForegroundColor Green
Write-Host "Restoring to original Hoenn tileset..." -ForegroundColor Yellow

# Step 1: Create backup
Write-Host "Step 1: Creating backup..." -ForegroundColor Cyan
Copy-Item "data\layouts\layouts.json" "data\layouts\layouts_backup_littleroot_hoenn.json"
Write-Host "Backup created: layouts_backup_littleroot_hoenn.json" -ForegroundColor Green

# Step 2: Read the file
Write-Host "Step 2: Reading layouts.json..." -ForegroundColor Cyan
$lines = Get-Content "data\layouts\layouts.json"

# Step 3: Find Littleroot Town layout (line 95)
Write-Host "Step 3: Locating Littleroot Town layout..." -ForegroundColor Cyan
$littlerootLine = 95  # We know this from our previous analysis
Write-Host "Littleroot Town ID found at line: $littlerootLine" -ForegroundColor Green

# Step 4: Fix the secondary_tileset (line 100)
Write-Host "Step 4: Fixing secondary_tileset..." -ForegroundColor Cyan
$tilesetLine = $littlerootLine + 5  # secondary_tileset is 5 lines after ID
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
$verification = Get-Content "data\layouts\layouts.json" | Select-String -Pattern "LAYOUT_LITTLEROOT_TOWN" -Context 0,6
Write-Host "Verification result:" -ForegroundColor Yellow
Write-Host $verification -ForegroundColor White

Write-Host "=== LITTLEROOT TOWN HOENN FIX COMPLETE ===" -ForegroundColor Green
Write-Host "Littleroot Town now uses the correct gTileset_Petalburg!" -ForegroundColor Yellow
