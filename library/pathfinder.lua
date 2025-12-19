---@meta

---@class pathfinder
pathfinder = {}

---@param pos any
function pathfinder.create_path_game_engine(pos) end

---@param pos any
---@param waypoint_list any
---@param threshold any
function pathfinder.get_next_waypoint(pos, waypoint_list, threshold) end

---@param pos any
function pathfinder.force_move(pos) end

---@param pos any
function pathfinder.request_move(pos) end

---@param start any
---@param goal any
function pathfinder.calculate_and_get_path_points(start, goal) end

---@param pos any
---@param efficient any
function pathfinder.move_to_cpathfinder(pos, efficient) end

---@param pos any
---@param algo_type any
---@param batch_length any
---@param circle_rad any
---@param circular_precision any
---@param max_algo_steps any
---@param anti_stuck_rad any
---@param anti_stuck_time any
function pathfinder.move_to_cpathfinder_custom_full(pos, algo_type, batch_length, circle_rad, circular_precision, max_algo_steps, anti_stuck_rad, anti_stuck_time) end

---@param pos any
---@param batch_length any
---@param circle_rad any
---@param max_algo_steps any
---@param [anti_stuck_rad any
---@param anti_stuck_time] any
function pathfinder.move_to_cpathfinder_custom_a1(pos, batch_length, circle_rad, max_algo_steps, [anti_stuck_rad, anti_stuck_time]) end

---@param pos any
---@param circular_precision any
---@param max_algo_steps any
---@param [anti_stuck_rad any
---@param anti_stuck_time] any
function pathfinder.move_to_cpathfinder_custom_a2(pos, circular_precision, max_algo_steps, [anti_stuck_rad, anti_stuck_time]) end

---@return void
function pathfinder.clear_stored_path() end

---@param pos any
---@return void
function pathfinder.force_move_raw(pos) end

---@param waypoint_list any
---@param point any
---@return bool
function pathfinder.sort_waypoints(waypoint_list, point) end

---@param value any
---@return bool
function pathfinder.set_last_waypoint_index(value) end
