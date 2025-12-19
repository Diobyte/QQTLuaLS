---@meta

---@class prediction
prediction = {}

---@param target any
---@param params any
---@param spell_data any
---@param debug_call any
function prediction.get_prediction_result(target, params, spell_data, debug_call) end

---@param unit any
---@param time any
function prediction.get_future_unit_position(unit, time) end

---@param origin any
---@param center_position any
---@param intersection any
function prediction.get_intersection_position(origin, center_position, intersection) end

---@param target any
---@param params any
---@param spell_data any
---@param prediction_result_ptr any
function prediction.get_cast_position(target, params, spell_data, prediction_result_ptr) end

---@param source any
---@param point any
---@param speed any
---@param delay any
---@param extra_network_time any
---@param hitbox any
---@param debug_mode any
function prediction.get_hit_time(source, point, speed, delay, extra_network_time, hitbox, debug_mode) end

---@param radius any
---@param center any
function prediction.get_collisions_circular(radius, center) end

---@param from any
---@param to any
---@param width any
function prediction.get_collisions_rectangular(from, to, width) end

---@param from any
---@param to any
---@param width any
function prediction.is_wall_collision(from, to, width) end

---@param v vec3
---@param t number
function prediction_parameters(v, t) end

function prediction_result_candidates() end

function prediction_result() end
