-- Advanced Combat Script Example
-- Demonstrates complex combat logic with multiple systems

-- Configuration
local COMBAT_RANGE = 8.0
local SPELL_ID_FIREBALL = 123
local SPELL_ID_HEAL = 456

-- Combat state
local combat_state = {
    in_combat = false,
    last_target = nil,
    spell_cooldowns = {}
}

-- Advanced target selection
local function select_best_target()
    local enemies = actors_manager.get_enemy_npcs()
    if not enemies or #enemies == 0 then
        return nil
    end

    local player_pos = get_player_position()
    if not player_pos then return nil end

    local best_target = nil
    local best_score = 0

    for _, enemy in ipairs(enemies) do
        if not enemy:is_dead() and not enemy:is_untargetable() then
            local enemy_pos = enemy:get_position()
            if enemy_pos then
                local dist_sq = enemy_pos:squared_dist_to_ignore_z(player_pos)

                if dist_sq <= (COMBAT_RANGE * COMBAT_RANGE) then
                    -- Scoring: prioritize low HP, close enemies
                    local score = 0
                    local max_hp = enemy:get_max_health()
                    if max_hp > 0 then
                        local hp_percent = enemy:get_current_health() / max_hp
                        score = score + (1 - hp_percent) * 50                          -- Low HP bonus
                    end
                    score = score + (1 - dist_sq / (COMBAT_RANGE * COMBAT_RANGE)) * 30 -- Distance bonus

                    if score > best_score then
                        best_score = score
                        best_target = enemy
                    end
                end
            end
        end
    end

    return best_target
end

-- Spell casting with prediction
local function cast_spell_with_prediction(spell_id, target)
    local player = get_local_player()
    if not player or not player:is_spell_ready(spell_id) then
        return false
    end

    local target_pos = target:get_position()
    if not target_pos then return false end

    -- Simple prediction: assume target moves in current direction
    if target:is_moving() then
        local direction = target:get_direction()
        local speed = target:get_current_speed()
        local prediction_time = 0.5 -- 500ms prediction

        target_pos = target_pos + direction * speed * prediction_time
    end

    -- Cast spell
    cast_spell.position(spell_id, target_pos, 0.5)
    combat_state.spell_cooldowns[spell_id] = get_gametime() + 1.0 -- 1 second cooldown
    return true
end

-- Healing logic
local function check_and_heal()
    local player = get_local_player()
    if not player then return end

    local current_hp = player:get_current_health()
    local max_hp = player:get_max_health()

    if max_hp > 0 and (current_hp / max_hp) < 0.4 then -- Below 40% health
        if player:is_spell_ready(SPELL_ID_HEAL) then
            cast_spell.self(SPELL_ID_HEAL, 0.5)
            print("Casting heal")
        end
    end
end

-- Main combat loop
local function combat_loop()
    local target = select_best_target()

    if target then
        combat_state.in_combat = true
        combat_state.last_target = target

        -- Visual feedback
        local target_pos = target:get_position()
        if target_pos then
            graphics.circle_3d(target_pos, 1.5, color_red(200))
        end

        -- Attack logic
        if get_local_player():is_spell_ready(SPELL_ID_FIREBALL) then
            cast_spell_with_prediction(SPELL_ID_FIREBALL, target)
        end
    else
        combat_state.in_combat = false
    end

    -- Always check healing
    check_and_heal()
end

-- Event callbacks
on_update(function()
    combat_loop()
end)

on_render(function()
    -- Draw combat UI
    if combat_state.in_combat then
        graphics.text_3d("IN COMBAT", get_player_position() + vec3.new(0, 2, 0), 1.0, color_red(255))
    end
end)

print("Advanced combat script loaded!")
