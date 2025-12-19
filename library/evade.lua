---@meta

---@see https://github.com/qqtnn/qqt_diablo.wiki.git/wiki/Evade

---@class evade
---@class evade.danger_levels
---@field low any
---@field medium any
---@field high any
local danger_levels = {}
local evade = {}

---@param internal_names string[]
---@param menu_name string
---@param radius number
---@param color color
---@param danger_lvl evade.danger_levels
---@param explosion_delay number
---@param is_moving boolean
---@param set_to_player_pos boolean
---@param set_to_player_pos_delay number
---@return nil
---@description Registers a circular spell for evasion, defining its area, behavior, and danger level.
---@example evade.register_circular_spell({"fireball"}, "Fire Ball", 5.0, color_red(255), evade.danger_levels.high, 1.0, true, false, 0.5)
function evade.register_circular_spell(internal_names, menu_name, radius, color, danger_lvl, explosion_delay, is_moving,
                                       set_to_player_pos, set_to_player_pos_delay)
end

---@param identifier string
---@param names_v string[]
---@param width number
---@param length number
---@param color color
---@param is_dynamic boolean
---@param danger_lvl evade.danger_levels
---@param is_projectile boolean
---@param projectile_speed number
---@param max_time_alive number
---@param set_pos_to_player_on_creation boolean
---@param set_to_player_pos_delay number
---@return nil
---@description Registers a rectangular spell for evasion with projectile tracking and dynamic positioning.
---@example evade.register_rectangular_spell("lightning", {"chain_lightning"}, 2.0, 10.0, color_blue(255), true, evade.danger_levels.medium, true, 500, 3.0, false, 0.2)
function evade.register_rectangular_spell(identifier, names_v, width, length, color, is_dynamic, danger_lvl,
                                          is_projectile, projectile_speed, max_time_alive, set_pos_to_player_on_creation,
                                          set_to_player_pos_delay)
end

---@param identifier string
---@param names_v string[]
---@param radius number
---@param angle number
---@param color color
---@param danger_lvl evade.danger_levels
---@param explosion_delay number
---@param is_moving boolean
---@return nil
---@description Registers a cone-shaped spell for evasion, useful for area-of-effect abilities.
---@example evade.register_cone_spell("frost_nova", {"frost_nova"}, 8.0, 120, color_cyan(255), evade.danger_levels.low, 0.5, false)
function evade.register_cone_spell(identifier, names_v, radius, angle, color, danger_lvl, explosion_delay, is_moving) end

---@param pos vec3
---@return boolean
---@description Analyzes if a given position lies within a dangerous spell zone, which is crucial for character movement decisions.
---@example if evade.is_dangerous_position(my_position) then move_away() end
function evade.is_dangerous_position(pos) end

---@param pos vec3
---@param source_pos vec3
---@return boolean
---@description Checks if the path between two points intersects with any dangerous spell zones, aiding in pathfinding and movement strategies.
function evade.is_position_passing_dangerous_zone(pos, source_pos) end

---@param initialize_condition boolean
---@param dash_name string
---@param spell_id number
---@param range number
---@param cast_delay number
---@param enable_dash_usage_default_value boolean
---@param enable_dash_for_circular_spells_default_value boolean
---@param enable_dash_for_rect_spells boolean
---@return boolean
---@description Registers a dash ability with specified parameters, adding it to the evade system for usage in character movement and avoidance.
---@example local success = evade.register_dash(condition, "my_dash", 123, 10.0, 0.5, true, false, true)
function evade.register_dash(initialize_condition, dash_name, spell_id, range, cast_delay,
                             enable_dash_usage_default_value, enable_dash_for_circular_spells_default_value,
                             enable_dash_for_rect_spells)
    return true
end
