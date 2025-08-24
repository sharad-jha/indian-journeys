# Add Kanto Wild Encounters - Final Phase
# Adding remaining Kanto locations and cities

Write-Host "=== ADDING KANTO WILD ENCOUNTERS - FINAL PHASE ===" -ForegroundColor Green

# Read the current wild encounters file
$currentContent = Get-Content "src\data\wild_encounters.json" -Raw

# Define Final Phase Kanto wild encounter data
$kantoEncountersFinal = @"

        {
          "map": "MAP_PALLET_TOWN",
          "base_label": "gPalletTown",
          "land_mons": {
            "encounter_rate": 0,
            "mons": []
          }
        },
        {
          "map": "MAP_VIRIDIAN_CITY",
          "base_label": "gViridianCity",
          "land_mons": {
            "encounter_rate": 0,
            "mons": []
          }
        },
        {
          "map": "MAP_CERULEAN_CITY",
          "base_label": "gCeruleanCity",
          "land_mons": {
            "encounter_rate": 0,
            "mons": []
          }
        },
        {
          "map": "MAP_VERMILION_CITY",
          "base_label": "gVermilionCity",
          "land_mons": {
            "encounter_rate": 0,
            "mons": []
          }
        },
        {
          "map": "MAP_CELADON_CITY",
          "base_label": "gCeladonCity",
          "land_mons": {
            "encounter_rate": 0,
            "mons": []
          }
        },
        {
          "map": "MAP_FUCHSIA_CITY",
          "base_label": "gFuchsiaCity",
          "land_mons": {
            "encounter_rate": 0,
            "mons": []
          }
        },
        {
          "map": "MAP_CINNABAR_ISLAND",
          "base_label": "gCinnabarIsland",
          "land_mons": {
            "encounter_rate": 0,
            "mons": []
          }
        },
        {
          "map": "MAP_SSANNE_EXTERIOR",
          "base_label": "gSSAnne_Exterior",
          "land_mons": {
            "encounter_rate": 0,
            "mons": []
          }
        },
        {
          "map": "MAP_MT_EMBER_EXTERIOR",
          "base_label": "gMtEmber_Exterior",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 30,
                "max_level": 30,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 30,
                "max_level": 30,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 31,
                "max_level": 31,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 31,
                "max_level": 31,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 32,
                "max_level": 32,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 32,
                "max_level": 32,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 30,
                "max_level": 30,
                "species": "SPECIES_MACHOP"
              },
              {
                "min_level": 31,
                "max_level": 31,
                "species": "SPECIES_MACHOP"
              },
              {
                "min_level": 32,
                "max_level": 32,
                "species": "SPECIES_MACHOP"
              },
              {
                "min_level": 30,
                "max_level": 30,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 31,
                "max_level": 31,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 32,
                "max_level": 32,
                "species": "SPECIES_MACHOKE"
              }
            ]
          }
        },
        {
          "map": "MAP_MT_EMBER_SUMMIT_PATH_1F",
          "base_label": "gMtEmber_SummitPath_1F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 31,
                "max_level": 31,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 31,
                "max_level": 31,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 32,
                "max_level": 32,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 32,
                "max_level": 32,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 33,
                "max_level": 33,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 33,
                "max_level": 33,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 31,
                "max_level": 31,
                "species": "SPECIES_MACHOP"
              },
              {
                "min_level": 32,
                "max_level": 32,
                "species": "SPECIES_MACHOP"
              },
              {
                "min_level": 33,
                "max_level": 33,
                "species": "SPECIES_MACHOP"
              },
              {
                "min_level": 31,
                "max_level": 31,
                "species": "SPECIES_MACHOKE"
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
              }
            ]
          }
        },
        {
          "map": "MAP_MT_EMBER_SUMMIT_PATH_2F",
          "base_label": "gMtEmber_SummitPath_2F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 32,
                "max_level": 32,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 32,
                "max_level": 32,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 33,
                "max_level": 33,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 33,
                "max_level": 33,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 32,
                "max_level": 32,
                "species": "SPECIES_MACHOP"
              },
              {
                "min_level": 33,
                "max_level": 33,
                "species": "SPECIES_MACHOP"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_MACHOP"
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
              }
            ]
          }
        },
        {
          "map": "MAP_MT_EMBER_SUMMIT_PATH_3F",
          "base_label": "gMtEmber_SummitPath_3F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 33,
                "max_level": 33,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 33,
                "max_level": 33,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 33,
                "max_level": 33,
                "species": "SPECIES_MACHOP"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_MACHOP"
              },
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_MACHOP"
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
              }
            ]
          }
        },
        {
          "map": "MAP_MT_EMBER_RUBY_PATH_1F",
          "base_label": "gMtEmber_RubyPath_1F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_MACHOP"
              },
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_MACHOP"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_MACHOP"
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
              }
            ]
          }
        },
        {
          "map": "MAP_MT_EMBER_RUBY_PATH_B1F",
          "base_label": "gMtEmber_RubyPath_B1F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 35,
                "max_level": 35,
                "species": "SPECIES_MACHOP"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_MACHOP"
              },
              {
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_MACHOP"
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
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_MACHOKE"
              }
            ]
          }
        },
        {
          "map": "MAP_MT_EMBER_RUBY_PATH_B2F",
          "base_label": "gMtEmber_RubyPath_B2F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 38,
                "max_level": 38,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 38,
                "max_level": 38,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_MACHOP"
              },
              {
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_MACHOP"
              },
              {
                "min_level": 38,
                "max_level": 38,
                "species": "SPECIES_MACHOP"
              },
              {
                "min_level": 36,
                "max_level": 36,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 38,
                "max_level": 38,
                "species": "SPECIES_MACHOKE"
              }
            ]
          }
        },
        {
          "map": "MAP_MT_EMBER_RUBY_PATH_B3F",
          "base_label": "gMtEmber_RubyPath_B3F",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 38,
                "max_level": 38,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 38,
                "max_level": 38,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 39,
                "max_level": 39,
                "species": "SPECIES_GEODUDE"
              },
              {
                "min_level": 39,
                "max_level": 39,
                "species": "SPECIES_GRAVELER"
              },
              {
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_MACHOP"
              },
              {
                "min_level": 38,
                "max_level": 38,
                "species": "SPECIES_MACHOP"
              },
              {
                "min_level": 39,
                "max_level": 39,
                "species": "SPECIES_MACHOP"
              },
              {
                "min_level": 37,
                "max_level": 37,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 38,
                "max_level": 38,
                "species": "SPECIES_MACHOKE"
              },
              {
                "min_level": 39,
                "max_level": 39,
                "species": "SPECIES_MACHOKE"
              }
            ]
          }
        }
"@

# Find the position to insert the Kanto encounters (before the closing bracket of the encounters array)
$insertPosition = $currentContent.LastIndexOf(']')

if ($insertPosition -ne -1) {
    # Insert the Kanto encounters before the closing bracket
    $newContent = $currentContent.Substring(0, $insertPosition) + $kantoEncountersFinal + $currentContent.Substring($insertPosition)
    
    # Save the updated content
    $newContent | Out-File -FilePath "src\data\wild_encounters.json" -Encoding UTF8
    
    Write-Host "✅ Successfully added Final Phase Kanto wild encounters!" -ForegroundColor Green
    Write-Host "Added: Cities (no encounters), SS Anne, Mt. Ember Complex (Exterior, Summit Path 1F-3F, Ruby Path 1F-B3F)" -ForegroundColor Cyan
} else {
    Write-Host "❌ Error: Could not find insertion point in wild_encounters.json" -ForegroundColor Red
}

Write-Host "`n=== FINAL PHASE COMPLETE ===" -ForegroundColor Green
