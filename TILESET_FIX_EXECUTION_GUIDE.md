# 🎯 **TILESET FIX EXECUTION GUIDE**

## **📋 OVERVIEW**

This guide provides step-by-step instructions for fixing the tileset assignment issues where Kanto locations are incorrectly using Hoenn tilesets instead of their proper Kanto tilesets.

---

## **🔧 EXECUTION SEQUENCE**

### **STEP 0: COMPREHENSIVE ANALYSIS** ✅ COMPLETED
**Script:** `step0_comprehensive_analysis.bat`

**Purpose:** Analyze the current state and identify all tileset assignment issues

**What it does:**
- Creates detailed reports of all Hoenn tilesets used in Kanto layouts
- Maps the correct Kanto tilesets from original FireRed
- Identifies specific layout issues
- Generates comprehensive analysis summary

**Output:**
- `tileset_analysis/reports/` - All analysis reports
- `tileset_analysis/analysis_summary.txt` - Summary of findings

**Status:** ✅ COMPLETED - Analysis shows extensive Hoenn tileset usage in Kanto layouts

---

### **STEP 1: FIX CERULEAN CITY**
**Script:** `step1_fix_cerulean_city.bat`

**Purpose:** Fix Cerulean City to use `gTileset_CeruleanCity` instead of `gTileset_Petalburg`

**What it does:**
- Creates backup of current layouts.json
- Verifies Cerulean City tileset files exist
- Updates layouts.json to use correct tileset
- Verifies the fix was successful

**Output:**
- `tileset_fixes/backups/layouts_backup_before_cerulean_fix.json`
- `tileset_fixes/logs/cerulean_*_assignment.txt`
- `tileset_fixes/cerulean_city_fix_summary.txt`

---

### **STEP 1 VERIFICATION: CERULEAN CITY**
**Script:** `step1_verify_cerulean_fix.bat`

**Purpose:** Verify that the Cerulean City fix was successful

**What it does:**
- Checks if Cerulean City now uses correct tileset
- Verifies tileset files exist and are not empty
- Counts palette files
- Provides pass/fail verification result

**Output:**
- `tileset_fixes/verification/cerulean_verification_summary.txt`
- Console output with verification results

---

### **STEP 2: FIX VERMILION CITY**
**Script:** `step2_fix_vermilion_city.bat`

**Purpose:** Fix Vermilion City to use `gTileset_VermilionCity` instead of `gTileset_Petalburg`

**What it does:**
- Creates backup of current layouts.json
- Verifies Vermilion City tileset files exist
- Updates layouts.json to use correct tileset
- Verifies the fix was successful

**Output:**
- `tileset_fixes/backups/layouts_backup_before_vermilion_fix.json`
- `tileset_fixes/logs/vermilion_*_assignment.txt`
- `tileset_fixes/vermilion_city_fix_summary.txt`

---

### **STEP 2 VERIFICATION: VERMILION CITY**
**Script:** `step2_verify_vermilion_fix.bat`

**Purpose:** Verify that the Vermilion City fix was successful

**What it does:**
- Checks if Vermilion City now uses correct tileset
- Verifies tileset files exist and are not empty
- Counts palette files
- Provides pass/fail verification result

**Output:**
- `tileset_fixes/verification/vermilion_verification_summary.txt`
- Console output with verification results

---

### **STEP 3: FIX CELADON CITY**
**Script:** `step3_fix_celadon_city.bat`

**Purpose:** Fix Celadon City to use `gTileset_CeladonCity` instead of `gTileset_Petalburg`

**What it does:**
- Creates backup of current layouts.json
- Verifies Celadon City tileset files exist
- Updates layouts.json to use correct tileset
- Verifies the fix was successful

**Output:**
- `tileset_fixes/backups/layouts_backup_before_celadon_fix.json`
- `tileset_fixes/logs/celadon_*_assignment.txt`
- `tileset_fixes/celadon_city_fix_summary.txt`

---

## **📝 EXECUTION INSTRUCTIONS**

### **Phase 1: Analysis (Execute First)** ✅ COMPLETED
1. **Run:** `step0_comprehensive_analysis.bat` ✅ DONE
2. **Review:** `tileset_analysis/analysis_summary.txt` ✅ DONE
3. **Understand:** The scope of the problem ✅ DONE

### **Phase 2: First Fix (Execute Second)**
1. **Run:** `step1_fix_cerulean_city.bat`
2. **Review:** `tileset_fixes/cerulean_city_fix_summary.txt`
3. **Verify:** `step1_verify_cerulean_fix.bat`
4. **Confirm:** All verification checks pass

