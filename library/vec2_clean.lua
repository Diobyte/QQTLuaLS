---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Vector-2

---@class vec2_clean
---@description Lightweight 2D vector helper.
---@operator add(vec2_clean):vec2_clean
---@operator sub(vec2_clean):vec2_clean
---@operator mul(number):vec2_clean
---@operator div(number):vec2_clean
---@operator unm:vec2_clean

---@overload fun(x: number, y: number): vec2_clean
local vec2_clean = {}

---@param x number
---@param y number
---@return vec2_clean
---@description Creates a new vec2_clean with the given coordinates.
---@since 1.0.0
function vec2_clean.new(x, y) end

---@return number
---@description Returns the x-coordinate.
---@since 1.0.0
function vec2_clean:x() end

---@return number
---@description Returns the y-coordinate.
---@since 1.0.0
function vec2_clean:y() end

---@return boolean
---@description Checks if this vector is (0,0).
---@since 1.0.0
function vec2_clean:is_zero() end

---@return vec3
---@description Projects this vec2_clean into 3D space with z=0.
---@since 1.0.0
function vec2_clean:project_3d() end

---@param other vec2_clean
---@return number
---@description Euclidean distance to another vec2_clean.
---@since 1.0.0
function vec2_clean:distance(other) end

---@param other vec2_clean
---@return number
---@description Squared distance to another vec2_clean.
---@since 1.0.0
function vec2_clean:distance_squared(other) end

---@return boolean
---@description Tests intersection against another object/vector.
---@since 1.0.0
function vec2_clean:intersects() end

---@return number
---@description Length (magnitude) of this vector.
---@since 1.0.0
function vec2_clean:length() end

---@param other vec2_clean
---@return number
---@description Dot product with another vec2_clean.
---@since 1.0.0
function vec2_clean:dot_product(other) end

---@return vec2_clean
---@description Normalized unit vector.
---@since 1.0.0
function vec2_clean:get_unit_vector() end

---@param point vec2_clean
---@param origin vec2_clean
---@return number
---@description Angle from origin to point relative to this vector.
---@since 1.0.0
function vec2_clean:get_angle(point, origin) end

---@param target vec2_clean
---@param dist number
---@return vec2_clean
---@description Extends this vector toward target by dist.
---@since 1.0.0
function vec2_clean:get_extended(target, dist) end

---@return vec2_clean
---@description Converts screen coords to world coords.
---@since 1.0.0
function vec2_clean:screen_to_coordinate() end

---@return vec2_clean
---@description Converts world coords to screen coords.
---@since 1.0.0
function vec2_clean:coordinate_to_screen() end

---@param origin vec2_clean
---@param degree number
---@return vec2_clean
---@description Rotates this vector around origin by degree.
---@since 1.0.0
function vec2_clean:rotate_around(origin, degree) end

---@param other vec2_clean
---@return boolean
---@description Checks equality with another vec2_clean.
---@since 1.0.0
function vec2_clean:equals(other) end

return vec2_clean

