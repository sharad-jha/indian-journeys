# 🎨 **COMPREHENSIVE GUIDE: Graphics, Palettes, and Tilesets in ROM Hacking**

## **🎯 FUNDAMENTAL CONCEPTS**

### **1. 🖼️ Graphics Pipeline Overview**

```
PNG Image → 4BPP Conversion → LZ77 Compression → ROM Storage → Runtime Decompression → Display
```

**Step-by-Step Process:**
1. **Source Image**: PNG file with pixel art graphics
2. **4BPP Conversion**: Convert to 4-bit per pixel format (16 colors max per tile)
3. **LZ77 Compression**: Compress to save ROM space
4. **ROM Storage**: Store as binary data in the ROM
5. **Runtime**: Decompress and display during gameplay

---

## **🎨 2. PALETTE SYSTEM**

### **Color Depth & Limitations**
- **4BPP (4-bit per pixel)**: 16 colors per tile
- **8BPP (8-bit per pixel)**: 256 colors per tile (rare in GBA Pokémon games)
- **GBA Hardware**: Limited to 4BPP for most graphics

### **Palette Structure**
```
Palette File (.pal):
- 16 color entries per palette
- Each color = 16-bit RGB value (5-5-5 format)
- Format: RRRRRGGGGGGBBBBB (5 bits each for R,G,B)

Example:
00.pal - Building colors (browns, grays)
01.pal - Nature colors (greens, blues)  
02.pal - Water colors (blues, cyans)
...etc
```

### **Palette Assignment**
- **Primary Tileset**: Usually `gTileset_General` (shared across maps)
- **Secondary Tileset**: Map-specific (like `gTileset_PewterCity`)
- **Each tile** can use different palettes for different color schemes

---

## **🧩 3. TILESET SYSTEM**

### **Tileset Components**

```
Tileset Structure:
├── tiles.png (or tiles.4bpp.lz)
├── metatiles.bin
├── metatile_attributes.bin
└── palettes/
    ├── 00.pal
    ├── 01.pal
    ├── 02.pal
    └── ... (up to 15.pal)
```

### **File Types Explained**

#### **A. Tiles (tiles.png / tiles.4bpp.lz)**
- **tiles.png**: Raw pixel art (8x8 pixel tiles)
- **tiles.4bpp.lz**: Compressed 4-bit format
- **Purpose**: Individual tile graphics (grass, walls, doors, etc.)

#### **B. Metatiles (metatiles.bin)**
- **Format**: 16-bit values defining tile combinations
- **Purpose**: Groups 4 tiles (2x2) into larger "metatiles"
- **Example**: A house wall might be 4 tiles combined

#### **C. Metatile Attributes (metatile_attributes.bin)**
- **Format**: 32-bit values with behavior flags
- **Flags Include**:
  - Collision (can player walk through?)
  - Animation (does tile animate?)
  - Behavior (door, water, etc.)

---

## **🏗️ 4. TILESET INTEGRATION SYSTEM**

### **Header Files Structure**

```c
// src/data/tilesets/headers.h
const struct Tileset gTileset_PewterCity = {
    .isCompressed = TRUE,           // Uses LZ77 compression
    .isSecondary = TRUE,            // Secondary tileset (map-specific)
    .tiles = gTilesetTiles_PewterCity,        // Pointer to tile graphics
    .palettes = gTilesetPalettes_PewterCity,  // Pointer to palettes
    .metatiles = gMetatiles_PewterCity,       // Pointer to metatiles
    .metatileAttributes = gMetatileAttributes_PewterCity, // Pointer to attributes
    .callback = NULL,               // Animation callback (if any)
};
```

