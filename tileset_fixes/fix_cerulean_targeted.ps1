$content = Get-Content 'data\layouts\layouts.json' -Raw 
$pattern = 'LAYOUT_CERULEAN_CITY.*?"secondary_tileset": "gTileset_Petalburg"' 
$content = $content -replace $pattern, $replacement 
