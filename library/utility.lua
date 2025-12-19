---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Utility

---@class utility
---@description Helper functions for gameplay queries and navigation.
local utility = {}

---@param spell_id number
---@return boolean
---@description True if the spell is off cooldown.
---@since 1.0.0
---@example if utility.is_spell_ready(123) then cast_spell_id(123) end
function utility.is_spell_ready(spell_id) end

---@param spell_id number
---@return boolean
---@description True if the spell resource cost can be paid.
---@since 1.0.0
function utility.is_spell_affordable(spell_id) end

---@param spell_id number
---@return boolean
---@description True if the spell is ready and affordable.
---@since 1.0.0
function utility.can_cast_spell(spell_id) end

---@param center vec3
---@param radius number
---@return game_object[]
---@description List of units inside a circle.
---@since 1.0.0
function utility.get_units_inside_circle_list(center, radius) end

---@param origin vec3
---@param destination vec3
---@param width number
---@return game_object[]
---@description List of units inside a rectangle from origin to destination.
---@since 1.0.0
function utility.get_units_inside_rectangle_list(origin, destination, width) end

---@param center vec3
---@param radius number
---@return number
---@description Number of units inside a circle.
---@since 1.0.0
function utility.get_amount_of_units_inside_circle(center, radius) end

---@param origin vec3
---@param destination vec3
---@param width number
---@return number
---@description Number of units inside a rectangle from origin to destination.
---@since 1.0.0
function utility.get_amount_of_units_inside_rectangle(origin, destination, width) end

---@param point vec3
---@return boolean
---@description Places a map pin at the given point.
---@since 1.0.0
function utility.set_map_pin(point) end

---@param point vec3
---@return boolean
---@description True if the point is walkable.
---@since 1.0.0
function utility.is_point_walkeable(point) end

---@param point vec3
---@return boolean
---@description True if the point is walkable given exception rules.
---@since 1.0.0
function utility.is_point_walkeable_exception(point) end

---@param point vec3
---@return boolean
---@description Heavy check for walkability.
---@since 1.0.0
function utility.is_point_walkeable_heavy(point) end

---@param origin vec3
---@param destination vec3
---@param width number
---@param steps_distance number
---@return boolean
---@description True if the entire ray path is walkable.
---@since 1.0.0
function utility.is_ray_cast_walkeable(origin, destination, width, steps_distance) end

---@param origin vec3
---@param destination vec3
---@param width number
---@param steps_distance number
---@return table
---@description Raycast results along a path.
---@since 1.0.0
function utility.get_raycast_table(origin, destination, width, steps_distance) end

---@param point vec3
---@return vec3
---@description Adjusts point to the nearest valid walkable height.
---@since 1.0.0
function utility.set_height_of_valid_position(point) end

---@return boolean
---@description Mounts or dismounts the player if allowed.
---@since 1.0.0
function utility.toggle_mount() end

---@param level_address number
---@return boolean
---@description Opens a pit portal to the given level.
---@since 1.0.0
function utility.open_pit_portal(level_address) end

---@return boolean
---@description Summons a boss if possible.
---@since 1.0.0
function utility.summon_boss() end

---@return boolean
---@description Selects the next boss summoning recipe.
---@since 1.0.0
function utility.summon_boss_next_recipe() end

---@return boolean
---@description Selects the previous boss summoning recipe.
---@since 1.0.0
function utility.summon_boss_previous_recipe() end

---@return boolean
---@description Confirms the sigil notification prompt.
---@since 1.0.0
function utility.confirm_sigil_notification() end

---@generic T
---@param list T[]
---@return T
---@description Returns a random element from the list.
---@since 1.9.7
function utility.get_random_element(list) end

---@class utility_bit
---@field band fun(a: number, b: number): number
---@field bor fun(a: number, b: number): number
---@field bxor fun(a: number, b: number): number
---@field bnot fun(a: number): number
---@field lshift fun(a: number, n: number): number
---@field rshift fun(a: number, n: number): number
---@field arshift fun(a: number, n: number): number
---@field rol fun(a: number, n: number): number
---@field ror fun(a: number, n: number): number
---@field bswap fun(a: number): number
utility.bit = {}

---@param a number
---@param b number
---@return number
---@description Bitwise AND (LuaJIT).
---@since 1.9.7
function utility.bit.band(a, b) end

---@param a number
---@param b number
---@return number
---@description Bitwise OR (LuaJIT).
---@since 1.9.7
function utility.bit.bor(a, b) end

---@param a number
---@param b number
---@return number
---@description Bitwise XOR (LuaJIT).
---@since 1.9.7
function utility.bit.bxor(a, b) end

---@param value number
---@return number
---@description Bitwise NOT (LuaJIT).
---@since 1.9.7
function utility.bit.bnot(value) end

---@param a number
---@param n number
---@return number
---@description Left shift (LuaJIT).
---@since 1.9.7
function utility.bit.lshift(a, n) end

---@param a number
---@param n number
---@return number
---@description Right shift (LuaJIT).
---@since 1.9.7
function utility.bit.rshift(a, n) end

---@param a number
---@param n number
---@return number
---@description Arithmetic right shift (LuaJIT).
---@since 1.9.7
function utility.bit.arshift(a, n) end

---@param a number
---@param n number
---@return number
---@description Rotate left (LuaJIT).
---@since 1.9.7
function utility.bit.rol(a, n) end

---@param a number
---@param n number
---@return number
---@description Rotate right (LuaJIT).
---@since 1.9.7
function utility.bit.ror(a, n) end

---@param a number
---@return number
---@description Byte swap (LuaJIT).
---@since 1.9.7
function utility.bit.bswap(a) end

return utility

