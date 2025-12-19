---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Target-Selector

---@class area_result
---@field main_target game_object
---@field victim_list game_object[]
---@field n_hits number
---@field score number

---@class area_result_light
---@field main_target game_object
---@field n_hits number
---@field score number

---@class target_selector
local target_selector = {}

---@param obj game_object
---@return boolean
---@description Determines if the provided game object is a valid enemy target.
function target_selector.is_valid_enemy(obj) end

---@param source vec3
---@param dist number
---@return game_object
---@description Retrieves the most suitable target for PvP within the specified distance from the source.
function target_selector.get_pvp_target(source, dist) end

---@param source vec3
---@param dist number
---@return game_object
---@description Finds the nearest target within the given distance from the source.
function target_selector.get_target_closer(source, dist) end

---@param source vec3
---@param dist number
---@return game_object
---@description Selects the target within range that has the lowest health.
function target_selector.get_target_low_hp(source, dist) end

---@param source vec3
---@param dist number
---@return game_object
---@description Chooses the target within range that has the highest health.
function target_selector.get_target_most_hp(source, dist) end

---@param source vec3
---@param dist number
---@param radius number
---@param min_hits number
---@return area_result
---@description Identifies the optimal target within a specified circular area based on minimum hits.
function target_selector.get_target_area_circle(source, dist, radius, min_hits) end

---@param source vec3
---@param rect_length number
---@param rect_width number
---@param prio_champion boolean
---@return area_result_light
---@description Finds the target in a rectangular area that maximizes hit count, optionally prioritizing champions.
function target_selector.get_most_hits_target_rectangle_area_light(source, rect_length, rect_width, prio_champion) end

---@param source vec3
---@param dist number
---@param radius number
---@param prio_champions boolean
---@return area_result_light
---@description Selects the target in a circular area that maximizes hit count, optionally prioritizing champions.
function target_selector.get_most_hits_target_circular_area_light(source, dist, radius, prio_champions) end

---@param source vec3
---@param rect_length number
---@param rect_width number
---@return area_result
---@description Identifies the best target in a rectangular area based on maximum hits.
function target_selector.get_most_hits_target_rectangle_area_heavy(source, rect_length, rect_width) end

---@param source vec3
---@param dist number
---@param radius number
---@return area_result
---@description Determines the optimal target in a circular area based on maximum hits.
function target_selector.get_most_hits_target_circular_area_heavy(source, dist, radius) end

---@param source vec3
---@param max_range number
---@return game_object[]
---@description Retrieves a list of all potential targets within the specified range from the source.
function target_selector.get_near_target_list(source, max_range) end

---@param source vec3
---@param max_range number
---@return game_object
---@description Locates the nearest enemy champion within the given range from the source.
function target_selector.get_quick_champion(source, max_range) end

---@param source vec3
---@param target game_object
---@param width number
---@return boolean
---@description Determines if there is a wall collision between the source position and the target along a specified path width.
function target_selector.is_wall_collision(source, target, width) end

---@param source vec3
---@param target game_object
---@param width number
---@return boolean
---@description Determines if there is any unit collision between the source position and the target along a specified path width.
function target_selector.is_unit_collision(source, target, width) end

---@return area_result
---@description Constructor placeholder for area_result.
function area_result() end

---@return area_result_light
---@description Constructor placeholder for area_result_light.
function area_result_light() end

return target_selector
