---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Utility

---@class utility

local utility = {}

---@param spell_id number
---@return boolean
---@description Determines if a specific spell is ready to be cast.
---@example if utility.is_spell_ready(123) then cast_spell() end
---@since 1.0.0
function utility.is_spell_ready(spell_id) end

---@param spell_id number
---@return boolean
---@description Checks if a spell can be afforded based on current resources.
---@example if utility.is_spell_affordable(123) then print("Can afford") end

---@since 1.0.0
function utility.is_spell_affordable(spell_id) end

---@param spell_id number
---@return boolean
---@description Evaluates both is_spell_ready and is_spell_affordable
---@example if utility.can_cast_spell(123) then cast_spell.self(123) end

---@since 1.0.0
function utility.can_cast_spell(spell_id) end

---@param center vec3
---@param radius number
---@return game_object[]
---@description Retrieves a list of units within a specified circular area.
---@example local units = utility.get_units_inside_circle_list(my_position, 10.0)

---@since 1.0.0
function utility.get_units_inside_circle_list(center, radius) end

---@param origin vec3
---@param destination vec3
---@param width number
---@return game_object[]
---@description Retrieves a list of units within a specified rectangular area.
---@description TODO: Add description for utility.get_units_inside_rectangle_list(origin, destination, width)
---@example local result = utility.get_units_inside_rectangle_list(origin, destination, width)()
---@since 1.0.0
function utility.get_units_inside_rectangle_list(origin, destination, width) end

---@param center vec3
---@param radius number
---@return number
---@description Counts the number of units within a circular area.
---@return any
---@description TODO: Add description for utility.get_amount_of_units_inside_circle(center, radius)
---@example local result = utility.get_amount_of_units_inside_circle(center, radius)()
---@since 1.0.0
function utility.get_amount_of_units_inside_circle(center, radius) end

---@param origin vec3
---@param destination vec3
---@param width number
---@return number
---@description Counts the number of units within a rectangular area.
---@return any
---@description TODO: Add description for utility.get_amount_of_units_inside_rectangle(origin, destination, width)
---@example local result = utility.get_amount_of_units_inside_rectangle(origin, destination, width)()
---@since 1.0.0
function utility.get_amount_of_units_inside_rectangle(origin, destination, width) end

---@overload fun(self, point: vec3): boolean indicating whether the pin was successfully set.
---@overload fun(self, point: vec3): boolean indicating whether the pin was successfully set.
---@param point vec3
---@return boolean indicating whether the pin was successfully set.
---@description Sets a pin at a specific point on the map. This can be useful for marking locations for navigation or other purposes.
---@example local result = utility.set_map_pin(point)()
---@since 1.0.0
function utility.set_map_pin(point) end

---@param point vec3
---@return boolean indicating whether the point is walkable.
---@description Determines if a given point in the game world is walkable.
---@description TODO: Add description for utility.is_point_walkeable(point)
---@example local result = utility.is_point_walkeable(point)()
---@since 1.0.0
function utility.is_point_walkeable(point) end

---@param point vec3
---@return boolean indicating whether the point is walkable with exceptions.
---@description Determines if a given point in the game world is walkable, considering specific exceptions.
---@return any
---@description TODO: Add description for utility.is_point_walkeable_exception(point)
---@example local result = utility.is_point_walkeable_exception(point)()
---@since 1.0.0
function utility.is_point_walkeable_exception(point) end

---@param point vec3
---@return boolean indicating whether the point is walkable.
---@description Determines if a given point in the game world is walkable using a more computationally heavy method.
---@return any
---@description TODO: Add description for utility.is_point_walkeable_heavy(point)
---@example local result = utility.is_point_walkeable_heavy(point)()
---@since 1.0.0
function utility.is_point_walkeable_heavy(point) end

---@param origin vec3
---@param destination vec3
---@param width number
---@param steps_distance number
---@return boolean
---@description Returns `bool` indicating whether the entire specified path is walkable.
---@return any
---@description TODO: Add description for utility.is_ray_cast_walkeable(origin, destination, width, steps_distance)
---@example local result = utility.is_ray_cast_walkeable(origin, destination, width, steps_distance)()
---@since 1.0.0
function utility.is_ray_cast_walkeable(origin, destination, width, steps_distance) end

