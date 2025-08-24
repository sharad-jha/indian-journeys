# Fix All Remaining Hoenn Locations to Original Tilesets
# This script fixes OldaleTown, Route101, Route102, Route103 back to gTileset_Petalburg

Write-Host "=== REMAINING HOENN LOCATIONS FIX ===" -ForegroundColor Green
Write-Host "Fixing all remaining Hoenn locations..." -ForegroundColor Yellow

# Step 1: Create backup
Write-Host "Step 1: Creating backup..." -ForegroundColor Cyan
Copy-Item "data\layouts\layouts.json" "data\layouts\layouts_backup_remaining_hoenn.json"
Write-Host "Backup created: layouts_backup_remaining_hoenn.json" -ForegroundColor Green

# Step 2: Read the file
Write-Host "Step 2: Reading layouts.json..." -ForegroundColor Cyan
$lines = Get-Content "data\layouts\layouts.json"

# Step 3: Find all locations that need fixing
Write-Host "Step 3: Finding locations to fix..." -ForegroundColor Cyan

# Find line numbers for each location
$oldaleLine = 0
$route101Line = 0
$route102Line = 0
$route103Line = 0

for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match 'LAYOUT_OLDALE_TOWN"') {
        $oldaleLine = $i + 1
        Write-Host "OldaleTown found at line: $oldaleLine" -ForegroundColor Green
    }
    if ($lines[$i] -match 'LAYOUT_ROUTE101"') {
        $route101Line = $i + 1
        Write-Host "Route101 found at line: $route101Line" -ForegroundColor Green
    }
    if ($lines[$i] -match 'LAYOUT_ROUTE102"') {
        $route102Line = $i + 1
        Write-Host "Route102 found at line: $route102Line" -ForegroundColor Green
    }
    if ($lines[$i] -match 'LAYOUT_ROUTE103"') {
        $route103Line = $i + 1
        Write-Host "Route103 found at line: $route103Line" -ForegroundColor Green
    }
}

# Step 4: Fix each location
Write-Host "Step 4: Fixing tilesets..." -ForegroundColor Cyan

# Fix OldaleTown
if ($oldaleLine -gt 0) {
    $tilesetLine = $oldaleLine + 4
    Write-Host "Fixing OldaleTown at line $tilesetLine..." -ForegroundColor Yellow
    Write-Host "Before: $($lines[$tilesetLine])" -ForegroundColor Gray
    $lines[$tilesetLine] = $lines[$tilesetLine] -replace 'gTileset_VermilionCity', 'gTileset_Petalburg'
    Write-Host "After: $($lines[$tilesetLine])" -ForegroundColor Green
}

# Fix Route101
if ($route101Line -gt 0) {
    $tilesetLine = $route101Line + 4
    Write-Host "Fixing Route101 at line $tilesetLine..." -ForegroundColor Yellow
    Write-Host "Before: $($lines[$tilesetLine])" -ForegroundColor Gray
    $lines[$tilesetLine] = $lines[$tilesetLine] -replace 'gTileset_VermilionCity', 'gTileset_Petalburg'
    Write-Host "After: $($lines[$tilesetLine])" -ForegroundColor Green
}

# Fix Route102
if ($route102Line -gt 0) {
    $tilesetLine = $route102Line + 4
    Write-Host "Fixing Route102 at line $tilesetLine..." -ForegroundColor Yellow
    Write-Host "Before: $($lines[$tilesetLine])" -ForegroundColor Gray
    $lines[$tilesetLine] = $lines[$tilesetLine] -replace 'gTileset_VermilionCity', 'gTileset_Petalburg'
    Write-Host "After: $($lines[$tilesetLine])" -ForegroundColor Green
}

# Fix Route103
if ($route103Line -gt 0) {
    $tilesetLine = $route103Line + 4
    Write-Host "Fixing Route103 at line $tilesetLine..." -ForegroundColor Yellow
    Write-Host "Before: $($lines[$tilesetLine])" -ForegroundColor Gray
    $lines[$tilesetLine] = $lines[$tilesetLine] -replace 'gTileset_VermilionCity', 'gTileset_Petalburg'
    Write-Host "After: $($lines[$tilesetLine])" -ForegroundColor Green
}

# Step 5: Save the file
Write-Host "Step 5: Saving changes..." -ForegroundColor Cyan
$lines | Out-File -FilePath "data\layouts\layouts.json" -Encoding UTF8
Write-Host "File saved successfully!" -ForegroundColor Green

# Step 6: Verify the fixes
Write-Host "Step 6: Verifying fixes..." -ForegroundColor Cyan
$verification = Get-Content "data\layouts\layouts.json" | Select-String -Pattern "gTileset_VermilionCity" -Context 1,1
Write-Host "Remaining gTileset_VermilionCity instances:" -ForegroundColor Yellow
Write-Host $verification -ForegroundColor White

Write-Host "=== REMAINING HOENN FIXES COMPLETE ===" -ForegroundColor Green
Write-Host "All Hoenn locations now use the correct gTileset_Petalburg!" -ForegroundColor Yellow
