# Verification Script for Cerulean City Fix
# This script verifies that ONLY Cerulean City was fixed and nothing else was affected

Write-Host "=== CERULEAN CITY FIX VERIFICATION ===" -ForegroundColor Green
Write-Host "Starting verification process..." -ForegroundColor Yellow

# Step 1: Check Cerulean City tileset
Write-Host "Step 1: Checking Cerulean City tileset..." -ForegroundColor Cyan
$ceruleanCheck = Get-Content "data\layouts\layouts.json" | Select-String -Pattern "LAYOUT_CERULEAN_CITY" -Context 0,4
Write-Host "Cerulean City layout found:" -ForegroundColor Yellow
Write-Host $ceruleanCheck -ForegroundColor White

# Check if Cerulean City is using the correct tileset
if ($ceruleanCheck -match "gTileset_CeruleanCity") {
    Write-Host "✅ SUCCESS: Cerulean City is using gTileset_CeruleanCity" -ForegroundColor Green
} else {
    Write-Host "❌ FAILED: Cerulean City is NOT using gTileset_CeruleanCity" -ForegroundColor Red
}

# Check if Cerulean City is still using the wrong tileset
if ($ceruleanCheck -match "gTileset_VermilionCity") {
    Write-Host "❌ FAILED: Cerulean City is still using gTileset_VermilionCity" -ForegroundColor Red
} else {
    Write-Host "✅ SUCCESS: Cerulean City is no longer using gTileset_VermilionCity" -ForegroundColor Green
}

# Step 2: Check other cities are unaffected
Write-Host "Step 2: Checking other cities are unaffected..." -ForegroundColor Cyan

# Check Vermilion City
Write-Host "Checking Vermilion City..." -ForegroundColor Yellow
$vermilionCheck = Get-Content "data\layouts\layouts.json" | Select-String -Pattern "LAYOUT_VERMILION_CITY" -Context 0,4
Write-Host "Vermilion City layout:" -ForegroundColor Gray
Write-Host $vermilionCheck -ForegroundColor White

# Check Celadon City
Write-Host "Checking Celadon City..." -ForegroundColor Yellow
$celadonCheck = Get-Content "data\layouts\layouts.json" | Select-String -Pattern "LAYOUT_CELADON_CITY" -Context 0,4
Write-Host "Celadon City layout:" -ForegroundColor Gray
Write-Host $celadonCheck -ForegroundColor White

# Step 3: Check for any remaining gTileset_VermilionCity in Cerulean context
Write-Host "Step 3: Checking for any remaining wrong tilesets..." -ForegroundColor Cyan
$wrongTilesets = Get-Content "data\layouts\layouts.json" | Select-String -Pattern "gTileset_VermilionCity" -Context 1,1
Write-Host "All instances of gTileset_VermilionCity found:" -ForegroundColor Yellow
Write-Host $wrongTilesets -ForegroundColor White

Write-Host "=== VERIFICATION COMPLETE ===" -ForegroundColor Green
Write-Host "If Cerulean City shows gTileset_CeruleanCity and other cities are unchanged, the fix was successful!" -ForegroundColor Yellow