### **Graphics Definition**
```c
// src/data/tilesets/graphics.h
const u32 gTilesetTiles_PewterCity[] = INCBIN_U32("data/tilesets/secondary/pewter_city/tiles.4bpp.lz");
const u16 gTilesetPalettes_PewterCity[][16] = {
    INCBIN_U16("data/tilesets/secondary/pewter_city/palettes/00.pal"),
    INCBIN_U16("data/tilesets/secondary/pewter_city/palettes/01.pal"),
    // ... more palettes
};
```

### **Metatiles Definition**
```c
// src/data/tilesets/metatiles.h
const u16 gMetatiles_PewterCity[] = INCBIN_U16("data/tilesets/secondary/pewter_city/metatiles.bin");
const u32 gMetatileAttributes_PewterCity[] = INCBIN_U32("data/tilesets/secondary/pewter_city/metatile_attributes.bin");
```

---

## **🗺️ 5. MAP LAYOUT SYSTEM**

### **Layout Configuration**
```json
// data/layouts/layouts.json
{
  "id": "LAYOUT_PEWTER_CITY",
  "name": "PewterCity_Layout",
  "width": 32,
  "height": 24,
  "primary_tileset": "gTileset_General",      // Shared tileset
  "secondary_tileset": "gTileset_PewterCity", // Map-specific tileset
  "border_filepath": "data/layouts/PewterCity/border.bin",
  "blockdata_filepath": "data/layouts/PewterCity/map.bin"
}
```

### **Map Data Files**
- **border.bin**: Map border tiles
- **map.bin**: Actual map layout using metatile IDs

---

## **🔧 6. COMMON ISSUES & SOLUTIONS**

### **Issue 1: "Unknown secondary tileset label"**
**Causes:**
- Tileset not defined in headers.h
- Missing graphics/metatiles definitions
- Compilation errors in tileset files

**Solutions:**
1. Check if `gTileset_PewterCity` exists in `src/data/tilesets/headers.h`
2. Verify all required definitions exist:
   - `gTilesetTiles_PewterCity` in graphics.h
   - `gTilesetPalettes_PewterCity` in graphics.h
   - `gMetatiles_PewterCity` in metatiles.h
   - `gMetatileAttributes_PewterCity` in metatiles.h
3. Rebuild project: `make clean && make`

### **Issue 2: Magenta/Pink blocks**
**Causes:**
- Tileset mismatch (using wrong tileset)
- Missing tile graphics
- Palette corruption

**Solutions:**
1. Check layout configuration uses correct tileset
2. Verify tiles.png or tiles.4bpp.lz exists
3. Check palette files are present and valid

### **Issue 3: Wrong colors**
**Causes:**
- Incorrect palette assignment
- Missing palette files
- Palette corruption

**Solutions:**
1. Check all 16 palette files exist (00.pal through 15.pal)
2. Verify palette format is correct (16-bit RGB values)
3. Check palette assignment in graphics.h

---

## **🔍 7. DEBUGGING WORKFLOW**

### **Step 1: Verify File Structure**
```bash
# Check if all required files exist
ls data/tilesets/secondary/pewter_city/
# Should show: tiles.png, metatiles.bin, metatile_attributes.bin, palettes/

ls data/tilesets/secondary/pewter_city/palettes/
# Should show: 00.pal, 01.pal, 02.pal, ... 15.pal
```

### **Step 2: Check Header Definitions**
```bash
# Search for tileset definitions
grep "gTileset_PewterCity" src/data/tilesets/headers.h
grep "gTilesetTiles_PewterCity" src/data/tilesets/graphics.h
grep "gMetatiles_PewterCity" src/data/tilesets/metatiles.h
```

### **Step 3: Verify Layout Configuration**
```bash
# Check layout uses correct tileset
grep "LAYOUT_PEWTER_CITY" data/layouts/layouts.json
```

### **Step 4: Build and Test**
```bash
make clean
make
# Check for compilation errors
```

---

## **📋 8. BEST PRACTICES**

