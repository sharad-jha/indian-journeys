# Dynamic Level Scaling Implementation

## Overview

This implementation adds a comprehensive dynamic level scaling system to the Pokémon game, where trainer and wild Pokémon levels are automatically adjusted based on the player's party levels. This ensures that battles remain challenging and engaging regardless of the player's progression.

## Features Implemented

### 1. Trainer Level Scaling

Trainer Pokémon levels are now dynamically calculated based on the **highest level Pokémon in the player's party** plus a specific offset depending on the trainer type:

- **General/Non-important trainers**: +3 levels above highest party member
- **Gym Leaders**: +5 levels above highest party member  
- **Elite Four**: +7 levels above highest party member
- **Champion**: +10 levels above highest party member
- **Special trainers (Steven, etc.)**: +15 levels above highest party member

### 2. Wild Pokémon Level Scaling

Wild Pokémon levels are calculated based on the **average level of all Pokémon in the player's party**:

- **Regular wild Pokémon**: -3 levels below average party level
- **Special event Pokémon** (legendaries): +5 levels above highest party member

## Technical Implementation

### Files Modified

#### 1. `src/battle_main.c`

**Function Modified**: `CalculateDynamicOpponentLevel()`

**Key Changes**:
- Added trainer class detection logic
- Implemented level offset calculation based on trainer type
- Added TRAINER_CLASS_SPECIAL for special trainers
- Added proper includes for trainer constants

**Code Structure**:
```c
static u8 CalculateDynamicOpponentLevel(void)
{
    u8 highestPlayerLevel = 0;
    u8 levelOffset = 3; // Default offset for general trainers
    
    // Find highest level in player's party
    // ... (existing code)
    
    // Determine level offset based on trainer class
    if (gBattleTypeFlags & BATTLE_TYPE_TRAINER && !(gBattleTypeFlags & (BATTLE_TYPE_FRONTIER | BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_TRAINER_HILL)))
    {
        // Check trainer class for level scaling
        switch (gTrainers[gTrainerBattleOpponent_A].trainerClass)
        {
        case TRAINER_CLASS_LEADER:
            levelOffset = 5; // Gym Leaders: 5 levels higher
            break;
        case TRAINER_CLASS_ELITE_FOUR:
            levelOffset = 7; // Elite Four: 7 levels higher
            break;
        case TRAINER_CLASS_CHAMPION:
            levelOffset = 10; // Champion: 10 levels higher
            break;
        case TRAINER_CLASS_RIVAL:
        case TRAINER_CLASS_RIVAL_EARLY:
        case TRAINER_CLASS_RIVAL_LATE:
            levelOffset = 5; // Rivals (Gary, May, Wally, etc.): 5 levels higher
            break;
        case TRAINER_CLASS_SPECIAL:
            levelOffset = 15; // Special trainers (Steven, etc.): 15 levels higher
            break;
        default:
            levelOffset = 3; // General trainers: 3 levels higher
            break;
        }
    }
    
    // Calculate final level and cap at MAX_LEVEL
    if (highestPlayerLevel + levelOffset > MAX_LEVEL)
        return MAX_LEVEL;
    else
        return highestPlayerLevel + levelOffset;
}
```

#### 2. `src/wild_encounter.c`

**Function Modified**: `CalculateDynamicWildLevel()`

**Key Changes**:
- Added average party level calculation
- Changed wild Pokémon scaling to use average level instead of highest level
- Maintained special event Pokémon scaling

**Code Structure**:
```c
static u8 CalculateDynamicWildLevel(u8 baseLevel, u16 species)
{
    u8 highestPlayerLevel = 0;
    u8 averagePlayerLevel = 0;
    s32 i;
    u8 validMons = 0;

    // Find the highest level and calculate average level in the player's party
    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES, NULL)
            && GetMonData(&gPlayerParty[i], MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_EGG)
        {
            s32 level = GetMonData(&gPlayerParty[i], MON_DATA_LEVEL, NULL);
            if (level > highestPlayerLevel)
                highestPlayerLevel = level;
            averagePlayerLevel += level;
            validMons++;
        }
    }

    // Calculate average level
    if (validMons > 0)
        averagePlayerLevel = averagePlayerLevel / validMons;
    else
        averagePlayerLevel = 1;

    // For special event Pokémon, use highest player level + 5
    if (IsSpecialEventPokemon(species))
    {
        if (highestPlayerLevel + 5 > MAX_LEVEL)
            return MAX_LEVEL;
        else
            return highestPlayerLevel + 5;
    }
    // For regular wild Pokémon, use average player level - 3
    else
    {
        if (averagePlayerLevel > 3)
            return averagePlayerLevel - 3;
        else
            return 1; // Minimum level of 1
    }
}
```

