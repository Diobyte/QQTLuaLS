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
local direction = target_pos - player_pos -- Vector subtraction now supported
local normalized = direction:normalize()
local extended = player_pos:get_extended(target_pos, 5.0)

-- Vec2 operations
local screen_pos = vec2.new(1920, 1080)
local x_coord = screen_pos:x() -- Get x coordinate
local y_coord = screen_pos:y() -- Get y coordinate
local world_pos = screen_pos:screen_to_coordinate()

-- Color usage
local white = color_white(255)
local custom_color = color.new(255, 0, 0, 128) -- Red with transparency

-- Error handling example
local function safe_get_position(obj)
    if obj and obj.is_dead and not obj:is_dead() then
        return obj:get_position()
    end
    return nil
end

-- Advanced spell casting with validation
local function cast_spell_safe(spell_id, target_pos)
    local player = get_local_player()
    if not player then
        print("Error: Player not found")
        return false
    end

    if not player:is_spell_ready(spell_id) then
        print("Spell not ready")
        return false
    end

    -- Cast spell at position (assuming cast_spell is available)
    -- cast_spell(spell_id, target_pos)
    print("Would cast spell " .. spell_id)
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
            -- Skip this enemy
        else
            local enemy_pos = safe_get_position(enemy)
            if enemy_pos then
                local dist_sq = enemy_pos:squared_dist_to_ignore_z(player_pos)
                if dist_sq < 64 then -- 8^2
                    -- Handle close enemy
                    graphics.circle_3d(enemy_pos, 2.0, color_red(255))

                    -- Example: Cast spell at enemy position
                    cast_spell_safe(123, enemy_pos)
                end
            end
        end
    end
end

-- Pathfinding example (commented out as pathfinder may not be defined)
local function move_to_position(target_pos)
    local player_pos = get_player_position()
    if not player_pos then return end

    -- local path = pathfinder.get_path(player_pos, target_pos)
    -- if path and #path > 0 then
    --     -- Move along path
    --     for _, waypoint in ipairs(path) do
    --         -- Movement logic here
    --     end
    -- end
    print("Would move to position")
end

-- Inventory management example
local function use_health_potion_if_needed()
    ---@type game_object
    local player = get_local_player()
    if player then
        local current = player:get_current_health()
        local max = player:get_max_health()
        if max > 0 and (current / max) < 0.3 then -- 30% health
            use_health_potion()
        end
    end
end

-- Main script logic
local function main()
    -- Initialize
    ---@type game_object
    local player = get_local_player()
    if not player then
        print("Player not available")
        return
    end

    -- Process enemies
    process_enemies()

    -- Health management
    use_health_potion_if_needed()

    -- Example movement
    local target = vec3.new(100, 0, 100)
    move_to_position(target)
end

-- Run main function
main()

print("Sample script executed successfully!")
