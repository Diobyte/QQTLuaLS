---@meta

---@class auto_play
auto_play = {}

function auto_play.is_active() end

---@param state any
function auto_play.set_is_profile_active(state) end

---@param text any
function auto_play.set_selected_dungeon_text(text) end

---@param text any
function auto_play.set_dungeon_entrance_name(text) end

---@param text any
function auto_play.set_dungeon_map_name(text) end

---@param text any
function auto_play.set_world_map_name(text) end

---@param point any
function auto_play.set_dungeon_entry_point(point) end

---@param waypoints_table any
function auto_play.set_world_waypoints(waypoints_table) end

---@param waypoints_table any
function auto_play.set_dungeon_waypoints(waypoints_table) end

function auto_play.get_objective() end
