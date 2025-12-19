---@meta

---@see https://github.com/qqtnn/qqt_diablo.wiki/blob/main/Prediction.md

---@class prediction
local prediction = {}

---@param target game_object
---@param params prediction_parameters
---@param spell spell_data
---@param debug_call boolean
---@return prediction_result
---@description Computes a prediction result for casting a spell on a target.
---@since 1.0.0
---@example local pr = prediction.get_prediction_result(target, params, spell, false)
function prediction.get_prediction_result(target, params, spell, debug_call) end

---@param unit game_object
---@param time number
---@return vec3
---@description Predicts a unit position after the given time.
---@since 1.0.0
function prediction.get_future_unit_position(unit, time) end

---@param origin vec3
---@param center_position vec3
---@param intersection number
---@return vec3
---@description Computes an intersection point used for collision checks.
---@since 1.0.0
function prediction.get_intersection_position(origin, center_position, intersection) end

---@param target game_object
---@param params prediction_parameters
---@param spell spell_data
---@param result prediction_result
---@return vec3
---@description Finds the optimal cast position using prediction results.
---@since 1.0.0
function prediction.get_cast_position(target, params, spell, result) end

---@param source vec3
---@param point vec3
---@param speed number
---@param delay number
---@param extra_network_time number
---@param hitbox number
---@param debug_mode boolean
---@return number
---@description Calculates travel time to a point for a projectile.
---@since 1.0.0
function prediction.get_hit_time(source, point, speed, delay, extra_network_time, hitbox, debug_mode) end

---@param radius number
---@param center vec3
---@return vec3[]
---@description Retrieves collision points within a circle.
---@since 1.0.0
function prediction.get_collisions_circular(radius, center) end

---@param from vec3
---@param to vec3
---@param width number
---@return vec3[]
---@description Retrieves collision points along a rectangle between two points.
---@since 1.0.0
function prediction.get_collisions_rectangular(from, to, width) end

---@param from vec3
---@param to vec3
---@param width number
---@return boolean
---@description Checks wall collision between two points with a given width.
---@since 1.0.0
function prediction.is_wall_collision(from, to, width) end

---@class prediction_parameters
---@field position vec3
---@field speed number
---@field cast_origin vec3
---@field intersection number
local prediction_parameters = {}

---@param position vec3
---@param speed number
---@param cast_origin vec3|nil
---@param intersection number|nil
---@return prediction_parameters
---@description Creates prediction parameters for a spell/target pair. Optional `cast_origin` and `intersection` mirror wiki fields when provided.
---@since 1.0.0
function prediction.prediction_parameters_new(position, speed, cast_origin, intersection) end

---@class prediction_result_candidates
---@field center_position vec3
---@field intersection_position vec3
---@field max_intersection_position vec3
local prediction_result_candidates = {}

---@return prediction_result_candidates
---@description Creates a container for candidate prediction results.
---@since 1.0.0
function prediction.prediction_result_candidates_new() end

---@class prediction_result
---@field hitchance number
---@field cast_position vec3
---@field time_to_hit number
---@field candidates prediction_result_candidates
---@field center_position? vec3 # Convenience alias for candidates.center_position
---@field intersection_position? vec3 # Convenience alias for candidates.intersection_position
---@field max_intersection_position? vec3 # Convenience alias for candidates.max_intersection_position
local prediction_result = {}

---@return prediction_result
---@description Creates an empty prediction result object.
---@since 1.0.0
function prediction.prediction_result_new() end

return prediction
