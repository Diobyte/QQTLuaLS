---@meta

---@see https://github.com/qqtnn/qqt_diablo/wiki/Vector-2

---@class vec2
---@description 2D vector utilities for screen/UI calculations.
---@operator add(vec2):vec2
---@operator sub(vec2):vec2
---@operator mul(number):vec2
---@operator div(number):vec2
---@operator unm:vec2

---@overload fun(x: number, y: number): vec2
local vec2 = {}

---@param x number
---@param y number
---@return vec2
---@description Creates a new vec2 with the given coordinates.
---@since 1.0.0
---@example local p = vec2.new(100, 200)
function vec2.new(x, y) end

---@return number
---@description Returns the x-coordinate.
---@since 1.0.0
function vec2:x() end

---@return number
---@description Returns the y-coordinate.
---@since 1.0.0
function vec2:y() end

---@return boolean
---@description Checks if this vector is (0,0).
---@since 1.0.0
function vec2:is_zero() end

---@return vec3
---@description Projects this vec2 into 3D space with z=0.
---@since 1.0.0
function vec2:project_3d() end

---@param other vec2
---@return number
---@description Euclidean distance to another vec2.
---@since 1.0.0
function vec2:distance(other) end

---@param other vec2
---@return number
---@description Squared distance to another vec2.
---@since 1.0.0
function vec2:distance_squared(other) end

---@return boolean
---@description Tests intersection against another object/vector.
---@since 1.0.0
function vec2:intersects() end

---@return number
---@description Length (magnitude) of this vector.
---@since 1.0.0
function vec2:length() end

---@param other vec2
---@return number
---@description Dot product with another vec2.
---@since 1.0.0
function vec2:dot_product(other) end

---@return vec2
---@description Normalized unit vector.
---@since 1.0.0
function vec2:get_unit_vector() end

---@param point vec2
---@param origin vec2
---@return number
---@description Angle from origin to point relative to this vector.
---@since 1.0.0
function vec2:get_angle(point, origin) end

---@param target vec2
---@param dist number
---@return vec2
---@description Extends this vector toward target by dist.
---@since 1.0.0
function vec2:get_extended(target, dist) end

---@return vec2
---@description Converts screen coords to world coords.
---@since 1.0.0
function vec2:screen_to_coordinate() end

---@return vec2
---@description Converts world coords to screen coords.
---@since 1.0.0
function vec2:coordinate_to_screen() end

---@param origin vec2
---@param degree number
---@return vec2
---@description Rotates this vector around origin by degree.
---@since 1.0.0
function vec2:rotate_around(origin, degree) end

---@param other vec2
---@return boolean
---@description Checks equality with another vec2.
---@since 1.0.0
function vec2:equals(other) end

return vec2

