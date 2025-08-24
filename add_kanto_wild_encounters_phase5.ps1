# Add Kanto Wild Encounters - Phase 5
# Adding major Kanto caves and dungeons

Write-Host "=== ADDING KANTO WILD ENCOUNTERS - PHASE 5 ===" -ForegroundColor Green

# Read the current wild encounters file
$currentContent = Get-Content "src\data\wild_encounters.json" -Raw

# Define Phase 5 Kanto wild encounter data
$kantoEncountersPhase5 = @"

        {
          "map": "MAP_VICTORY_ROAD_1F",
          "base_label": "gVictoryRoad_1F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 32,
                "max_level": 32,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 32,
                "max_level": 32,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 33,
                "max_level": 33,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 33,
                "max_level": 33,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 32,
                "max_level": 32,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 33,
                "max_level": 33,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 32,
                "max_level": 32,
                "species": "SPECIES_ONIX"
              },
              {
                "min_level": 33,
                "max_level": 33,
                "species": "SPECIES_ONIX"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_ONIX"
              }
            ]
          }
        },
        {
          "map": "MAP_VICTORY_ROAD_2F",
          "base_label": "gVictoryRoad_2F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 33,
                "max_level": 33,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 33,
                "max_level": 33,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 33,
                "max_level": 33,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 33,
                "max_level": 33,
                "species": "SPECIES_ONIX"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_ONIX"
              },
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_ONIX"
              }
            ]
          }
        },
        {
          "map": "MAP_VICTORY_ROAD_3F",
          "base_label": "gVictoryRoad_3F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_ONIX"
              },
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_ONIX"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_ONIX"
              }
            ]
          }
        },
        {
          "map": "MAP_CERULEAN_CAVE_1F",
          "base_label": "gCeruleanCave_1F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 50,
                "max_level": 50,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 50,
                "max_level": 50,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 51,
                "max_level": 51,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 51,
                "max_level": 51,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 52,
                "max_level": 52,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 52,
                "max_level": 52,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 50,
                "max_level": 50,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 51,
                "max_level": 51,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 52,
                "max_level": 52,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 50,
                "max_level": 50,
                "species": "SPECIES_KADABRA"
              },
              {
                "min_level": 51,
                "max_level": 51,
                "species": "SPECIES_KADABRA"
              },
              {
                "min_level": 52,
                "max_level": 52,
                "species": "SPECIES_KADABRA"
              }
            ]
          }
        },
        {
          "map": "MAP_CERULEAN_CAVE_2F",
          "base_label": "gCeruleanCave_2F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 51,
                "max_level": 51,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 51,
                "max_level": 51,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 52,
                "max_level": 52,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 52,
                "max_level": 52,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 53,
                "max_level": 53,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 53,
                "max_level": 53,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 51,
                "max_level": 51,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 52,
                "max_level": 52,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 53,
                "max_level": 53,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 51,
                "max_level": 51,
                "species": "SPECIES_KADABRA"
              },
              {
                "min_level": 52,
                "max_level": 52,
                "species": "SPECIES_KADABRA"
              },
              {
                "min_level": 53,
                "max_level": 53,
                "species": "SPECIES_KADABRA"
              }
            ]
          }
        },
        {
          "map": "MAP_CERULEAN_CAVE_B1F",
          "base_label": "gCeruleanCave_B1F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 52,
                "max_level": 52,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 52,
                "max_level": 52,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 53,
                "max_level": 53,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 53,
                "max_level": 53,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 54,
                "max_level": 54,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 54,
                "max_level": 54,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 52,
                "max_level": 52,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 53,
                "max_level": 53,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 54,
                "max_level": 54,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 52,
                "max_level": 52,
                "species": "SPECIES_KADABRA"
              },
              {
                "min_level": 53,
                "max_level": 53,
                "species": "SPECIES_KADABRA"
              },
              {
                "min_level": 54,
                "max_level": 54,
                "species": "SPECIES_KADABRA"
              }
            ]
          }
        },
        {
          "map": "MAP_SEAFOAM_ISLANDS_1F",
          "base_label": "gSeafoamIslands_1F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 26,
                "max_level": 26,
                "species": "SPECIES_ZUBAT"
              },
              {
                "min_level": 26,
                "max_level": 26,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_ZUBAT"
              },
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 28,
                "max_level": 28,
                "species": "SPECIES_ZUBAT"
              },
              {
                "min_level": 28,
                "max_level": 28,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 26,
                "max_level": 26,
                "species": "SPECIES_PSYDUCK"
              },
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_PSYDUCK"
              },
              {
                "min_level": 28,
                "max_level": 28,
                "species": "SPECIES_PSYDUCK"
              },
              {
                "min_level": 26,
                "max_level": 26,
                "species": "SPECIES_GOLDUCK"
              },
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_GOLDUCK"
              },
              {
                "min_level": 28,
                "max_level": 28,
                "species": "SPECIES_GOLDUCK"
              }
            ]
          }
        },
        {
          "map": "MAP_SEAFOAM_ISLANDS_B1F",
          "base_label": "gSeafoamIslands_B1F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_ZUBAT"
              },
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 28,
                "max_level": 28,
                "species": "SPECIES_ZUBAT"
              },
              {
                "min_level": 28,
                "max_level": 28,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 29,
                "max_level": 29,
                "species": "SPECIES_ZUBAT"
              },
              {
                "min_level": 29,
                "max_level": 29,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_PSYDUCK"
              },
              {
                "min_level": 28,
                "max_level": 28,
                "species": "SPECIES_PSYDUCK"
              },
              {
                "min_level": 29,
                "max_level": 29,
                "species": "SPECIES_PSYDUCK"
              },
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_GOLDUCK"
              },
              {
                "min_level": 28,
                "max_level": 28,
                "species": "SPECIES_GOLDUCK"
              },
              {
                "min_level": 29,
                "max_level": 29,
                "species": "SPECIES_GOLDUCK"
              }
            ]
          }
        },
        {
          "map": "MAP_SEAFOAM_ISLANDS_B2F",
          "base_label": "gSeafoamIslands_B2F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 28,
                "max_level": 28,
                "species": "SPECIES_ZUBAT"
              },
              {
                "min_level": 28,
                "max_level": 28,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 29,
                "max_level": 29,
                "species": "SPECIES_ZUBAT"
              },
              {
                "min_level": 29,
                "max_level": 29,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 30,
                "max_level": 30,
                "species": "SPECIES_ZUBAT"
              },
              {
                "min_level": 30,
                "max_level": 30,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 28,
                "max_level": 28,
                "species": "SPECIES_PSYDUCK"
              },
              {
                "min_level": 29,
                "max_level": 29,
                "species": "SPECIES_PSYDUCK"
              },
              {
                "min_level": 30,
                "max_level": 30,
                "species": "SPECIES_PSYDUCK"
              },
              {
                "min_level": 28,
                "max_level": 28,
                "species": "SPECIES_GOLDUCK"
              },
              {
                "min_level": 29,
                "max_level": 29,
                "species": "SPECIES_GOLDUCK"
              },
              {
                "min_level": 30,
                "max_level": 30,
                "species": "SPECIES_GOLDUCK"
              }
            ]
          }
        },
        {
          "map": "MAP_SEAFOAM_ISLANDS_B3F",
          "base_label": "gSeafoamIslands_B3F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 29,
                "max_level": 29,
                "species": "SPECIES_ZUBAT"
              },
              {
                "min_level": 29,
                "max_level": 29,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 30,
                "max_level": 30,
                "species": "SPECIES_ZUBAT"
              },
              {
                "min_level": 30,
                "max_level": 30,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 31,
                "max_level": 31,
                "species": "SPECIES_ZUBAT"
              },
              {
                "min_level": 31,
                "max_level": 31,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 29,
                "max_level": 29,
                "species": "SPECIES_PSYDUCK"
              },
              {
                "min_level": 30,
                "max_level": 30,
                "species": "SPECIES_PSYDUCK"
              },
              {
                "min_level": 31,
                "max_level": 31,
                "species": "SPECIES_PSYDUCK"
              },
              {
                "min_level": 29,
                "max_level": 29,
                "species": "SPECIES_GOLDUCK"
              },
              {
                "min_level": 30,
                "max_level": 30,
                "species": "SPECIES_GOLDUCK"
              },
              {
                "min_level": 31,
                "max_level": 31,
                "species": "SPECIES_GOLDUCK"
              }
            ]
          }
        },
        {
          "map": "MAP_SEAFOAM_ISLANDS_B4F",
          "base_label": "gSeafoamIslands_B4F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 30,
                "max_level": 30,
                "species": "SPECIES_ZUBAT"
              },
              {
                "min_level": 30,
                "max_level": 30,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 31,
                "max_level": 31,
                "species": "SPECIES_ZUBAT"
              },
              {
                "min_level": 31,
                "max_level": 31,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 32,
                "max_level": 32,
                "species": "SPECIES_ZUBAT"
              },
              {
                "min_level": 32,
                "max_level": 32,
                "species": "SPECIES_GOLBAT"
              },
              {
                "min_level": 30,
                "max_level": 30,
                "species": "SPECIES_PSYDUCK"
              },
              {
                "min_level": 31,
                "max_level": 31,
                "species": "SPECIES_PSYDUCK"
              },
              {
                "min_level": 32,
                "max_level": 32,
                "species": "SPECIES_PSYDUCK"
              },
              {
                "min_level": 30,
                "max_level": 30,
                "species": "SPECIES_GOLDUCK"
              },
              {
                "min_level": 31,
                "max_level": 31,
                "species": "SPECIES_GOLDUCK"
              },
              {
                "min_level": 32,
                "max_level": 32,
                "species": "SPECIES_GOLDUCK"
              }
            ]
          }
        }
"@

# Find the position to insert the Kanto encounters (before the closing bracket of the encounters array)
$insertPosition = $currentContent.LastIndexOf(']')

if ($insertPosition -ne -1) {
    # Insert the Kanto encounters before the closing bracket
    $newContent = $currentContent.Substring(0, $insertPosition) + $kantoEncountersPhase5 + $currentContent.Substring($insertPosition)
    
    # Save the updated content
    $newContent | Out-File -FilePath "src\data\wild_encounters.json" -Encoding UTF8
    
    Write-Host "✅ Successfully added Phase 5 Kanto wild encounters!" -ForegroundColor Green
    Write-Host "Added: Victory Road (1F, 2F, 3F), Cerulean Cave (1F, 2F, B1F), Seafoam Islands (1F, B1F, B2F, B3F, B4F)" -ForegroundColor Cyan
} else {
    Write-Host "❌ Error: Could not find insertion point in wild_encounters.json" -ForegroundColor Red
}

Write-Host "`n=== PHASE 5 COMPLETE ===" -ForegroundColor Green
