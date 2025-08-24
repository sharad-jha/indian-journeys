# Kanto Assets Comparison Script
# This script compares all Kanto tilesets and layouts with the original pokefirered-master assets

Write-Host "=== KANTO ASSETS COMPARISON ===" -ForegroundColor Green
Write-Host "Comparing current project with pokefirered-master..." -ForegroundColor Yellow

# Define Kanto cities to check
$kantoCities = @(
    "pallet_town",
    "viridian_city", 
    "pewter_city",
    "cerulean_city",
    "vermilion_city",
    "celadon_city",
    "saffron_city",
    "fuchsia_city",
    "lavender_town"
)

$issuesFound = @()

foreach ($city in $kantoCities) {
    Write-Host "`n--- Checking $city ---" -ForegroundColor Cyan
    
    # Check tileset files
    $tilesetFiles = @("tiles.png", "metatiles.bin", "metatile_attributes.bin")
    
    foreach ($file in $tilesetFiles) {
        $originalPath = "pokefirered-master\data\tilesets\secondary\$city\$file"
        $currentPath = "data\tilesets\secondary\$city\$file"
        
        if ((Test-Path $originalPath) -and (Test-Path $currentPath)) {
            $originalHash = (Get-FileHash $originalPath).Hash
            $currentHash = (Get-FileHash $currentPath).Hash
            
            if ($originalHash -eq $currentHash) {
                Write-Host "  ✅ $file - Identical" -ForegroundColor Green
            } else {
                Write-Host "  ❌ $file - DIFFERENT!" -ForegroundColor Red
                $issuesFound += "$city\$file"
            }
        } else {
            Write-Host "  ⚠️  $file - Missing file" -ForegroundColor Yellow
            $issuesFound += "$city\$file (MISSING)"
        }
    }
    
    # Check layout files
    $layoutName = $city -replace "_", ""
    $layoutName = $layoutName.Substring(0,1).ToUpper() + $layoutName.Substring(1)
    if ($layoutName -eq "PalletTown") { $layoutName = "PalletTown" }
    if ($layoutName -eq "ViridianCity") { $layoutName = "ViridianCity" }
    if ($layoutName -eq "PewterCity") { $layoutName = "PewterCity" }
    if ($layoutName -eq "CeruleanCity") { $layoutName = "CeruleanCity" }
    if ($layoutName -eq "VermilionCity") { $layoutName = "VermilionCity" }
    if ($layoutName -eq "CeladonCity") { $layoutName = "CeladonCity" }
    if ($layoutName -eq "SaffronCity") { $layoutName = "SaffronCity" }
    if ($layoutName -eq "FuchsiaCity") { $layoutName = "FuchsiaCity" }
    if ($layoutName -eq "LavenderTown") { $layoutName = "LavenderTown" }
    
    $layoutFiles = @("border.bin", "map.bin")
    
    foreach ($file in $layoutFiles) {
        $originalPath = "pokefirered-master\data\layouts\$layoutName\$file"
        $currentPath = "data\layouts\$layoutName\$file"
        
        if ((Test-Path $originalPath) -and (Test-Path $currentPath)) {
            $originalHash = (Get-FileHash $originalPath).Hash
            $currentHash = (Get-FileHash $currentPath).Hash
            
            if ($originalHash -eq $currentHash) {
                Write-Host "  ✅ $file - Identical" -ForegroundColor Green
            } else {
                Write-Host "  ❌ $file - DIFFERENT!" -ForegroundColor Red
                $issuesFound += "$layoutName\$file"
            }
        } else {
            Write-Host "  ⚠️  $file - Missing file" -ForegroundColor Yellow
            $issuesFound += "$layoutName\$file (MISSING)"
        }
    }
}

Write-Host "`n=== COMPARISON COMPLETE ===" -ForegroundColor Green

if ($issuesFound.Count -eq 0) {
    Write-Host "🎉 ALL KANTO ASSETS ARE PERFECT!" -ForegroundColor Green
    Write-Host "No issues found. All tilesets and layouts are identical to the original." -ForegroundColor Green
} else {
    Write-Host "❌ ISSUES FOUND:" -ForegroundColor Red
    foreach ($issue in $issuesFound) {
        Write-Host "  - $issue" -ForegroundColor Red
    }
    Write-Host "`nThese files need to be fixed to match the original assets." -ForegroundColor Yellow
}