---@param origin vec3
---@param destination vec3
---@param width number
---@param steps_distance number
---@return table
---@description Returns a table of results from the raycast, potentially including hit information and exact points of collision or walkability.
---@example local results = utility.get_raycast_table(my_pos, target_pos, 1.0, 0.5)
---@return any
---@description TODO: Add description for utility.get_raycast_table(origin, destination, width, steps_distance)
---@example local result = utility.get_raycast_table(origin, destination, width, steps_distance)()
---@since 1.0.0
function utility.get_raycast_table(origin, destination, width, steps_distance) end

---@param point vec3
---@return vec3 with the adjusted height.
---@description Modifies the input `vec3` to reflect the correct walkable height based on the game world's terrain data.
---@return any
---@description TODO: Add description for utility.set_height_of_valid_position(point)
---@example local result = utility.set_height_of_valid_position(point)()
---@since 1.0.0
function utility.set_height_of_valid_position(point) end

---@return boolean
---@description Toggles the mount status of the player. It checks the player's access and whether the spell for mounting is allowed. If conditions are met, it either mounts or dismounts the player.
---@return any
---@description TODO: Add description for utility.toggle_mount()
---@example local result = utility.toggle_mount()()
---@since 1.0.0
function utility.toggle_mount() end

---@param level_address number
---@return boolean
---@description Opens a portal to a specified level.
---@return any
---@description TODO: Add description for utility.open_pit_portal(level_address)
---@example local result = utility.open_pit_portal(level_address)()
---@since 1.0.0
function utility.open_pit_portal(level_address) end

---@return boolean
---@description Summons a boss in the game.
---@return any
---@description TODO: Add description for utility.summon_boss()
---@example local result = utility.summon_boss()()
---@since 1.0.0
function utility.summon_boss() end

---@return boolean
---@description Moves to the next boss summoning recipe.
---@return any
---@description TODO: Add description for utility.summon_boss_next_recipe()
---@example local result = utility.summon_boss_next_recipe()()
---@since 1.0.0
function utility.summon_boss_next_recipe() end

---@return boolean
---@description Moves to the previous boss summoning recipe.
---@return any
---@description TODO: Add description for utility.summon_boss_previous_recipe()
---@example local result = utility.summon_boss_previous_recipe()()
---@since 1.0.0
function utility.summon_boss_previous_recipe() end

---@return boolean
---@return any
---@description TODO: Add description for utility.confirm_sigil_notification()
---@example local result = utility.confirm_sigil_notification()()
---@since 1.0.0
function utility.confirm_sigil_notification() end

---@return any
function utility.toggle_mount()
end

---@return any
function utility.summon_boss()
end

---@return any
function utility.summon_boss_next_recipe()
end

---@return any
function utility.summon_boss_previous_recipe()
end

---@return any
function utility.confirm_sigil_notification()
end

---@generic T
---@param list T[]
---@return T
---@description Returns a random element from the provided list.
---@example local random_unit = utility.get_random_element(units)
---@since 1.9.7
function utility.get_random_element(list) end
-- LuaJIT Specific Extensions
---@class bit
---@field band fun(a: number, b: number): number Bitwise AND
---@field bor fun(a: number, b: number): number Bitwise OR
---@field bxor fun(a: number, b: number): number Bitwise XOR
---@field bnot fun(a: number): number Bitwise NOT
---@field lshift fun(a: number, n: number): number Left shift
---@field rshift fun(a: number, n: number): number Right shift
---@field arshift fun(a: number, n: number): number Arithmetic right shift
---@field rol fun(a: number, n: number): number Rotate left
---@field ror fun(a: number, n: number): number Rotate right
---@field bswap fun(a: number): number Byte swap
local bit = {}

---@param a number
---@param b number
---@return number
---@description Performs bitwise AND operation (LuaJIT extension).
---@example local result = bit.band(0xFF, 0x0F) -- Returns 0x0F
---@since 1.9.7
function bit.band(a, b) end

---@param a number
---@param b number
---@return number
---@description Performs bitwise OR operation (LuaJIT extension).
---@example local result = bit.bor(0xF0, 0x0F) -- Returns 0xFF
---@since 1.9.7
function bit.bor(a, b) end

---@param value number
---@return number
---@description Performs bitwise NOT operation (LuaJIT extension).
---@example local result = bit.bnot(0xFF) -- Returns -256
---@since 1.9.7
function bit.bnot(value) end