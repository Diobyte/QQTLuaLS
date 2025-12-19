-- Test script for QQTLuaLS annotations
-- This script verifies that the Lua files can be loaded without syntax errors
-- Run with: lua test_annotations.lua

local function test_file(filepath)
    local chunk, err = loadfile(filepath)
    if not chunk then
        print("ERROR in " .. filepath .. ": " .. err)
        return false
    end
    local success, err = pcall(chunk)
    if not success then
        print("ERROR executing " .. filepath .. ": " .. err)
        return false
    end
    print("OK: " .. filepath)
    return true
end

-- Get all .lua files in the library directory
local library_files = {}

-- Use dir command to get accurate filenames
local handle = io.popen('dir /b library')
if handle then
    for line in handle:lines() do
        if line:match('%.lua$') then
            table.insert(library_files, 'library/' .. line)
        end
    end
    handle:close()
end

if #library_files == 0 then
    -- Fallback: manually list files (update this when new files are added)
    library_files = {
        "library/actors_manager.lua",
        "library/auto" .. string.char(0xE2, 0x80, 0x93) .. "play.lua",
        "library/buff.lua",
        "library/callbacks.lua",
        "library/cast_spell.lua",
        "library/color.lua",
        "library/console.lua",
        "library/enums.lua",
        "library/evade.lua",
        "library/game_object.lua",
        "library/global.lua",
        "library/graphics.lua",
        "library/item_data.lua",
        "library/loot_manager.lua",
        "library/menu_elements.lua",
        "library/orbwalker.lua",
        "library/pathfinder.lua",
        "library/prediction.lua",
        "library/spell_data.lua",
        "library/target_selector.lua",
        "library/utility.lua",
        "library/vec2.lua",
        "library/vec3.lua",
        "library/world.lua"
    }
end

local all_passed = true
for _, file in ipairs(library_files) do
    if not test_file(file) then
        all_passed = false
    end
end

if all_passed then
    print("\nAll annotation files passed syntax check!")
else
    print("\nSome files have errors. Please fix before committing.")
    os.exit(1)
end
