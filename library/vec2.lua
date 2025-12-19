---@meta

---@class vec2
---@field x number
---@field y number
local vec2 = {}

---@param x number
---@param y number
---@return vec2
function vec2.new(x, y) end

---@return boolean
function vec2:is_zero() end

---@return vec3
function vec2:project_3d() end

---@param other vec2
---@return number
function vec2:distance(other) end

---@param other vec2
---@return number
function vec2:distance_squared(other) end

---@return boolean
function vec2:intersects() end

---@return number
function vec2:length() end

---@param other vec2
---@return number
function vec2:dot_product(other) end

---@return vec2
function vec2:get_unit_vector() end

---@param point vec2
---@param origin vec2
---@return number
function vec2:get_angle(point, origin) end

---@param target vec2
---@param dist number
---@return vec2
function vec2:get_extended(target, dist) end

---@return vec2
function vec2:screen_to_coordinate() end

---@return vec2
function vec2:coordinate_to_screen() end

---@param origin vec2
---@param degree number
---@return vec2
function vec2:rotate_around(origin, degree) end

---@param other vec2
---@return boolean
function vec2:equals(other) end
