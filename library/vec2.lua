---@meta

---@class vec2
---@field x number
---@field y number
local vec2_class = {}

---@param x number
---@param y number
---@return vec2
function vec2(x, y) end

---@return boolean
function vec2_class:is_zero() end

---@return vec3
function vec2_class:project_3d() end

---@param other vec2
---@return number
function vec2_class:distance(other) end

---@param other vec2
---@return number
function vec2_class:distance_squared(other) end

---@return boolean
function vec2_class:intersects() end

---@return number
function vec2_class:length() end

---@param other vec2
---@return number
function vec2_class:dot_product(other) end

---@return vec2
function vec2_class:get_unit_vector() end

---@param point vec2
---@param origin vec2
---@return number
function vec2_class:get_angle(point, origin) end

---@param target vec2
---@param dist number
---@return vec2
function vec2_class:get_extended(target, dist) end

---@return vec2
function vec2_class:screen_to_coordinate() end

---@return vec2
function vec2_class:coordinate_to_screen() end

---@param origin vec2
---@param degree number
---@return vec2
function vec2_class:rotate_around(origin, degree) end

---@param other vec2
---@return boolean
function vec2_class:equals(other) end
