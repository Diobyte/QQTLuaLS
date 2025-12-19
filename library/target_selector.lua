---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Target-Selector
---@class area_result
---@class area_result_light
---@class target_selector

local target_selector = {}

---@param obj game_object
---@return boolean
---@description Determines if the provided game object is a valid enemy target.
---@example local result = target_selector.is_valid_enemy(obj)()
---@since 1.0.0
function target_selector.is_valid_enemy(obj) end

---@param source vec3
---@param dist number
---@return game_object
---@description Retrieves the most suitable target for PvP within the specified distance from the source.
---@return any
---@description TODO: Add description for target_selector.get_pvp_target(source, dist)
---@example local result = target_selector.get_pvp_target(source, dist)()
---@since 1.0.0
function target_selector.get_pvp_target(source, dist) end

---@param source vec3
---@param dist number
---@return game_object
---@description Finds the nearest target within the given distance from the source.
---@example local result = target_selector.get_target_closer(source, dist)()
---@since 1.0.0
function target_selector.get_target_closer(source, dist) end

---@param source vec3
---@param dist number
---@return game_object
---@description Selects the target within range that has the lowest health.
---@return any
---@description TODO: Add description for target_selector.get_target_low_hp(source, dist)
---@example local result = target_selector.get_target_low_hp(source, dist)()
---@since 1.0.0
function target_selector.get_target_low_hp(source, dist) end

---@param source vec3
---@param dist number
---@return game_object
---@description Chooses the target within range that has the highest health.
---@return any
---@description TODO: Add description for target_selector.get_target_most_hp(source, dist)
---@example local result = target_selector.get_target_most_hp(source, dist)()
---@since 1.0.0
function target_selector.get_target_most_hp(source, dist) end

---@param source vec3
---@param dist number
---@param radius number
---@param min_hits number
---@return area_result object
---@description Identifies the optimal target within a specified circular area, based on the minimum hits criteria.
---@example local result = target_selector.get_target_area_circle(source, dist, radius, min_hits)()
---@since 1.0.0
function target_selector.get_target_area_circle(source, dist, radius, min_hits) end

---@param source vec3
---@param rect_length number
---@param rect_width number
---@param prio_champion boolean
---@return area_result_light object
---@description Finds the target in a rectangular area that maximizes the hit count, with an option to prioritize champions.
---@return any
---@description TODO: Add description for target_selector.get_most_hits_target_rectangle_area_light(source, rect_length, rect_width, prio_champion)
---@example local result = target_selector.get_most_hits_target_rectangle_area_light(source, rect_length, rect_width, prio_champion)()
---@since 1.0.0
function target_selector.get_most_hits_target_rectangle_area_light(source, rect_length, rect_width, prio_champion) end

---@param source vec3
---@param dist number
---@param radius number
---@param prio_champions boolean
---@return area_result_light object
---@description Selects the target in a circular area that maximizes hit count, with an option to prioritize champions.
---@return any
---@description TODO: Add description for target_selector.get_most_hits_target_circular_area_light(source, dist, radius, prio_champions)
---@example local result = target_selector.get_most_hits_target_circular_area_light(source, dist, radius, prio_champions)()
---@since 1.0.0
function target_selector.get_most_hits_target_circular_area_light(source, dist, radius, prio_champions) end

---@param source vec3
---@param rect_length number
---@param rect_width number
---@return area_result object
---@description Identifies the best target in a rectangular area based on the maximum number of hits possible.
---@example local result = target_selector.get_most_hits_target_rectangle_area_heavy(source, rect_length, rect_width)()
---@since 1.0.0
function target_selector.get_most_hits_target_rectangle_area_heavy(source, rect_length, rect_width) end

---@param source vec3
---@param dist number
---@param radius number
---@return area_result object
---@description Determines the optimal target in a circular area based on the maximum number of hits possible.
---@return any
---@description TODO: Add description for target_selector.get_most_hits_target_circular_area_heavy(source, dist, radius)
---@example local result = target_selector.get_most_hits_target_circular_area_heavy(source, dist, radius)()
---@since 1.0.0
function target_selector.get_most_hits_target_circular_area_heavy(source, dist, radius) end

---@param source vec3
---@param max_range number
---@return game_object[]
---@description Retrieves a list of all potential targets within the specified range from the source.
---@return any
---@description TODO: Add description for target_selector.get_near_target_list(source, max_range)
---@example local result = target_selector.get_near_target_list(source, max_range)()
---@since 1.0.0
function target_selector.get_near_target_list(source, max_range) end

---@param source vec3
---@param max_range number
---@return game_object
---@description Locates the nearest enemy champion within the given range from the source.
---@return any
---@description TODO: Add description for target_selector.get_quick_champion(source, max_range)
---@example local result = target_selector.get_quick_champion(source, max_range)()
---@since 1.0.0
function target_selector.get_quick_champion(source, max_range) end

---@param source vec3
---@param target game_object
---@param width number
---@return boolean
---@description Determines if there is a wall collision between the source position and the target along a specified path width.
---@return any
---@description TODO: Add description for target_selector.is_wall_collision(source, target, width)
---@example local result = target_selector.is_wall_collision(source, target, width)()
---@since 1.0.0
function target_selector.is_wall_collision(source, target, width) end

---@param source vec3
---@param target game_object
---@param width number
---@return boolean
---@description Determines if there is any unit collision between the source position and the target along a specified path width.
---@return any
---@description TODO: Add description for target_selector.is_unit_collision(source, target, width)
---@example local result = target_selector.is_unit_collision(source, target, width)()
---@since 1.0.0
function target_selector.is_unit_collision(source, target, width) end

---@return area_result
---@return any
---@description TODO: Add description for area_result()
---@example local result = area_result()()
---@since 1.0.0
function area_result() end

---@return area_result_light
---@return any
---@description TODO: Add description for area_result_light()
---@example local result = area_result_light()()
---@since 1.0.0
function area_result_light() end
