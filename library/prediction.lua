---@meta

---@see https://github.com/qqtnn/qqt_diablo.wiki.git/wiki/Prediction

---@class prediction

local prediction = {}

---@param target game_object
---@param params prediction_parameters
---@param spell_data spell_data
---@param debug_call boolean
---@return prediction_result
---@description Calculates and returns the prediction result for a spell cast on a target, considering various parameters and debug options.
---@example local result = prediction.get_prediction_result(enemy, params, spell, false)
function prediction.get_prediction_result(target, params, spell_data, debug_call) end

---@param unit game_object
---@param time number
---@return vec3
---@description Predicts the future position of a unit after a specified time, useful for anticipating movement.
---@example local future_pos = prediction.get_future_unit_position(unit, 1.0)
function prediction.get_future_unit_position(unit, time) end

---@param origin vec3
---@param center_position vec3
---@param intersection number
---@return vec3
---@description Calculates the intersection position between an origin and center, useful for collision detection.
---@example local intersect = prediction.get_intersection_position(origin, center, 0.5)
function prediction.get_intersection_position(origin, center_position, intersection) end

---@param target game_object
---@param params prediction_parameters
---@param spell_data spell_data
---@param prediction_result_ptr prediction_result
---@return vec3
---@description Determines the optimal cast position for a spell based on prediction data.
---@example local cast_pos = prediction.get_cast_position(target, params, spell, result)
function prediction.get_cast_position(target, params, spell_data, prediction_result_ptr) end

---@param source vec3
---@param point vec3
---@param speed number
---@param delay number
---@param extra_network_time number
---@param hitbox number
---@param debug_mode boolean
---@return number
---@description Calculates the time it takes for a projectile to hit a point, considering speed, delay, and network time.
---@example local hit_time = prediction.get_hit_time(source, target_point, 1000, 0.2, 0.1, 1.0, false)
function prediction.get_hit_time(source, point, speed, delay, extra_network_time, hitbox, debug_mode) end

---@param radius number
---@param center vec3
---@return table -- collision objects
---@description Retrieves collision objects within a circular area, useful for avoiding obstacles.
---@example local collisions = prediction.get_collisions_circular(5.0, center_pos)
function prediction.get_collisions_circular(radius, center) end

---@param from vec3
---@param to vec3
---@param width number
---@return table
---@description Returns a table of collision points or objects between the from and to positions within the specified width.
---@example local collisions = prediction.get_collisions_rectangular(start_pos, end_pos, 2.0)
function prediction.get_collisions_rectangular(from, to, width) end

---@param from vec3
---@param to vec3
---@param width number
---@return boolean
function prediction.is_wall_collision(from, to, width) end

---@class prediction

local prediction = {}

---@class prediction_parameters
---@field vec3 vec3
---@field float number
local prediction_parameters = {}

---@param vec3 vec3
---@param float number
---@return prediction_parameters
function prediction_parameters.new(vec3, float) end

---@class prediction_result_candidates
local prediction_result_candidates = {}

---@return prediction_result_candidates
function prediction_result_candidates.new() end

---@class prediction_result
---@field candidates prediction_result_candidates
local prediction_result = {}

---@return prediction_result
function prediction_result.new() end
