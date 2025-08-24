# Add Kanto Wild Encounters - Phase 4
# Adding more Kanto routes and key locations

Write-Host "=== ADDING KANTO WILD ENCOUNTERS - PHASE 4 ===" -ForegroundColor Green

# Read the current wild encounters file
$currentContent = Get-Content "src\data\wild_encounters.json" -Raw

# Define Phase 4 Kanto wild encounter data
$kantoEncountersPhase4 = @"

        {
          "map": "MAP_ROUTE16",
          "base_label": "gRoute16",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 20,
                "max_level": 20,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 20,
                "max_level": 20,
                "species": "SPECIES_RATICATE"
              },
              {
                "min_level": 21,
                "max_level": 21,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 21,
                "max_level": 21,
                "species": "SPECIES_RATICATE"
              },
              {
                "min_level": 22,
                "max_level": 22,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 22,
                "max_level": 22,
                "species": "SPECIES_RATICATE"
              },
              {
                "min_level": 20,
                "max_level": 20,
                "species": "SPECIES_DODUO"
              },
              {
                "min_level": 21,
                "max_level": 21,
                "species": "SPECIES_DODUO"
              },
              {
                "min_level": 22,
                "max_level": 22,
                "species": "SPECIES_DODUO"
              },
              {
                "min_level": 20,
                "max_level": 20,
                "species": "SPECIES_SPEAROW"
              },
              {
                "min_level": 21,
                "max_level": 21,
                "species": "SPECIES_SPEAROW"
              },
              {
                "min_level": 22,
                "max_level": 22,
                "species": "SPECIES_SPEAROW"
              }
            ]
          }
        },
        {
          "map": "MAP_ROUTE17",
          "base_label": "gRoute17",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 20,
                "max_level": 20,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 20,
                "max_level": 20,
                "species": "SPECIES_RATICATE"
              },
              {
                "min_level": 21,
                "max_level": 21,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 21,
                "max_level": 21,
                "species": "SPECIES_RATICATE"
              },
              {
                "min_level": 22,
                "max_level": 22,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 22,
                "max_level": 22,
                "species": "SPECIES_RATICATE"
              },
              {
                "min_level": 20,
                "max_level": 20,
                "species": "SPECIES_DODUO"
              },
              {
                "min_level": 21,
                "max_level": 21,
                "species": "SPECIES_DODUO"
              },
              {
                "min_level": 22,
                "max_level": 22,
                "species": "SPECIES_DODUO"
              },
              {
                "min_level": 20,
                "max_level": 20,
                "species": "SPECIES_SPEAROW"
              },
              {
                "min_level": 21,
                "max_level": 21,
                "species": "SPECIES_SPEAROW"
              },
              {
                "min_level": 22,
                "max_level": 22,
                "species": "SPECIES_SPEAROW"
              }
            ]
          }
        },
        {
          "map": "MAP_ROUTE18",
          "base_label": "gRoute18",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 22,
                "max_level": 22,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 22,
                "max_level": 22,
                "species": "SPECIES_RATICATE"
              },
              {
                "min_level": 23,
                "max_level": 23,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 23,
                "max_level": 23,
                "species": "SPECIES_RATICATE"
              },
              {
                "min_level": 24,
                "max_level": 24,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 24,
                "max_level": 24,
                "species": "SPECIES_RATICATE"
              },
              {
                "min_level": 22,
                "max_level": 22,
                "species": "SPECIES_DODUO"
              },
              {
                "min_level": 23,
                "max_level": 23,
                "species": "SPECIES_DODUO"
              },
              {
                "min_level": 24,
                "max_level": 24,
                "species": "SPECIES_DODUO"
              },
              {
                "min_level": 22,
                "max_level": 22,
                "species": "SPECIES_SPEAROW"
              },
              {
                "min_level": 23,
                "max_level": 23,
                "species": "SPECIES_SPEAROW"
              },
              {
                "min_level": 24,
                "max_level": 24,
                "species": "SPECIES_SPEAROW"
              }
            ]
          }
        },
        {
          "map": "MAP_ROUTE19",
          "base_label": "gRoute19",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 20,
                "max_level": 20,
                "species": "SPECIES_TENTACOOL"
              },
              {
                "min_level": 20,
                "max_level": 20,
                "species": "SPECIES_TENTACRUEL"
              },
              {
                "min_level": 21,
                "max_level": 21,
                "species": "SPECIES_TENTACOOL"
              },
              {
                "min_level": 21,
                "max_level": 21,
                "species": "SPECIES_TENTACRUEL"
              },
              {
                "min_level": 22,
                "max_level": 22,
                "species": "SPECIES_TENTACOOL"
              },
              {
                "min_level": 22,
                "max_level": 22,
                "species": "SPECIES_TENTACRUEL"
              },
              {
                "min_level": 20,
                "max_level": 20,
                "species": "SPECIES_MAGIKARP"
              },
              {
                "min_level": 21,
                "max_level": 21,
                "species": "SPECIES_MAGIKARP"
              },
              {
                "min_level": 22,
                "max_level": 22,
                "species": "SPECIES_MAGIKARP"
              },
              {
                "min_level": 20,
                "max_level": 20,
                "species": "SPECIES_KRABBY"
              },
              {
                "min_level": 21,
                "max_level": 21,
                "species": "SPECIES_KRABBY"
              },
              {
                "min_level": 22,
                "max_level": 22,
                "species": "SPECIES_KRABBY"
              }
            ]
          }
        },
        {
          "map": "MAP_ROUTE20",
          "base_label": "gRoute20",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 25,
                "max_level": 25,
                "species": "SPECIES_TENTACOOL"
              },
              {
                "min_level": 25,
                "max_level": 25,
                "species": "SPECIES_TENTACRUEL"
              },
              {
                "min_level": 26,
                "max_level": 26,
                "species": "SPECIES_TENTACOOL"
              },
              {
                "min_level": 26,
                "max_level": 26,
                "species": "SPECIES_TENTACRUEL"
              },
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_TENTACOOL"
              },
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_TENTACRUEL"
              },
              {
                "min_level": 25,
                "max_level": 25,
                "species": "SPECIES_MAGIKARP"
              },
              {
                "min_level": 26,
                "max_level": 26,
                "species": "SPECIES_MAGIKARP"
              },
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_MAGIKARP"
              },
              {
                "min_level": 25,
                "max_level": 25,
                "species": "SPECIES_KRABBY"
              },
              {
                "min_level": 26,
                "max_level": 26,
                "species": "SPECIES_KRABBY"
              },
              {
                "min_level": 27,
                "max_level": 27,
                "species": "SPECIES_KRABBY"
              }
            ]
          }
        },
        {
          "map": "MAP_ROUTE21",
          "base_label": "gRoute21",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 22,
                "max_level": 22,
                "species": "SPECIES_TENTACOOL"
              },
              {
                "min_level": 22,
                "max_level": 22,
                "species": "SPECIES_TENTACRUEL"
              },
              {
                "min_level": 23,
                "max_level": 23,
                "species": "SPECIES_TENTACOOL"
              },
              {
                "min_level": 23,
                "max_level": 23,
                "species": "SPECIES_TENTACRUEL"
              },
              {
                "min_level": 24,
                "max_level": 24,
                "species": "SPECIES_TENTACOOL"
              },
              {
                "min_level": 24,
                "max_level": 24,
                "species": "SPECIES_TENTACRUEL"
              },
              {
                "min_level": 22,
                "max_level": 22,
                "species": "SPECIES_MAGIKARP"
              },
              {
                "min_level": 23,
                "max_level": 23,
                "species": "SPECIES_MAGIKARP"
              },
              {
                "min_level": 24,
                "max_level": 24,
                "species": "SPECIES_MAGIKARP"
              },
              {
                "min_level": 22,
                "max_level": 22,
                "species": "SPECIES_KRABBY"
              },
              {
                "min_level": 23,
                "max_level": 23,
                "species": "SPECIES_KRABBY"
              },
              {
                "min_level": 24,
                "max_level": 24,
                "species": "SPECIES_KRABBY"
              }
            ]
          }
        },
        {
          "map": "MAP_ROUTE22",
          "base_label": "gRoute22",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 3,
                "max_level": 3,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 3,
                "max_level": 3,
                "species": "SPECIES_SPEAROW"
              },
              {
                "min_level": 4,
                "max_level": 4,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 4,
                "max_level": 4,
                "species": "SPECIES_SPEAROW"
              },
              {
                "min_level": 5,
                "max_level": 5,
                "species": "SPECIES_RATTATA"
              },
              {
                "min_level": 5,
                "max_level": 5,
                "species": "SPECIES_SPEAROW"
              },
              {
                "min_level": 3,
                "max_level": 3,
                "species": "SPECIES_NIDORAN_M"
              },
              {
                "min_level": 4,
                "max_level": 4,
                "species": "SPECIES_NIDORAN_M"
              },
              {
                "min_level": 5,
                "max_level": 5,
                "species": "SPECIES_NIDORAN_M"
              },
              {
                "min_level": 3,
                "max_level": 3,
                "species": "SPECIES_NIDORAN_F"
              },
              {
                "min_level": 4,
                "max_level": 4,
                "species": "SPECIES_NIDORAN_F"
              },
              {
                "min_level": 5,
                "max_level": 5,
                "species": "SPECIES_NIDORAN_F"
              }
            ]
          }
        },
        {
          "map": "MAP_ROUTE23",
          "base_label": "gRoute23",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 32,
                "max_level": 32,
                "species": "SPECIES_FEAROW"
              },
              {
                "min_level": 32,
                "max_level": 32,
                "species": "SPECIES_SANDSLASH"
              },
              {
                "min_level": 33,
                "max_level": 33,
                "species": "SPECIES_FEAROW"
              },
              {
                "min_level": 33,
                "max_level": 33,
                "species": "SPECIES_SANDSLASH"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_FEAROW"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_SANDSLASH"
              },
              {
                "min_level": 32,
                "max_level": 32,
                "species": "SPECIES_NIDORINO"
              },
              {
                "min_level": 33,
                "max_level": 33,
                "species": "SPECIES_NIDORINO"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_NIDORINO"
              },
              {
                "min_level": 32,
                "max_level": 32,
                "species": "SPECIES_NIDORINA"
              },
              {
                "min_level": 33,
                "max_level": 33,
                "species": "SPECIES_NIDORINA"
              },
              {
                "min_level": 34,
                "max_level": 34,
                "species": "SPECIES_NIDORINA"
              }
            ]
          }
        },
        {
          "map": "MAP_ROUTE24",
          "base_label": "gRoute24",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 12,
                "max_level": 12,
                "species": "SPECIES_CATERPIE"
              },
              {
                "min_level": 12,
                "max_level": 12,
                "species": "SPECIES_METAPOD"
              },
              {
                "min_level": 13,
                "max_level": 13,
                "species": "SPECIES_CATERPIE"
              },
              {
                "min_level": 13,
                "max_level": 13,
                "species": "SPECIES_METAPOD"
              },
              {
                "min_level": 14,
                "max_level": 14,
                "species": "SPECIES_CATERPIE"
              },
              {
                "min_level": 14,
                "max_level": 14,
                "species": "SPECIES_METAPOD"
              },
              {
                "min_level": 12,
                "max_level": 12,
                "species": "SPECIES_WEEDLE"
              },
              {
                "min_level": 13,
                "max_level": 13,
                "species": "SPECIES_WEEDLE"
              },
              {
                "min_level": 14,
                "max_level": 14,
                "species": "SPECIES_WEEDLE"
              },
              {
                "min_level": 12,
                "max_level": 12,
                "species": "SPECIES_KAKUNA"
              },
              {
                "min_level": 13,
                "max_level": 13,
                "species": "SPECIES_KAKUNA"
              },
              {
                "min_level": 14,
                "max_level": 14,
                "species": "SPECIES_KAKUNA"
              }
            ]
          }
        },
        {
          "map": "MAP_ROUTE25",
          "base_label": "gRoute25",
          "land_mons": {
            "encounter_rate": 21,
            "mons": [
              {
                "min_level": 12,
                "max_level": 12,
                "species": "SPECIES_CATERPIE"
              },
              {
                "min_level": 12,
                "max_level": 12,
                "species": "SPECIES_METAPOD"
              },
              {
                "min_level": 13,
                "max_level": 13,
                "species": "SPECIES_CATERPIE"
              },
              {
                "min_level": 13,
                "max_level": 13,
                "species": "SPECIES_METAPOD"
              },
              {
                "min_level": 14,
                "max_level": 14,
                "species": "SPECIES_CATERPIE"
              },
              {
                "min_level": 14,
                "max_level": 14,
                "species": "SPECIES_METAPOD"
              },
              {
                "min_level": 12,
                "max_level": 12,
                "species": "SPECIES_WEEDLE"
              },
              {
                "min_level": 13,
                "max_level": 13,
                "species": "SPECIES_WEEDLE"
              },
              {
                "min_level": 14,
                "max_level": 14,
                "species": "SPECIES_WEEDLE"
              },
              {
                "min_level": 12,
                "max_level": 12,
                "species": "SPECIES_KAKUNA"
              },
              {
                "min_level": 13,
                "max_level": 13,
                "species": "SPECIES_KAKUNA"
              },
              {
                "min_level": 14,
                "max_level": 14,
                "species": "SPECIES_KAKUNA"
              }
            ]
          }
        }
"@

# Find the position to insert the Kanto encounters (before the closing bracket of the encounters array)
$insertPosition = $currentContent.LastIndexOf(']')

if ($insertPosition -ne -1) {
    # Insert the Kanto encounters before the closing bracket
    $newContent = $currentContent.Substring(0, $insertPosition) + $kantoEncountersPhase4 + $currentContent.Substring($insertPosition)
    
    # Save the updated content
    $newContent | Out-File -FilePath "src\data\wild_encounters.json" -Encoding UTF8
    
    Write-Host "✅ Successfully added Phase 4 Kanto wild encounters!" -ForegroundColor Green
    Write-Host "Added: Route16, Route17, Route18, Route19, Route20, Route21, Route22, Route23, Route24, Route25" -ForegroundColor Cyan
} else {
    Write-Host "❌ Error: Could not find insertion point in wild_encounters.json" -ForegroundColor Red
}

Write-Host "`n=== PHASE 4 COMPLETE ===" -ForegroundColor Green
