---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Pathfinder

---@class pathfinder
---@description Pathfinding helpers for movement.

local pathfinder = {}

---@param pos vec3
---@return vec3[]
---@description Generate path via game engine.
---@since 1.0.0
---@example local path = pathfinder.create_path_game_engine(get_player_position())
function pathfinder.create_path_game_engine(pos) end

---@param pos vec3
---@param waypoint_list vec3[]
---@param threshold number
---@return vec3
---@description Next waypoint from list within threshold.
---@since 1.0.0
function pathfinder.get_next_waypoint(pos, waypoint_list, threshold) end

---@param pos vec3
---@return nil
---@description Force move immediately to position.
---@since 1.0.0
function pathfinder.force_move(pos) end

---@param pos vec3
---@return nil
---@description Request move if not already moving.
---@since 1.0.0
function pathfinder.request_move(pos) end

---@param start vec3
---@param goal vec3
---@return vec3[]
---@description Calculate path points between start and goal.
---@since 1.0.0
function pathfinder.calculate_and_get_path_points(start, goal) end

---@param pos vec3
---@param efficient boolean
---@return nil
---@description Move using cpathfinder, optionally efficient mode.
---@since 1.0.0
function pathfinder.move_to_cpathfinder(pos, efficient) end

---@param pos vec3
---@param algo_type number
---@param batch_length number
---@param circle_rad number
---@param circular_precision number
---@param max_algo_steps number
---@param anti_stuck_rad number
---@param anti_stuck_time number
---@return nil
---@description Fully customized cpathfinder move.
---@since 1.0.0
function pathfinder.move_to_cpathfinder_custom_full(pos, algo_type, batch_length, circle_rad, circular_precision, max_algo_steps, anti_stuck_rad, anti_stuck_time) end

---@param pos vec3
---@param batch_length number
---@param circle_rad number
---@param max_algo_steps number
---@param anti_stuck_rad number
---@param anti_stuck_time number
---@return nil
---@description Custom cpathfinder variant A1.
---@since 1.0.0
function pathfinder.move_to_cpathfinder_custom_a1(pos, batch_length, circle_rad, max_algo_steps, anti_stuck_rad, anti_stuck_time) end

---@param pos vec3
---@param circular_precision number
---@param max_algo_steps number
---@param anti_stuck_rad number
---@param anti_stuck_time number
---@return nil
---@description Custom cpathfinder variant A2.
---@since 1.0.0
function pathfinder.move_to_cpathfinder_custom_a2(pos, circular_precision, max_algo_steps, anti_stuck_rad, anti_stuck_time) end

---@return nil
---@description Clear stored path state.
---@since 1.0.0
function pathfinder.clear_stored_path() end

---@param pos vec3
---@return boolean
---@description Force move without path logic.
---@since 1.0.0
function pathfinder.force_move_raw(pos) end

---@param waypoint_list vec3[]
---@param point vec3
---@return vec3[]
---@description Sort waypoints by proximity to point.
---@since 1.0.0
function pathfinder.sort_waypoints(waypoint_list, point) end

---@param value number
---@return boolean
---@description Set the last waypoint index.
---@since 1.0.0
function pathfinder.set_last_waypoint_index(value) end

return pathfinder
