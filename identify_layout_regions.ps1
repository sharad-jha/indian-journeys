# Identify Layout Regions - Simple Analysis
# This script identifies which layouts belong to Kanto vs Hoenn regions

Write-Host "=== IDENTIFYING LAYOUT REGIONS ===" -ForegroundColor Green
Write-Host "Analyzing layouts to determine Kanto vs Hoenn..." -ForegroundColor Yellow

# Step 1: Get all layouts using gTileset_General
Write-Host "`nStep 1: Finding layouts using gTileset_General..." -ForegroundColor Cyan
$lines = Get-Content "data\layouts\layouts.json"
$generalLayouts = @()

for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match '"primary_tileset": "gTileset_General"') {
        # Look back 4 lines for the ID
        if ($i -ge 4) {
            $idLine = $lines[$i-4]
            if ($idLine -match '"id": "([^"]+)"') {
                $layoutId = $matches[1]
                $generalLayouts += $layoutId
            }
        }
    }
}

Write-Host "Found $($generalLayouts.Count) layouts using gTileset_General" -ForegroundColor Green

# Step 2: Categorize them
Write-Host "`nStep 2: Categorizing layouts..." -ForegroundColor Cyan
$kantoLayouts = @()
$hoennLayouts = @()
$unknownLayouts = @()

foreach ($layout in $generalLayouts) {
    if ($layout -match "KANTO|PALLET|VIRIDIAN|PEWTER|CERULEAN|VERMILION|CELADON|SAFFRON|FUCHSIA|LAVENDER|ISLAND|SEVII") {
        $kantoLayouts += $layout
    }
    elseif ($layout -match "HOENN|LITTLEROOT|OLDALE|PETALBURG|RUSTBORO|DEWFORD|SLATEPORT|MAUVILLE|VERDANTURF|FALLARBOR|LAVARIDGE|FORTREE|LILYCOVE|MOSSDEEP|SOOTOPOLIS|EVER_GRANDE") {
        $hoennLayouts += $layout
    }
    else {
        $unknownLayouts += $layout
    }
}

# Step 3: Show results
Write-Host "`n=== RESULTS ===" -ForegroundColor Green
Write-Host "Kanto layouts: $($kantoLayouts.Count)" -ForegroundColor Yellow
Write-Host "Hoenn layouts: $($hoennLayouts.Count)" -ForegroundColor Yellow
Write-Host "Unknown layouts: $($unknownLayouts.Count)" -ForegroundColor Yellow

Write-Host "`nSample Kanto layouts:" -ForegroundColor Cyan
$kantoLayouts | Select-Object -First 10 | ForEach-Object { Write-Host "  - $_" -ForegroundColor White }

Write-Host "`nSample Hoenn layouts:" -ForegroundColor Cyan
$hoennLayouts | Select-Object -First 10 | ForEach-Object { Write-Host "  - $_" -ForegroundColor White }

Write-Host "`nSample Unknown layouts:" -ForegroundColor Cyan
$unknownLayouts | Select-Object -First 10 | ForEach-Object { Write-Host "  - $_" -ForegroundColor White }

Write-Host "`n=== ANALYSIS COMPLETE ===" -ForegroundColor Green
