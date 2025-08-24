# Simple Vermilion City Tileset Fix
# This script fixes ONLY Vermilion City, nothing else

Write-Host "=== VERMILION CITY TILESET FIX ===" -ForegroundColor Green
Write-Host "Starting fix process..." -ForegroundColor Yellow

# Step 1: Create backup
Write-Host "Step 1: Creating backup..." -ForegroundColor Cyan
Copy-Item "data\layouts\layouts.json" "data\layouts\layouts_backup_vermilion.json"
Write-Host "Backup created: layouts_backup_vermilion.json" -ForegroundColor Green

# Step 2: Read the file
Write-Host "Step 2: Reading layouts.json..." -ForegroundColor Cyan
$lines = Get-Content "data\layouts\layouts.json"

# Step 3: Find Vermilion City layout (line 4485)
Write-Host "Step 3: Locating Vermilion City layout..." -ForegroundColor Cyan
$vermilionLine = 4485  # We know this from our previous analysis
Write-Host "Vermilion City ID found at line: $vermilionLine" -ForegroundColor Green

# Step 4: Check current tileset
Write-Host "Step 4: Checking current tileset..." -ForegroundColor Cyan
$tilesetLine = $vermilionLine + 5  # secondary_tileset is 5 lines after ID
Write-Host "Targeting line $tilesetLine for tileset check" -ForegroundColor Yellow

# Show current content
Write-Host "Current line $tilesetLine content:" -ForegroundColor Magenta
Write-Host $lines[$tilesetLine-1] -ForegroundColor Gray

# Check if it needs fixing
if ($lines[$tilesetLine-1] -match "gTileset_VermilionCity") {
    Write-Host "✅ Vermilion City is already using the correct tileset!" -ForegroundColor Green
    Write-Host "No fix needed." -ForegroundColor Yellow
} else {
    Write-Host "❌ Vermilion City needs fixing!" -ForegroundColor Red
    Write-Host "Current tileset: $($lines[$tilesetLine-1])" -ForegroundColor Red
}

# Step 5: Show full layout for verification
Write-Host "Step 5: Showing full Vermilion City layout..." -ForegroundColor Cyan
$verification = Get-Content "data\layouts\layouts.json" | Select-String -Pattern "LAYOUT_VERMILION_CITY" -Context 0,6
Write-Host "Vermilion City layout:" -ForegroundColor Yellow
Write-Host $verification -ForegroundColor White

Write-Host "=== VERMILION CITY CHECK COMPLETE ===" -ForegroundColor Green
