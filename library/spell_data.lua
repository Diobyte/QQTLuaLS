---@meta

---@see https://github.com/qqtnn/qqt_diablo/wiki/Spell-Data

---@alias spell_id number

---@class spell_data
---@field radius number
---@field range number
---@field cast_delay number
---@field projectile_speed number
---@field has_wall_collision boolean
---@field spell_id spell_id
---@field geometry_type spell_geometry
---@field targeting_type targeting_type
local spell_data = {}

---@param radius number
---@param range number
---@param cast_delay number
---@param projectile_speed number
---@param has_wall_collision boolean
---@param spell_id spell_id
---@param geometry_type spell_geometry
---@param targeting_type targeting_type
---@return spell_data
---@description Creates a new spell_data instance with the specified parameters. See also: prediction module for usage in casting.
---@example local spell = spell_data:new(5.0, 10.0, 0.5, 500, true, 123, spell_geometry.circular, targeting_type.skillshot)
---@since 1.0.0
function spell_data:new(radius, range, cast_delay, projectile_speed, has_wall_collision, spell_id, geometry_type,
                        targeting_type)
    return {}
end

return spell_data
