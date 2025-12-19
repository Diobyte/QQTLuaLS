---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Vector-2

---@class vec2
---@description The `vec2` class provides 2D vector operations essential for screen coordinates, UI positioning, and 2D calculations in the Diablo Lua API.

---@operator add(vec2):vec2
---@operator sub(vec2):vec2
---@operator mul(number):vec2
---@operator div(number):vec2
---@operator unm:vec2

---@overload fun(x: number, y: number): vec2
local vec2 = {}
---@return vec2
---@description Creates a new vec2 instance with the specified x and y coordinates.
---@example local pos = vec2.new(100, 200)
---@since 1.0.0

---@return Boolean
function is_zero()
end


---@return [
function project_3d()
end


---@return Number
function distance(other)
end


---@return Number
function distance_squared(other)
end


---@return Boolean
function intersects()
end


---@return Number
function length()
end


---@return Number
function dot_product(other)
end


---@return [
function get_unit_vector()
end


---@return Number
function get_angle(point, origin)
end


---@return [
function get_extended(target, dist)
end


---@return [
function screen_to_coordinate()
end


---@return [
function coordinate_to_screen()
end


---@return [
function rotate_around(origin, degree)
end


---@return Boolean
function equals(other)
end

---@return any
---@description TODO: Add description for vec2.new(x, y)
---@example local result = vec2.new(x, y)()
---@since 1.0.0
function vec2.new(x, y) end

---@return number
---@description Returns the x-coordinate of the vector.
---@example local x = vec2.new(100, 200):x() -- Returns 100
---@return any
---@description TODO: Add description for vec2:x()
---@example local result = vec2:x()
---@since 1.0.0
---@example local result = vec2:x()
---@since 1.0.0
function vec2:x() end

---@return number
---@description Returns the y-coordinate of the vector.
---@example local y = vec2.new(100, 200):y() -- Returns 200
---@since 1.0.0
---@since 1.0.0
function vec2:y() end

---@return boolean
---@description Checks if this vec2 represents the zero vector (0, 0).
---@example local zero = vec2.new(0, 0):is_zero() -- Returns true
---@return any
---@description TODO: Add description for vec2:is_zero()
---@example local result = vec2:is_zero()
---@since 1.0.0
---@since 1.0.0
function vec2:is_zero() end

---@return vec3
---@description Projects this vec2 onto a 3D plane, typically by adding a Z coordinate of 0, and returns a vec3.
---@example local pos3d = vec2.new(100, 200):project_3d() -- Returns vec3.new(100, 200, 0)
---@description TODO: Add description for vec2:project_3d()
---@example local result = vec2:project_3d()
---@since 1.0.0
---@since 1.0.0
function vec2:project_3d() end

---@param other vec2
---@return number
---@description Calculates the Euclidean distance between this vec2 and another vec2.
---@example local dist = vec2.new(0, 0):distance(vec2.new(3, 4)) -- Returns 5.0
---@description TODO: Add description for vec2:distance(other)
---@example local result = vec2:distance(other)
---@since 1.0.0
---@since 1.0.0
function vec2:distance(other) end

---@param other vec2
---@return number
---@description Calculates the squared Euclidean distance between this vec2 and another vec2 for efficiency.
---@example local sq_dist = vec2.new(0, 0):distance_squared(vec2.new(3, 4)) -- Returns 25.0
---@return any
---@description TODO: Add description for vec2:distance_squared(other)
---@example local result = vec2:distance_squared(other)
---@since 1.0.0
---@return any
---@description TODO: Add description for vec2:distance_squared(other)
---@example local result = vec2:distance_squared(other)
---@since 1.0.0
function vec2:distance_squared(other) end

---@return boolean
---@description Evaluates if this vector intersects with another object or vector.
---@return any
---@description TODO: Add description for vec2:intersects()
---@example local result = vec2:intersects()
---@since 1.0.0
---@example local result = vec2:intersects()
---@since 1.0.0
function vec2:intersects() end

---@return number
---@description Returns the length (magnitude) of this vec2.
---@example local len = vec2.new(3, 4):length() -- Returns 5.0
---@return any
---@description TODO: Add description for vec2:length()
---@example local result = vec2:length()
---@since 1.0.0
---@since 1.0.0
function vec2:length() end

---@param other vec2
---@return number
---@description Computes the dot product of this vec2 and another vec2.
---@example local dot = vec2.new(1, 0):dot_product(vec2.new(0, 1)) -- Returns 0.0
---@return any
---@description TODO: Add description for vec2:dot_product(other)
---@example local result = vec2:dot_product(other)
---@since 1.0.0
---@example local result = vec2:dot_product(other)
---@since 1.0.0
function vec2:dot_product(other) end

---@return vec2
---@description Returns the unit vector (normalized) of this vec2.
---@example local unit = vec2.new(3, 4):get_unit_vector() -- Returns vec2.new(0.6, 0.8)
---@return any
---@description TODO: Add description for vec2:get_unit_vector()
---@example local result = vec2:get_unit_vector()
---@since 1.0.0
---@since 1.0.0
function vec2:get_unit_vector() end

---@param point vec2
---@param origin vec2
---@return number
---@description Calculates the angle between this vec2, the point vec2, and the origin vec2.
---@return any
---@description TODO: Add description for vec2:get_angle(point, origin)
---@example local result = vec2:get_angle(point, origin)
---@since 1.0.0
---@return any
---@description TODO: Add description for vec2:get_angle(point, origin)
---@example local result = vec2:get_angle(point, origin)
---@since 1.0.0
function vec2:get_angle(point, origin) end

---@param target vec2
---@param dist number
---@return vec2
---@description Extends this vec2 towards the target vec2 by the specified distance.
---@return any
---@description TODO: Add description for vec2:get_extended(target, dist)
---@example local result = vec2:get_extended(target, dist)
---@since 1.0.0
---@example local result = vec2:get_extended(target, dist)
---@since 1.0.0
function vec2:get_extended(target, dist) end

---@return vec2
---@description Converts this screen coordinate vec2 to world coordinates.
---@return any
---@description TODO: Add description for vec2:screen_to_coordinate()
---@example local result = vec2:screen_to_coordinate()
---@since 1.0.0
---@since 1.0.0
function vec2:screen_to_coordinate() end

---@return vec2
---@description Converts this world coordinate vec2 to screen coordinates.
---@return any
---@description TODO: Add description for vec2:coordinate_to_screen()
---@example local result = vec2:coordinate_to_screen()
---@since 1.0.0
---@return any
---@description TODO: Add description for vec2:coordinate_to_screen()
---@example local result = vec2:coordinate_to_screen()
---@since 1.0.0
function vec2:coordinate_to_screen() end

---@param origin vec2
---@param degree number
---@return vec2
---@description Rotates this vec2 around the specified origin by the given degree.
---@return any
---@description TODO: Add description for vec2:rotate_around(origin, degree)
---@example local result = vec2:rotate_around(origin, degree)
---@since 1.0.0
---@return any
---@description TODO: Add description for vec2:rotate_around(origin, degree)
---@example local result = vec2:rotate_around(origin, degree)
---@since 1.0.0
function vec2:rotate_around(origin, degree) end

---@param other vec2
---@return boolean
---@description Checks if this vec2 is equal to another vec2.
---@return any
---@description TODO: Add description for vec2:equals(other)
---@example local result = vec2:equals(other)
---@since 1.0.0
---@return any
---@description TODO: Add description for vec2:equals(other)
---@example local result = vec2:equals(other)
---@since 1.0.0
function vec2:equals(other) end
