# Verify Primary Tilesets for Kanto and Hoenn Regions
# This script verifies that each region is using its correct primary tileset

Write-Host "=== VERIFYING PRIMARY TILESETS ===" -ForegroundColor Green
Write-Host "Checking that Kanto uses gTileset_General_Kanto and Hoenn uses gTileset_General_Hoenn" -ForegroundColor Yellow

# Step 1: Check Kanto layouts
Write-Host "`n=== KANTO LAYOUTS ===" -ForegroundColor Cyan
$kantoLayouts = @(
    "LAYOUT_PALLET_TOWN",
    "LAYOUT_VIRIDIAN_CITY", 
    "LAYOUT_PEWTER_CITY",
    "LAYOUT_CERULEAN_CITY",
    "LAYOUT_VERMILION_CITY",
    "LAYOUT_CELADON_CITY",
    "LAYOUT_SAFFRON_CITY",
    "LAYOUT_FUCHSIA_CITY",
    "LAYOUT_LAVENDER_TOWN",
    "LAYOUT_ONE_ISLAND",
    "LAYOUT_TWO_ISLAND", 
    "LAYOUT_THREE_ISLAND",
    "LAYOUT_FOUR_ISLAND",
    "LAYOUT_FIVE_ISLAND",
    "LAYOUT_SIX_ISLAND",
    "LAYOUT_SEVEN_ISLAND"
)

$kantoIssues = @()
foreach ($layout in $kantoLayouts) {
    $result = Get-Content "data\layouts\layouts.json" | Select-String -Pattern "`"id`": `"$layout`"" -Context 0,6
    if ($result) {
        $tilesetLine = $result | Select-String -Pattern '"primary_tileset":'
        if ($tilesetLine -match 'gTileset_General_Kanto') {
            Write-Host "✅ $layout - Correct (gTileset_General_Kanto)" -ForegroundColor Green
        } else {
            Write-Host "❌ $layout - INCORRECT: $tilesetLine" -ForegroundColor Red
            $kantoIssues += $layout
        }
    } else {
        Write-Host "⚠️  $layout - Not found" -ForegroundColor Yellow
    }
}

# Step 2: Check Hoenn layouts
Write-Host "`n=== HOENN LAYOUTS ===" -ForegroundColor Cyan
$hoennLayouts = @(
    "LAYOUT_LITTLEROOT_TOWN",
    "LAYOUT_OLDALE_TOWN",
    "LAYOUT_PETALBURG_CITY",
    "LAYOUT_RUSTBORO_CITY",
    "LAYOUT_DEWFORD_TOWN",
    "LAYOUT_SLATEPORT_CITY",
    "LAYOUT_MAUVILLE_CITY",
    "LAYOUT_VERDANTURF_TOWN",
    "LAYOUT_FALLARBOR_TOWN",
    "LAYOUT_LAVARIDGE_TOWN",
    "LAYOUT_FORTREE_CITY",
    "LAYOUT_LILYCOVE_CITY",
    "LAYOUT_MOSSDEEP_CITY",
    "LAYOUT_SOOTOPOLIS_CITY",
    "LAYOUT_EVER_GRANDE_CITY"
)

$hoennIssues = @()
foreach ($layout in $hoennLayouts) {
    $result = Get-Content "data\layouts\layouts.json" | Select-String -Pattern "`"id`": `"$layout`"" -Context 0,6
    if ($result) {
        $tilesetLine = $result | Select-String -Pattern '"primary_tileset":'
        if ($tilesetLine -match 'gTileset_General_Hoenn') {
            Write-Host "✅ $layout - Correct (gTileset_General_Hoenn)" -ForegroundColor Green
        } else {
            Write-Host "❌ $layout - INCORRECT: $tilesetLine" -ForegroundColor Red
            $hoennIssues += $layout
        }
    } else {
        Write-Host "⚠️  $layout - Not found" -ForegroundColor Yellow
    }
}

# Step 3: Summary
Write-Host "`n=== SUMMARY ===" -ForegroundColor Green
if ($kantoIssues.Count -eq 0) {
    Write-Host "✅ All Kanto layouts are using gTileset_General_Kanto" -ForegroundColor Green
} else {
    Write-Host "❌ Kanto issues found: $($kantoIssues.Count)" -ForegroundColor Red
    foreach ($issue in $kantoIssues) {
        Write-Host "  - $issue" -ForegroundColor Red
    }
}

if ($hoennIssues.Count -eq 0) {
    Write-Host "✅ All Hoenn layouts are using gTileset_General_Hoenn" -ForegroundColor Green
} else {
    Write-Host "❌ Hoenn issues found: $($hoennIssues.Count)" -ForegroundColor Red
    foreach ($issue in $hoennIssues) {
        Write-Host "  - $issue" -ForegroundColor Red
    }
}

if (($kantoIssues.Count -eq 0) -and ($hoennIssues.Count -eq 0)) {
    Write-Host "`n🎉 ALL PRIMARY TILESETS ARE CORRECTLY ASSIGNED!" -ForegroundColor Green
    Write-Host "Kanto regions use gTileset_General_Kanto" -ForegroundColor Green
    Write-Host "Hoenn regions use gTileset_General_Hoenn" -ForegroundColor Green
} else {
    Write-Host "`n⚠️  Some issues need to be fixed" -ForegroundColor Yellow
}
