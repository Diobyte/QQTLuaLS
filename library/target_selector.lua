---@meta

---@class target_selector
target_selector = {}

---@param obj any
function target_selector.is_valid_enemy(obj) end

---@param source any
---@param dist any
---@return bool
function target_selector.get_pvp_target(source, dist) end

---@param source any
---@param dist any
function target_selector.get_target_closer(source, dist) end

---@param source any
---@param dist any
function target_selector.get_target_low_hp(source, dist) end

---@param source any
---@param dist any
function target_selector.get_target_most_hp(source, dist) end

---@param source any
---@param dist any
---@param radius any
---@param min_hits any
function target_selector.get_target_area_circle(source, dist, radius, min_hits) end

---@param source any
---@param rect_length any
---@param rect_width any
---@param prio_champion any
---@return area_result
function target_selector.get_most_hits_target_rectangle_area_light(source, rect_length, rect_width, prio_champion) end

---@param source any
---@param dist any
---@param radius any
---@param prio_champions any
---@return area_result_light
function target_selector.get_most_hits_target_circular_area_light(source, dist, radius, prio_champions) end

---@param source any
---@param rect_length any
---@param rect_width any
---@return area_result_light
function target_selector.get_most_hits_target_rectangle_area_heavy(source, rect_length, rect_width) end

---@param source any
---@param dist any
---@param radius any
---@return area_result
function target_selector.get_most_hits_target_circular_area_heavy(source, dist, radius) end

---@param source any
---@param max_range any
function target_selector.get_near_target_list(source, max_range) end

---@param source any
---@param max_range any
function target_selector.get_quick_champion(source, max_range) end

---@param source any
---@param target any
---@param width any
function target_selector.is_wall_collision(source, target, width) end

---@param source any
---@param target any
---@param width any
---@return bool
function target_selector.is_unit_collision(source, target, width) end

function area_result() end

function area_result_light() end
