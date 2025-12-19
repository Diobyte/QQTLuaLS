---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Color

---@class color
---@overload fun(r: number, g: number, b: number): color
---@overload fun(r: number, g: number, b: number, a: number): color
local color = {}

---@param r number
---@param g number
---@param b number
---@param a number|nil
---@return color
---@description Creates a color using RGB or RGBA components (0-255 per channel).
---@since 1.0.0
function color.new(r, g, b, a) end

return color
