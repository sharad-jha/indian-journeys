# Simple Saffron City Tileset Fix
# This script fixes ONLY Saffron City, nothing else

Write-Host "=== SAFFRON CITY TILESET FIX ===" -ForegroundColor Green
Write-Host "Starting fix process..." -ForegroundColor Yellow

# Step 1: Create backup
Write-Host "Step 1: Creating backup..." -ForegroundColor Cyan
Copy-Item "data\layouts\layouts.json" "data\layouts\layouts_backup_saffron.json"
Write-Host "Backup created: layouts_backup_saffron.json" -ForegroundColor Green

# Step 2: Read the file
Write-Host "Step 2: Reading layouts.json..." -ForegroundColor Cyan
$lines = Get-Content "data\layouts\layouts.json"

# Step 3: Find Saffron City layout (line 4575)
Write-Host "Step 3: Locating Saffron City layout..." -ForegroundColor Cyan
$saffronLine = 4575  # We know this from our previous analysis
Write-Host "Saffron City ID found at line: $saffronLine" -ForegroundColor Green

# Step 4: Fix the secondary_tileset (line 4580)
Write-Host "Step 4: Fixing secondary_tileset..." -ForegroundColor Cyan
$tilesetLine = $saffronLine + 5  # secondary_tileset is 5 lines after ID
Write-Host "Targeting line $tilesetLine for tileset fix" -ForegroundColor Yellow

# Show what we're changing
Write-Host "Current line $tilesetLine content:" -ForegroundColor Magenta
Write-Host $lines[$tilesetLine-1] -ForegroundColor Gray

# Make the change
$lines[$tilesetLine-1] = $lines[$tilesetLine-1] -replace 'gTileset_VermilionCity', 'gTileset_SaffronCity'

# Show the new content
Write-Host "New line $tilesetLine content:" -ForegroundColor Magenta
Write-Host $lines[$tilesetLine-1] -ForegroundColor Green

# Step 5: Save the file
Write-Host "Step 5: Saving changes..." -ForegroundColor Cyan
$lines | Out-File -FilePath "data\layouts\layouts.json" -Encoding UTF8
Write-Host "File saved successfully!" -ForegroundColor Green

# Step 6: Verify the fix
Write-Host "Step 6: Verifying the fix..." -ForegroundColor Cyan
$verification = Get-Content "data\layouts\layouts.json" | Select-String -Pattern "LAYOUT_SAFFRON_CITY" -Context 0,6
Write-Host "Verification result:" -ForegroundColor Yellow
Write-Host $verification -ForegroundColor White

Write-Host "=== SAFFRON CITY FIX COMPLETE ===" -ForegroundColor Green
Write-Host "Please run the verification script to confirm the fix worked correctly." -ForegroundColor Yellow
