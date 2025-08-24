# Add Kanto Wild Encounters - Phase 6
# Adding special Kanto areas

Write-Host "=== ADDING KANTO WILD ENCOUNTERS - PHASE 6 ===" -ForegroundColor Green

# Read the current wild encounters file
$currentContent = Get-Content "src\data\wild_encounters.json" -Raw

# Define Phase 6 Kanto wild encounter data
$kantoEncountersPhase6 = @"

        {
          "map": "MAP_POKEMON_MANSION_1F",
          "base_label": "gPokemonMansion_1F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_RATICATE"
              },
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_RATICATE"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_RATICATE"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_GRIMER"
              },
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_GRIMER"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_GRIMER"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_MUK"
              },
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_MUK"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_MUK"
              }
            ]
          }
        },
        {
          "map": "MAP_POKEMON_MANSION_2F",
          "base_label": "gPokemonMansion_2F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_RATICATE"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_RATICATE"
              },
              {
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_RATICATE"
              },
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_GRIMER"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_GRIMER"
              },
              {
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_GRIMER"
              },
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_MUK"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_MUK"
              },
              {
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_MUK"
              }
            ]
          }
        },
        {
          "map": "MAP_POKEMON_MANSION_3F",
          "base_label": "gPokemonMansion_3F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_RATICATE"
              },
              {
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_RATICATE"
              },
              {
                "min_level": 38,
                "max_level": 38,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 38,
                "max_level": 38,
                "species": "SPECIES_RATICATE"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_GRIMER"
              },
              {
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_GRIMER"
              },
              {
                "min_level": 38,
                "max_level": 38,
                "species": "SPECIES_GRIMER"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_MUK"
              },
              {
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_MUK"
              },
              {
                "min_level": 38,
                "max_level": 38,
                "species": "SPECIES_MUK"
              }
            ]
          }
        },
        {
          "map": "MAP_POKEMON_MANSION_B1F",
          "base_label": "gPokemonMansion_B1F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_RATICATE"
              },
              {
                "min_level": 38,
                "max_level": 38,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 38,
                "max_level": 38,
                "species": "SPECIES_RATICATE"
              },
              {
                "min_level": 39,
                "max_level": 39,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 39,
                "max_level": 39,
                "species": "SPECIES_RATICATE"
              },
              {
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_GRIMER"
              },
              {
                "min_level": 38,
                "max_level": 38,
                "species": "SPECIES_GRIMER"
              },
              {
                "min_level": 39,
                "max_level": 39,
                "species": "SPECIES_GRIMER"
              },
              {
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_MUK"
              },
              {
                "min_level": 38,
                "max_level": 38,
                "species": "SPECIES_MUK"
              },
              {
                "min_level": 39,
                "max_level": 39,
                "species": "SPECIES_MUK"
              }
            ]
          }
        },
        {
          "map": "MAP_POKEMON_TOWER_3F",
          "base_label": "gPokemonTower_3F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 15,
                "max_level": 15,
                "species": "SPECIES_GASTLY"
              },
              {
                "min_level": 16,
                "max_level": 16,
                "species": "SPECIES_GASTLY"
              },
              {
                "min_level": 17,
                "max_level": 17,
                "species": "SPECIES_GASTLY"
              },
              {
                "min_level": 15,
                "max_level": 15,
                "species": "SPECIES_CUBONE"
              },
              {
                "min_level": 16,
                "max_level": 16,
                "species": "SPECIES_CUBONE"
              },
              {
                "min_level": 17,
                "max_level": 17,
                "species": "SPECIES_CUBONE"
              },
              {
                "min_level": 15,
                "max_level": 15,
                "species": "SPECIES_HAUNTER"
              },
              {
                "min_level": 16,
                "max_level": 16,
                "species": "SPECIES_HAUNTER"
              },
              {
                "min_level": 17,
                "max_level": 17,
                "species": "SPECIES_HAUNTER"
              },
              {
                "min_level": 15,
                "max_level": 15,
                "species": "SPECIES_MAROWAK"
              },
              {
                "min_level": 16,
                "max_level": 16,
                "species": "SPECIES_MAROWAK"
              },
              {
                "min_level": 17,
                "max_level": 17,
                "species": "SPECIES_MAROWAK"
              }
            ]
          }
        },
        {
          "map": "MAP_POKEMON_TOWER_4F",
          "base_label": "gPokemonTower_4F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 16,
                "max_level": 16,
                "species": "SPECIES_GASTLY"
              },
              {
                "min_level": 17,
                "max_level": 17,
                "species": "SPECIES_GASTLY"
              },
              {
                "min_level": 18,
                "max_level": 18,
                "species": "SPECIES_GASTLY"
              },
              {
                "min_level": 16,
                "max_level": 16,
                "species": "SPECIES_CUBONE"
              },
              {
                "min_level": 17,
                "max_level": 17,
                "species": "SPECIES_CUBONE"
              },
              {
                "min_level": 18,
                "max_level": 18,
                "species": "SPECIES_CUBONE"
              },
              {
                "min_level": 16,
                "max_level": 16,
                "species": "SPECIES_HAUNTER"
              },
              {
                "min_level": 17,
                "max_level": 17,
                "species": "SPECIES_HAUNTER"
              },
              {
                "min_level": 18,
                "max_level": 18,
                "species": "SPECIES_HAUNTER"
              },
              {
                "min_level": 16,
                "max_level": 16,
                "species": "SPECIES_MAROWAK"
              },
              {
                "min_level": 17,
                "max_level": 17,
                "species": "SPECIES_MAROWAK"
              },
              {
                "min_level": 18,
                "max_level": 18,
                "species": "SPECIES_MAROWAK"
              }
            ]
          }
        },
        {
          "map": "MAP_POKEMON_TOWER_5F",
          "base_label": "gPokemonTower_5F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 17,
                "max_level": 17,
                "species": "SPECIES_GASTLY"
              },
              {
                "min_level": 18,
                "max_level": 18,
                "species": "SPECIES_GASTLY"
              },
              {
                "min_level": 19,
                "max_level": 19,
                "species": "SPECIES_GASTLY"
              },
              {
                "min_level": 17,
                "max_level": 17,
                "species": "SPECIES_CUBONE"
              },
              {
                "min_level": 18,
                "max_level": 18,
                "species": "SPECIES_CUBONE"
              },
              {
                "min_level": 19,
                "max_level": 19,
                "species": "SPECIES_CUBONE"
              },
              {
                "min_level": 17,
                "max_level": 17,
                "species": "SPECIES_HAUNTER"
              },
              {
                "min_level": 18,
                "max_level": 18,
                "species": "SPECIES_HAUNTER"
              },
              {
                "min_level": 19,
                "max_level": 19,
                "species": "SPECIES_HAUNTER"
              },
              {
                "min_level": 17,
                "max_level": 17,
                "species": "SPECIES_MAROWAK"
              },
              {
                "min_level": 18,
                "max_level": 18,
                "species": "SPECIES_MAROWAK"
              },
              {
                "min_level": 19,
                "max_level": 19,
                "species": "SPECIES_MAROWAK"
              }
            ]
          }
        },
        {
          "map": "MAP_POKEMON_TOWER_6F",
          "base_label": "gPokemonTower_6F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 18,
                "max_level": 18,
                "species": "SPECIES_GASTLY"
              },
              {
                "min_level": 19,
                "max_level": 19,
                "species": "SPECIES_GASTLY"
              },
              {
                "min_level": 20,
                "max_level": 20,
                "species": "SPECIES_GASTLY"
              },
              {
                "min_level": 18,
                "max_level": 18,
                "species": "SPECIES_CUBONE"
              },
              {
                "min_level": 19,
                "max_level": 19,
                "species": "SPECIES_CUBONE"
              },
              {
                "min_level": 20,
                "max_level": 20,
                "species": "SPECIES_CUBONE"
              },
              {
                "min_level": 18,
                "max_level": 18,
                "species": "SPECIES_HAUNTER"
              },
              {
                "min_level": 19,
                "max_level": 19,
                "species": "SPECIES_HAUNTER"
              },
              {
                "min_level": 20,
                "max_level": 20,
                "species": "SPECIES_HAUNTER"
              },
              {
                "min_level": 18,
                "max_level": 18,
                "species": "SPECIES_MAROWAK"
              },
              {
                "min_level": 19,
                "max_level": 19,
                "species": "SPECIES_MAROWAK"
              },
              {
                "min_level": 20,
                "max_level": 20,
                "species": "SPECIES_MAROWAK"
              }
            ]
          }
        },
        {
          "map": "MAP_POKEMON_TOWER_7F",
          "base_label": "gPokemonTower_7F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 19,
                "max_level": 19,
                "species": "SPECIES_GASTLY"
              },
              {
                "min_level": 20,
                "max_level": 20,
                "species": "SPECIES_GASTLY"
              },
              {
                "min_level": 21,
                "max_level": 21,
                "species": "SPECIES_GASTLY"
              },
              {
                "min_level": 19,
                "max_level": 19,
                "species": "SPECIES_CUBONE"
              },
              {
                "min_level": 20,
                "max_level": 20,
                "species": "SPECIES_CUBONE"
              },
              {
                "min_level": 21,
                "max_level": 21,
                "species": "SPECIES_CUBONE"
              },
              {
                "min_level": 19,
                "max_level": 19,
                "species": "SPECIES_HAUNTER"
              },
              {
                "min_level": 20,
                "max_level": 20,
                "species": "SPECIES_HAUNTER"
              },
              {
                "min_level": 21,
                "max_level": 21,
                "species": "SPECIES_HAUNTER"
              },
              {
                "min_level": 19,
                "max_level": 19,
                "species": "SPECIES_MAROWAK"
              },
              {
                "min_level": 20,
                "max_level": 20,
                "species": "SPECIES_MAROWAK"
              },
              {
                "min_level": 21,
                "max_level": 21,
                "species": "SPECIES_MAROWAK"
              }
            ]
          }
        },
        {
          "map": "MAP_SAFARI_ZONE_CENTER",
          "base_label": "gSafariZone_Center",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 25,
                "max_level": 25,
                "species": "SPECIES_NIDORAN_M"
              },
              {
                "min_level": 25,
                "max_level": 25,
                "species": "SPECIES_NIDORAN_F"
              },
              {
                "min_level": 26,
                "max_level": 26,
                "species": "SPECIES_NIDORAN_M"
              },
              {
                "min_level": 26,
                "max_level": 26,
                "species": "SPECIES_NIDORAN_F"
              },
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_NIDORAN_M"
              },
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_NIDORAN_F"
              },
              {
                "min_level": 25,
                "max_level": 25,
                "species": "SPECIES_DODUO"
              },
              {
                "min_level": 26,
                "max_level": 26,
                "species": "SPECIES_DODUO"
              },
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_DODUO"
              },
              {
                "min_level": 25,
                "max_level": 25,
                "species": "SPECIES_PARAS"
              },
              {
                "min_level": 26,
                "max_level": 26,
                "species": "SPECIES_PARAS"
              },
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_PARAS"
              }
            ]
          }
        },
        {
          "map": "MAP_SAFARI_ZONE_EAST",
          "base_label": "gSafariZone_East",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 26,
                "max_level": 26,
                "species": "SPECIES_NIDORAN_M"
              },
              {
                "min_level": 26,
                "max_level": 26,
                "species": "SPECIES_NIDORAN_F"
              },
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_NIDORAN_M"
              },
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_NIDORAN_F"
              },
              {
                "min_level": 28,
                "max_level": 28,
                "species": "SPECIES_NIDORAN_M"
              },
              {
                "min_level": 28,
                "max_level": 28,
                "species": "SPECIES_NIDORAN_F"
              },
              {
                "min_level": 26,
                "max_level": 26,
                "species": "SPECIES_DODUO"
              },
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_DODUO"
              },
              {
                "min_level": 28,
                "max_level": 28,
                "species": "SPECIES_DODUO"
              },
              {
                "min_level": 26,
                "max_level": 26,
                "species": "SPECIES_PARAS"
              },
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_PARAS"
              },
              {
                "min_level": 28,
                "max_level": 28,
                "species": "SPECIES_PARAS"
              }
            ]
          }
        },
        {
          "map": "MAP_SAFARI_ZONE_NORTH",
          "base_label": "gSafariZone_North",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_NIDORAN_M"
              },
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_NIDORAN_F"
              },
              {
                "min_level": 28,
                "max_level": 28,
                "species": "SPECIES_NIDORAN_M"
              },
              {
                "min_level": 28,
                "max_level": 28,
                "species": "SPECIES_NIDORAN_F"
              },
              {
                "min_level": 29,
                "max_level": 29,
                "species": "SPECIES_NIDORAN_M"
              },
              {
                "min_level": 29,
                "max_level": 29,
                "species": "SPECIES_NIDORAN_F"
              },
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_DODUO"
              },
              {
                "min_level": 28,
                "max_level": 28,
                "species": "SPECIES_DODUO"
              },
              {
                "min_level": 29,
                "max_level": 29,
                "species": "SPECIES_DODUO"
              },
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_PARAS"
              },
              {
                "min_level": 28,
                "max_level": 28,
                "species": "SPECIES_PARAS"
              },
              {
                "min_level": 29,
                "max_level": 29,
                "species": "SPECIES_PARAS"
              }
            ]
          }
        },
        {
          "map": "MAP_SAFARI_ZONE_WEST",
          "base_label": "gSafariZone_West",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 24,
                "max_level": 24,
                "species": "SPECIES_NIDORAN_M"
              },
              {
                "min_level": 24,
                "max_level": 24,
                "species": "SPECIES_NIDORAN_F"
              },
              {
                "min_level": 25,
                "max_level": 25,
                "species": "SPECIES_NIDORAN_M"
              },
              {
                "min_level": 25,
                "max_level": 25,
                "species": "SPECIES_NIDORAN_F"
              },
              {
                "min_level": 26,
                "max_level": 26,
                "species": "SPECIES_NIDORAN_M"
              },
              {
                "min_level": 26,
                "max_level": 26,
                "species": "SPECIES_NIDORAN_F"
              },
              {
                "min_level": 24,
                "max_level": 24,
                "species": "SPECIES_DODUO"
              },
              {
                "min_level": 25,
                "max_level": 25,
                "species": "SPECIES_DODUO"
              },
              {
                "min_level": 26,
                "max_level": 26,
                "species": "SPECIES_DODUO"
              },
              {
                "min_level": 24,
                "max_level": 24,
                "species": "SPECIES_PARAS"
              },
              {
                "min_level": 25,
                "max_level": 25,
                "species": "SPECIES_PARAS"
              },
              {
                "min_level": 26,
                "max_level": 26,
                "species": "SPECIES_PARAS"
              }
            ]
          }
        }
"@

# Find the position to insert the Kanto encounters (before the closing bracket of the encounters array)
$insertPosition = $currentContent.LastIndexOf(']')

if ($insertPosition -ne -1) {
    # Insert the Kanto encounters before the closing bracket
    $newContent = $currentContent.Substring(0, $insertPosition) + $kantoEncountersPhase6 + $currentContent.Substring($insertPosition)
    
    # Save the updated content
    $newContent | Out-File -FilePath "src\data\wild_encounters.json" -Encoding UTF8
    
    Write-Host "✅ Successfully added Phase 6 Kanto wild encounters!" -ForegroundColor Green
    Write-Host "Added: Pokemon Mansion (1F, 2F, 3F, B1F), Pokemon Tower (3F, 4F, 5F, 6F, 7F), Safari Zone (Center, East, North, West)" -ForegroundColor Cyan
} else {
    Write-Host "❌ Error: Could not find insertion point in wild_encounters.json" -ForegroundColor Red
}

Write-Host "`n=== PHASE 6 COMPLETE ===" -ForegroundColor Green
