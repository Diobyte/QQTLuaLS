---@meta

---@see https://github.com/qqtnn/qqt_diablo.wiki.git/wiki/Color

---@class color
---@overload fun(r: number, g: number, b: number): color
---@overload fun(r: number, g: number, b: number, a: number): color
local color = {}

---@return color
function color.new(r, g, b) end