### **File Organization**
```
data/tilesets/secondary/[city_name]/
├── tiles.png              # Source graphics
├── tiles.4bpp.lz          # Compressed version (if using)
├── metatiles.bin          # Tile combinations
├── metatile_attributes.bin # Behavior flags
└── palettes/              # Color schemes
    ├── 00.pal
    ├── 01.pal
    └── ...
```

### **Naming Conventions**
- **Tileset**: `gTileset_[CityName]`
- **Graphics**: `gTilesetTiles_[CityName]`
- **Palettes**: `gTilesetPalettes_[CityName]`
- **Metatiles**: `gMetatiles_[CityName]`
- **Attributes**: `gMetatileAttributes_[CityName]`

### **Compilation Process**
1. **PNG → 4BPP**: Convert graphics to 4-bit format
2. **LZ77 Compression**: Compress to save space
3. **Header Generation**: Create C definitions
4. **Linking**: Connect tileset to layout system

---

## **🎯 9. SPECIFIC ISSUE ANALYSIS**

### **"Unknown secondary tileset label 'gTileset_PewterCity'" Error**

**Root Causes:**
1. **Missing Definition**: `gTileset_PewterCity` not properly defined in headers.h
2. **Compilation Error**: Build failed due to missing files or syntax errors
3. **Missing Files**: Required tileset files not present

**Quick Fix Steps:**
1. Run the compressed tiles fix script
2. Check for syntax errors in headers.h (broken `gTileset_Petalburg` definition)
3. Rebuild the project
4. Verify all files are present and properly linked

---

## **📚 10. ADDITIONAL RESOURCES**

### **File Formats**
- **.pal**: 16-bit RGB palette files
- **.bin**: Binary data files (metatiles, attributes)
- **.4bpp.lz**: LZ77 compressed 4-bit graphics
- **.png**: Source graphics (needs conversion)

### **Tools**
- **Porymap**: Map editor with tileset support
- **GIMP/Photoshop**: Graphics editing
- **Compression tools**: Convert PNG to 4BPP format
- **Hex editors**: Debug binary files

### **Key Commands**
```bash
# Search for tileset definitions
grep -r "gTileset_PewterCity" src/

# Check file existence
ls -la data/tilesets/secondary/pewter_city/

# Build project
make clean && make

# Check compilation errors
make 2>&1 | grep -i error
```

---

## **💡 11. TROUBLESHOOTING CHECKLIST**

### **Before Reporting Issues:**
- [ ] All required files exist in tileset directory
- [ ] Header definitions are properly formatted
- [ ] Layout configuration points to correct tileset
- [ ] Project builds without errors
- [ ] Palette files are valid (16 colors each)
- [ ] Metatile files are present and not corrupted

### **Common Syntax Errors:**
- Missing semicolons in C definitions
- Incorrect file paths in INCBIN statements
- Mismatched braces in struct definitions
- Wrong tileset names in layout configuration

---

## **🎮 12. PRACTICAL EXAMPLES**

### **Adding a New City Tileset**
1. **Create directory**: `data/tilesets/secondary/new_city/`
2. **Add files**: tiles.png, metatiles.bin, metatile_attributes.bin, palettes/
3. **Update headers.h**: Add `gTileset_NewCity` definition
4. **Update graphics.h**: Add `gTilesetTiles_NewCity` and `gTilesetPalettes_NewCity`
5. **Update metatiles.h**: Add `gMetatiles_NewCity` and `gMetatileAttributes_NewCity`
6. **Update layouts.json**: Configure layout to use new tileset
7. **Rebuild**: `make clean && make`

### **Fixing Broken Tileset**
1. **Identify issue**: Check error messages and file structure
2. **Verify definitions**: Ensure all C definitions exist
3. **Check files**: Confirm all required files are present
4. **Fix syntax**: Correct any C syntax errors
5. **Rebuild**: Clean build to ensure changes take effect
6. **Test**: Load in Porymap to verify fix

---

*This guide should help you understand and fix tileset issues independently! 🎨*



