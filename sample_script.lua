-- Sample script demonstrating QQTLuaLS API usage
-- This file shows how to use the annotated API with proper IntelliSense

-- Get player information
local player = get_local_player()
local player_pos = get_player_position()
local player_name = get_local_player_name()

-- Find nearby enemies
local enemies = actors_manager.get_enemy_npcs()
for _, enemy in ipairs(enemies) do
    local enemy_pos = enemy:get_position()
    local distance_sq = enemy_pos:squared_dist_to_ignore_z(player_pos)

    -- Check if enemy is within 8 units
    if distance_sq <= (8.0 * 8.0) then
        -- Draw a circle around close enemies
        graphics.circle_3d(enemy_pos, 2.0, color_red(255))

        -- Check if enemy is moving towards us
        if enemy:is_moving() then
            local direction = enemy:get_direction()
            -- Additional logic here
        end
    end
end

-- Example spell usage
local spell = spell_data:new(5.0, 10.0, 0.5, 500, true, 123, spell_geometry.circular, targeting_type.skillshot)
if player:is_spell_ready(spell.spell_id) then
    -- Cast spell logic
end

-- Vector operations
local target_pos = vec3.new(100, 0, 100)
local direction = target_pos - player_pos -- Assuming vec3 supports subtraction
local normalized = direction:normalize()
local extended = player_pos:get_extended(target_pos, 5.0)

-- Color usage
local white = color_white(255)
local custom_color = color.new(255, 0, 0, 128) -- Red with transparency

-- Error handling example
local function safe_get_position(obj)
    if obj and not obj:is_dead() then
        return obj:get_position()
    end
    return nil
end

-- Advanced error handling with spell casting
local function cast_spell_safe(spell_id)
    local player = get_local_player()
    if not player then
        print("Error: Player not found")
        return false
    end

    if not player:is_spell_ready(spell_id) then
        print("Spell not ready")
        return false
    end

    if not player:has_enough_resources_for_spell(spell_id) then
        print("Not enough resources")
        return false
    end

    -- Cast spell logic here
    return true
end

-- Safe enemy processing with multiple checks
local function process_enemies()
    local enemies = actors_manager.get_enemy_npcs()
    if not enemies or #enemies == 0 then
        return
    end

    local player_pos = get_player_position()
    if not player_pos then
        print("Error: Cannot get player position")
        return
    end

    for _, enemy in ipairs(enemies) do
        if enemy:is_dead() or enemy:is_untargetable() then
            goto continue
        end

        local enemy_pos = safe_get_position(enemy)
        if not enemy_pos then
            goto continue
        end

        local dist_sq = enemy_pos:squared_dist_to_ignore_z(player_pos)
        if dist_sq < 64 then -- 8^2
            -- Handle close enemy
            graphics.circle_3d(enemy_pos, 2.0, color_red(255))
        end

        ::continue::
    end
end

print("Sample script executed successfully!")