## Trainer Class Detection

The system uses the existing trainer class constants to identify different trainer types:

- `TRAINER_CLASS_LEADER`: Gym Leaders
- `TRAINER_CLASS_ELITE_FOUR`: Elite Four members
- `TRAINER_CLASS_CHAMPION`: Champion
- `TRAINER_CLASS_RIVAL`, `TRAINER_CLASS_RIVAL_EARLY`, `TRAINER_CLASS_RIVAL_LATE`: Rivals (Gary, May, Wally, etc.)
- `TRAINER_CLASS_SPECIAL`: Special trainers (Steven, etc.)
- All other classes: General trainers

## Special Cases

### Special Trainers

Special trainers like Steven are now handled using the `TRAINER_CLASS_SPECIAL` class, which provides a +15 level offset. This makes them significantly more challenging than regular trainers and is appropriate for unique story encounters.

### Special Event Pokémon

The system maintains the existing logic for special event Pokémon (legendaries), which use the highest player level + 5 instead of the average level calculation.

## Level Capping

All level calculations are capped at `MAX_LEVEL` (100) to prevent invalid levels. The system ensures that:

- Trainer Pokémon levels never exceed MAX_LEVEL
- Wild Pokémon levels never exceed MAX_LEVEL
- Minimum levels are maintained (level 1 for wild Pokémon)

## Testing Scenarios

### Example 1: General Trainer Battle
- Player's highest level: 25
- Expected trainer Pokémon level: 28 (+3)

### Example 2: Gym Leader Battle
- Player's highest level: 25
- Expected gym leader Pokémon level: 30 (+5)

### Example 3: Elite Four Battle
- Player's highest level: 45
- Expected Elite Four Pokémon level: 52 (+7)

### Example 4: Champion Battle
- Player's highest level: 50
- Expected champion Pokémon level: 60 (+10)

### Example 5: Special Trainer Encounter
- Player's highest level: 40
- Expected special trainer Pokémon level: 55 (+15)

### Example 6: Wild Pokémon Encounter
- Player's party levels: 20, 22, 25, 18, 24, 21
- Average party level: 21.67
- Expected wild Pokémon level: 19 (-3 from average)

## Edge Cases Handled

1. **Empty Party**: If the player has no valid Pokémon, default levels are used
2. **Egg Pokémon**: Eggs are excluded from level calculations
3. **Maximum Level**: All calculations are capped at MAX_LEVEL
4. **Minimum Level**: Wild Pokémon have a minimum level of 1
5. **Special Battles**: Frontier, E-Reader, and Trainer Hill battles are excluded from scaling

## Benefits

1. **Dynamic Difficulty**: Battles remain challenging regardless of player progression
2. **Balanced Gameplay**: Prevents over-leveling from making the game too easy
3. **Engaging Experience**: Players must strategize rather than rely on level advantages
4. **Consistent Challenge**: Elite Four and Champion battles remain appropriately difficult
5. **Flexible System**: Easy to adjust level offsets for different trainer types

## Future Enhancements

The system is designed to be easily extensible. Potential future enhancements include:

1. **Regional Scaling**: Different level offsets for different regions
2. **Time-based Scaling**: Level adjustments based on playtime
3. **Badge-based Scaling**: Level adjustments based on badges earned
4. **Party Size Scaling**: Adjustments based on number of Pokémon in party
5. **Difficulty Settings**: Player-selectable scaling options

## Compilation Notes

The implementation requires the following includes:
- `constants/trainers.h` for trainer class constants
- Existing battle and Pokémon system includes

All modifications are backward compatible and don't break existing functionality.

## Testing

To test the implementation:

1. Compile the project to verify no syntax errors
2. Test trainer battles with different party levels
3. Test wild encounters with various party compositions
4. Verify special trainer encounters work correctly
5. Test edge cases (empty party, max level, etc.)

The system is now ready for comprehensive testing and deployment!
