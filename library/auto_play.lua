---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Auto‐Play

---@class auto_play

---@enum objective
local objective = {
    unknown = 0,
    revive = 1,
    fight = 2,
    quest = 3,
    travel = 4,
    loot = 5,
    sell = 6,
    reset = 7
}

local auto_play = {}

---@return boolean
---@description Checks if the auto play is fully active.
---@example local active = auto_play.is_active()
---@since 1.0.0
function auto_play.is_active() end

---@param state boolean
---@return nil
---@description Sets the state of the profile to active or inactive.
---@example auto_play.set_is_profile_active(true) -- Activates the profile
---@return any
---@description TODO: Add description for auto_play.set_is_profile_active(state)
---@example local result = auto_play.set_is_profile_active(state)()
---@since 1.0.0
function auto_play.set_is_profile_active(state) end

---@param text string
---@return nil
---@description Sets the text for the selected dungeon.
---@example auto_play.set_selected_dungeon_text("Darkened Halls")
---@example local result = auto_play.set_selected_dungeon_text(text)()
---@since 1.0.0
function auto_play.set_selected_dungeon_text(text) end

---@param text string
---@return nil
---@description Sets the name of the dungeon entrance.
---@example auto_play.set_dungeon_entrance_name("Main Entrance")
---@return any
---@description TODO: Add description for auto_play.set_dungeon_entrance_name(text)
---@example local result = auto_play.set_dungeon_entrance_name(text)()
---@since 1.0.0
function auto_play.set_dungeon_entrance_name(text) end

---@param text string
---@return nil
---@description Sets the name of the dungeon map.
---@example auto_play.set_dungeon_map_name("Level 1")
---@example local result = auto_play.set_dungeon_map_name(text)()
---@since 1.0.0
function auto_play.set_dungeon_map_name(text) end

---@param text string
---@return nil
---@description Sets the name of the world map.
---@example auto_play.set_world_map_name("Fractured Peaks")
---@return any
---@description TODO: Add description for auto_play.set_world_map_name(text)
---@example local result = auto_play.set_world_map_name(text)()
---@since 1.0.0
function auto_play.set_world_map_name(text) end

---@param point vec3
---@return nil
---@description Sets the entry point for the dungeon. This vec3 represents the 3D coordinates where the dungeon starts.
---@example local entry = vec3.new(100, 0, 200); auto_play.set_dungeon_entry_point(entry)
---@since 1.0.0
function auto_play.set_dungeon_entry_point(point) end

---@param waypoints_table vec3[]
---@return nil
---@description Sets the waypoints for the world map. Provide a table of vec3 points for navigation.
---@example local waypoints = {vec3.new(0,0,0), vec3.new(10,0,10)}; auto_play.set_world_waypoints(waypoints)
---@return any
---@description TODO: Add description for auto_play.set_world_waypoints(waypoints_table)
---@example local result = auto_play.set_world_waypoints(waypoints_table)()
---@since 1.0.0
function auto_play.set_world_waypoints(waypoints_table) end

---@param waypoints_table vec3[]
---@return nil
---@description Sets the waypoints for the dungeon. Provide a table of vec3 points for dungeon navigation.
---@example local dungeon_waypoints = {vec3.new(5,0,5), vec3.new(15,0,15)}; auto_play.set_dungeon_waypoints(dungeon_waypoints)
---@return any
---@description TODO: Add description for auto_play.set_dungeon_waypoints(waypoints_table)
---@example local result = auto_play.set_dungeon_waypoints(waypoints_table)()
---@since 1.0.0
function auto_play.set_dungeon_waypoints(waypoints_table) end

---@return objective
---@description Gets the current objective as an objective enum value.
---@example local obj = auto_play.get_objective()
---@example if obj == objective.fight then print("Fighting") end
---@return any
---@description TODO: Add description for auto_play.get_objective()
---@example local result = auto_play.get_objective()()
---@since 1.0.0
function auto_play.get_objective() end