### **Phase 3: Continue with Next Fixes**
1. **Run:** `step2_fix_vermilion_city.bat`
2. **Verify:** `step2_verify_vermilion_fix.bat`
3. **Run:** `step3_fix_celadon_city.bat`
4. **Verify:** `step3_verify_celadon_fix.bat`
5. **Continue:** With subsequent fix scripts

---

## **⚠️ IMPORTANT NOTES**

### **Before Each Fix:**
- ✅ Ensure you have a clean working directory
- ✅ Make sure no other processes are modifying layouts.json
- ✅ Have the pokefirered-master directory available

### **After Each Fix:**
- ✅ Always run the verification script
- ✅ Check the verification summary
- ✅ Only proceed if verification passes
- ✅ Keep backups for rollback if needed

### **If Verification Fails:**
- ❌ Do NOT proceed to next fix
- ❌ Review the error messages
- ❌ Check if tileset files are missing
- ❌ Contact for assistance before continuing

---

## **📊 ANALYSIS RESULTS SUMMARY**

### **🔍 Key Findings from Step 0:**
1. **✅ Kanto Tilesets Available:** All correct Kanto tilesets are present
2. **❌ Hoenn Tilesets Being Used:** Extensive use of Hoenn tilesets in Kanto layouts:
   - **`gTileset_Petalburg`** - Used 19 times (most problematic)
   - **`gTileset_Rustboro`** - Used 35 times (very problematic)
   - **`gTileset_Slateport`** - Used 6 times
   - **`gTileset_Mauville`** - Used 10 times
   - **`gTileset_Fortree`** - Used 9 times
   - **`gTileset_Lilycove`** - Used 12 times
   - **`gTileset_Mossdeep`** - Used 8 times
   - **`gTileset_Sootopolis`** - Used 3 times
   - **`gTileset_EverGrande`** - Used 2 times
   - **`gTileset_Pacifidlog`** - Used 20 times

### **🎯 Priority Fixes Needed:**
- **Cerulean City** (using `gTileset_Petalburg` → should use `gTileset_CeruleanCity`)
- **Vermilion City** (using `gTileset_Petalburg` → should use `gTileset_VermilionCity`)
- **Celadon City** (using `gTileset_Petalburg` → should use `gTileset_CeladonCity`)
- **Fuchsia City** (using `gTileset_Petalburg` → should use `gTileset_FuchsiaCity`)
- **Saffron City** (using `gTileset_Petalburg` → should use `gTileset_SaffronCity`)
- **Lavender Town** (using `gTileset_Petalburg` → should use `gTileset_LavenderTown`)
- **Cinnabar Island** (using `gTileset_Petalburg` → should use `gTileset_CinnabarIsland`)
- **Viridian City** (using `gTileset_Petalburg` → should use `gTileset_ViridianCity`)
- **Pallet Town** (using `gTileset_Petalburg` → should use `gTileset_PalletTown`)
- **Routes** (using `gTileset_Rustboro` → should use appropriate Kanto tilesets)

---

## **🔄 ROLLBACK PROCEDURE**

If any fix causes issues:

1. **Stop execution immediately**
2. **Restore from backup:** Copy the backup file back to `data/layouts/layouts.json`
3. **Verify restoration:** Check that the file is restored correctly
4. **Contact for assistance:** Before attempting the fix again

---

## **📞 SUPPORT**

If you encounter any issues:

1. **Check the logs:** Review all generated log files
2. **Verify file paths:** Ensure all directories exist
3. **Check permissions:** Make sure you have write access
4. **Share output:** Provide the console output and log files

---

## **🎯 NEXT STEPS**

After completing the current scripts:

1. **Wait for next script:** Additional fix scripts will be provided
2. **Follow the same pattern:** Execute → Verify → Proceed
3. **Complete all fixes:** Until all Kanto locations are corrected
4. **Final verification:** Comprehensive test of all fixes

---

## **📋 CURRENT STATUS**

- ✅ **Step 0 Analysis:** COMPLETED
- ⏳ **Step 1 Cerulean City:** READY TO EXECUTE
- ⏳ **Step 2 Vermilion City:** READY TO EXECUTE  
- ⏳ **Step 3 Celadon City:** READY TO EXECUTE
- 🔄 **Next Steps:** Additional city fixes will be created

---

**Ready to begin? Start with `step1_fix_cerulean_city.bat`**
