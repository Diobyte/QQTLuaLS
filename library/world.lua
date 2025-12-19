---@meta

---@see https://github.com/qqtnn/qqt_diablo.wiki.git/wiki/World

---@class world
---@description The `world` class provides access to global game world information, including zone and world identifiers, essential for location-aware scripting in Diablo Immortal.

local world = {}

---@return string
---@description Returns the name of the current world.
---@example local name = world:get_name()
function world:get_name() end

---@return string
---@description Returns the name of the current zone.
---@example local zone = world:get_current_zone_name()
function world:get_current_zone_name() end

---@return string
---@description Returns the ID of the current world.
---@example local id = world:get_world_id()
function world:get_world_id() end
