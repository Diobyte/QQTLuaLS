---@meta

---@class evade
evade = {}

---@param internal_names any
---@param menu_name any
---@param radius any
---@param color any
---@param danger_lvl any
---@param explosion_delay any
---@param is_moving any
---@param set_to_player_pos any
---@param set_to_player_pos_delay any
function evade.register_circular_spell(internal_names, menu_name, radius, color, danger_lvl, explosion_delay, is_moving, set_to_player_pos, set_to_player_pos_delay) end

---@param identifier any
---@param names_v any
---@param width any
---@param length any
---@param color any
---@param is_dynamic any
---@param danger_lvl any
---@param is_projectile any
---@param projectile_speed any
---@param max_time_alive any
---@param set_pos_to_player_on_creation any
---@param set_to_player_pos_delay any
function evade.register_rectangular_spell(identifier, names_v, width, length, color, is_dynamic, danger_lvl, is_projectile, projectile_speed, max_time_alive, set_pos_to_player_on_creation, set_to_player_pos_delay) end

---@param identifier any
---@param names_v any
---@param radius any
---@param angle any
---@param color any
---@param danger_lvl any
---@param explosion_delay any
---@param is_moving any
function evade.register_cone_spell(identifier, names_v, radius, angle, color, danger_lvl, explosion_delay, is_moving) end

---@param pos any
function evade.is_dangerous_position(pos) end

---@param pos any
---@param source_pos any
function evade.is_position_passing_dangerous_zone(pos, source_pos) end

---@param initialize_condition any
---@param dash_name any
---@param spell_id any
---@param range any
---@param cast_delay any
---@param enable_dash_usage_default_value any
---@param enable_dash_for_circular_spells_default_value any
---@param enable_dash_for_rect_spells any
function evade.register_dash(initialize_condition, dash_name, spell_id, range, cast_delay, enable_dash_usage_default_value, enable_dash_for_circular_spells_default_value, enable_dash_for_rect_spells) end
