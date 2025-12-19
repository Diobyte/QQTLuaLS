---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Auto-Play

---@class auto_play
---@description Automation helpers for objectives and paths.

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
---@description True when auto-play is fully active.
---@since 1.0.0
---@example if auto_play.is_active() then console.print("Auto-play running") end
function auto_play.is_active() end

---@param state boolean
---@return nil
---@description Enable or disable the active profile state.
---@since 1.0.0
function auto_play.set_is_profile_active(state) end

---@param text string
---@return nil
---@description Set the selected dungeon label.
---@since 1.0.0
function auto_play.set_selected_dungeon_text(text) end

---@param text string
---@return nil
---@description Set the dungeon entrance name.
---@since 1.0.0
function auto_play.set_dungeon_entrance_name(text) end

---@param text string
---@return nil
---@description Set the dungeon map name.
---@since 1.0.0
function auto_play.set_dungeon_map_name(text) end

---@param text string
---@return nil
---@description Set the world map name.
---@since 1.0.0
function auto_play.set_world_map_name(text) end

---@param point vec3
---@return nil
---@description Set the dungeon entry point position.
---@since 1.0.0
function auto_play.set_dungeon_entry_point(point) end

---@param waypoints_table vec3[]
---@return nil
---@description Set world waypoints for travel.
---@since 1.0.0
function auto_play.set_world_waypoints(waypoints_table) end

---@param waypoints_table vec3[]
---@return nil
---@description Set dungeon waypoints for navigation.
---@since 1.0.0
function auto_play.set_dungeon_waypoints(waypoints_table) end

---@return objective
---@description Current objective state.
---@since 1.0.0
function auto_play.get_objective() end

return auto_play
