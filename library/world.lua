---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/World

---@class world
---@description The `world` class provides access to global game world information, including zone and world identifiers, essential for location-aware scripting in Diablo Immortal.

local world = {}

---@return string
---@description Returns the name of the current world.
---@example local name = world:get_name()
---@since 1.0.0
function world:get_name() end

---@return string
---@description Returns the name of the current zone.
---@example local zone = world:get_current_zone_name()
---@return any
---@description TODO: Add description for world:get_current_zone_name()
---@example local result = world:get_current_zone_name()
---@since 1.0.0
function world:get_current_zone_name() end

---@return string
---@description Returns the ID of the current world.
---@example local id = world:get_world_id()
---@return any
---@description TODO: Add description for world:get_world_id()
---@example local result = world:get_world_id()
---@since 1.0.0
function world:get_world_id() end
