---@meta

---@class utility
utility = {}

---@param spell_id any
---@return boolean
function utility.is_spell_ready(spell_id) end

---@param spell_id any
---@return boolean
function utility.is_spell_affordable(spell_id) end

---@param spell_id any
---@return boolean
function utility.can_cast_spell(spell_id) end

---@param center any
---@param radius any
---@return boolean
function utility.get_units_inside_circle_list(center, radius) end

---@param origin any
---@param destination any
---@param width any
function utility.get_units_inside_rectangle_list(origin, destination, width) end

---@param center any
---@param radius any
function utility.get_amount_of_units_inside_circle(center, radius) end

---@param origin any
---@param destination any
---@param width any
function utility.get_amount_of_units_inside_rectangle(origin, destination, width) end

---@param point any
function utility.set_map_pin(point) end

---@param point any
---@return boolean
function utility.is_point_walkeable(point) end

---@param point any
---@return boolean
function utility.is_point_walkeable_exception(point) end

---@param point any
---@return boolean
function utility.is_point_walkeable_heavy(point) end

---@param origin any
---@param destination any
---@param width any
---@param steps_distance any
function utility.is_ray_cast_walkeable(origin, destination, width, steps_distance) end

---@param origin any
---@param destination any
---@param width any
---@param steps_distance any
function utility.get_raycast_table(origin, destination, width, steps_distance) end

---@param point any
function utility.set_height_of_valid_position(point) end

---@param point any
function utility.set_map_pin(point) end

---@return boolean
function utility.toggle_mount() end

---@param level_address any
---@return boolean
function utility.open_pit_portal(level_address) end

---@return boolean
function utility.summon_boss() end

---@return boolean
function utility.summon_boss_next_recipe() end

---@return boolean
function utility.summon_boss_previous_recipe() end

---@return boolean
function utility.confirm_sigil_notification() end
