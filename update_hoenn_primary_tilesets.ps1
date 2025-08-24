# Update Hoenn Primary Tilesets to gTileset_General_Hoenn
# This script updates ONLY Hoenn layouts to use the Hoenn-specific general tileset

Write-Host "=== UPDATING HOENN PRIMARY TILESETS ===" -ForegroundColor Green
Write-Host "Target: Change Hoenn layouts from gTileset_General to gTileset_General_Hoenn" -ForegroundColor Yellow

# Step 1: Create backup
Write-Host "Step 1: Creating backup..." -ForegroundColor Cyan
Copy-Item "data\layouts\layouts.json" "data\layouts\layouts_backup_hoenn_primary.json"
Write-Host "Backup created: layouts_backup_hoenn_primary.json" -ForegroundColor Green

# Step 2: Read the file
Write-Host "Step 2: Reading layouts.json..." -ForegroundColor Cyan
$lines = Get-Content "data\layouts\layouts.json"

# Step 3: Define Hoenn layouts to update
Write-Host "Step 3: Finding and updating Hoenn layouts..." -ForegroundColor Cyan

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

$changesMade = 0

for ($i = 0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i]
    
    # Check if this is a Hoenn layout ID
    foreach ($hoennLayout in $hoennLayouts) {
        if ($line -match "`"id`": `"$hoennLayout") {
            Write-Host "Found Hoenn layout: $hoennLayout at line $($i+1)" -ForegroundColor Yellow
            
            # Look for primary_tileset line (should be 4 lines after ID)
            $tilesetLineIndex = $i + 4
            if ($tilesetLineIndex -lt $lines.Count) {
                $tilesetLine = $lines[$tilesetLineIndex]
                
                if ($tilesetLine -match '"primary_tileset":') {
                    Write-Host "Current primary tileset: $tilesetLine" -ForegroundColor Gray
                    
                    # Replace gTileset_General with gTileset_General_Hoenn
                    if ($tilesetLine -match 'gTileset_General') {
                        $newTilesetLine = $tilesetLine -replace 'gTileset_General', 'gTileset_General_Hoenn'
                        $lines[$tilesetLineIndex] = $newTilesetLine
                        Write-Host "Updated to: $newTilesetLine" -ForegroundColor Green
                        $changesMade++
                    } else {
                        Write-Host "Already using Hoenn tileset or different tileset" -ForegroundColor Blue
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
Write-Host "Checking a few Hoenn layouts:" -ForegroundColor Yellow
$verification = Get-Content "data\layouts\layouts.json" | Select-String -Pattern "LAYOUT_LITTLEROOT_TOWN|LAYOUT_PETALBURG_CITY|LAYOUT_RUSTBORO_CITY" -Context 0,6
Write-Host $verification -ForegroundColor White

Write-Host "=== HOENN PRIMARY TILESET UPDATE COMPLETE ===" -ForegroundColor Green
Write-Host "Hoenn layouts now use gTileset_General_Hoenn" -ForegroundColor Green
