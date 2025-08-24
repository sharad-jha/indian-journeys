# Update Kanto Primary Tilesets to gTileset_General_Kanto
# This script updates ONLY Kanto layouts to use the Kanto-specific general tileset

Write-Host "=== UPDATING KANTO PRIMARY TILESETS ===" -ForegroundColor Green
Write-Host "Target: Change Kanto layouts from gTileset_General to gTileset_General_Kanto" -ForegroundColor Yellow

# Step 1: Create backup
Write-Host "Step 1: Creating backup..." -ForegroundColor Cyan
Copy-Item "data\layouts\layouts.json" "data\layouts\layouts_backup_kanto_primary.json"
Write-Host "Backup created: layouts_backup_kanto_primary.json" -ForegroundColor Green

# Step 2: Read the file
Write-Host "Step 2: Reading layouts.json..." -ForegroundColor Cyan
$lines = Get-Content "data\layouts\layouts.json"

# Step 3: Define Kanto layouts to update
Write-Host "Step 3: Finding and updating Kanto layouts..." -ForegroundColor Cyan

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

$changesMade = 0

for ($i = 0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i]
    
    # Check if this is a Kanto layout ID
    foreach ($kantoLayout in $kantoLayouts) {
        if ($line -match "`"id`": `"$kantoLayout") {
            Write-Host "Found Kanto layout: $kantoLayout at line $($i+1)" -ForegroundColor Yellow
            
            # Look for primary_tileset line (should be 4 lines after ID)
            $tilesetLineIndex = $i + 4
            if ($tilesetLineIndex -lt $lines.Count) {
                $tilesetLine = $lines[$tilesetLineIndex]
                
                if ($tilesetLine -match '"primary_tileset":') {
                    Write-Host "Current primary tileset: $tilesetLine" -ForegroundColor Gray
                    
                    # Replace gTileset_General with gTileset_General_Kanto
                    if ($tilesetLine -match 'gTileset_General') {
                        $newTilesetLine = $tilesetLine -replace 'gTileset_General', 'gTileset_General_Kanto'
                        $lines[$tilesetLineIndex] = $newTilesetLine
                        Write-Host "Updated to: $newTilesetLine" -ForegroundColor Green
                        $changesMade++
                    } else {
                        Write-Host "Already using Kanto tileset or different tileset" -ForegroundColor Blue
                    }
                }
            }
            break
        }
    }
}

Write-Host "Step 4: Total changes made: $changesMade" -ForegroundColor Cyan

# Step 5: Save the file
Write-Host "Step 5: Saving changes..." -ForegroundColor Cyan
$lines | Out-File -FilePath "data\layouts\layouts.json" -Encoding UTF8
Write-Host "File saved successfully!" -ForegroundColor Green

# Step 6: Verify the fix
Write-Host "Step 6: Verifying the changes..." -ForegroundColor Cyan
Write-Host "Checking a few Kanto layouts:" -ForegroundColor Yellow
$verification = Get-Content "data\layouts\layouts.json" | Select-String -Pattern "LAYOUT_PALLET_TOWN|LAYOUT_CERULEAN_CITY|LAYOUT_ONE_ISLAND" -Context 0,6
Write-Host $verification -ForegroundColor White

Write-Host "=== KANTO PRIMARY TILESET UPDATE COMPLETE ===" -ForegroundColor Green
Write-Host "Kanto layouts now use gTileset_General_Kanto" -ForegroundColor Green
