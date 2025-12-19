---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/World

---@class world
---@description Provides game-world context: retrieve the active world instance, its name, current zone, and world identifier.
local world = {}

---@return world
---@description Returns the active world instance so you can call world-scoped helpers.
---@example local w = world.get_current_world()
---@since 1.0.0
function world.get_current_world() end

---@return string
---@description Gets the name of the current world shard (e.g., server name).
---@example local name = world:get_name()
---@since 1.0.0
function world:get_name() end

---@return string
---@description Gets the human-readable name of the zone the player is in.
---@example local zone = world:get_current_zone_name()
---@since 1.0.0
function world:get_current_zone_name() end

---@return integer
---@description Returns the numeric identifier of the current world instance.
---@example local id = world:get_world_id()
---@since 1.0.0
function world:get_world_id() end
