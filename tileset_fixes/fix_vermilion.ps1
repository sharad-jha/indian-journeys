$content = Get-Content 'data\layouts\layouts.json' -Raw 
$pattern = 'LAYOUT_VERMILION_CITY.*?"secondary_tileset": "gTileset_CeruleanCity"' 
$content = $content -replace $pattern, $replacement 
