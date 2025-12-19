---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Vector-3

---@class vec3

---@operator add(vec3):vec3
---@operator sub(vec3):vec3
---@operator mul(number):vec3
---@operator div(number):vec3
---@operator unm:vec3

---@overload fun(x: number, y: number, z: number): vec3
---@overload fun(other: vec3): vec3
local vec3 = {}
---@return vec3
---@description TODO: Add description for vec3.new(x, y, z)
---@example local result = vec3.new(x, y, z)()
---@since 1.0.0
function vec3.new(x, y, z) end

---@return vec3
---@description Calculates and returns the rotation vector corresponding to the direction this vec3 is pointing.
---@description TODO: Add description for vec3:get_rotation()
---@example local result = vec3:get_rotation()
---@since 1.0.0
function vec3:get_rotation() end

---@return vec3
---@description Normalizes the rotation component of this vec3, useful in rotational calculations.
---@return any
---@description TODO: Add description for vec3:normalize_rotation()
---@example local result = vec3:normalize_rotation()
---@since 1.0.0
function vec3:normalize_rotation() end

---@return vec3
---@description Normalizes this vec3, scaling it to a unit vector while maintaining direction.
---@example local unit = vec3.new(3, 4, 5):normalize() -- Length becomes 1.0
---@return any
---@description TODO: Add description for vec3:normalize()
---@example local result = vec3:normalize()
---@since 1.0.0
function vec3:normalize() end

---@return number
---@description Returns the x-coordinate (Float).
---@return any
---@description TODO: Add description for vec3:x()
---@example local result = vec3:x()
---@since 1.0.0
function vec3:x() end

---@return number
---@description Returns the y-coordinate (Float).
---@return any
---@description TODO: Add description for vec3:y()
---@example local result = vec3:y()
---@since 1.0.0
function vec3:y() end

---@return number
---@description Returns the z-coordinate (Float).
---@return any
---@description TODO: Add description for vec3:z()
---@example local result = vec3:z()
---@since 1.0.0
function vec3:z() end

---@param other vec3
---@return boolean
---@description Checks if this vec3 is equal to another vec3, disregarding the Z coordinate.
---@return any
---@description TODO: Add description for vec3:equals_ignore_z(other)
---@example local result = vec3:equals_ignore_z(other)
---@since 1.0.0
function vec3:equals_ignore_z(other) end

---@param other vec3
---@param threshold number
---@return boolean
---@description Evaluates if this vec3 is approximately equal to another vec3 within a specified threshold, ignoring Z coordinates.
---@return any
---@description TODO: Add description for vec3:equals_ignore_z_threshold(other, threshold)
---@example local result = vec3:equals_ignore_z_threshold(other, threshold)
---@since 1.0.0
function vec3:equals_ignore_z_threshold(other, threshold) end

---@param segment_end vec3
---@param point vec3
---@param margin number
---@param radius number
---@param denominator number
---@return boolean
---@description Determines if a line segment from this vec3 to segment_end intersects a point within given margins.
---@example local intersects = vec3.new(0, 0, 0):intersects(vec3.new(10, 0, 0), vec3.new(5, 1, 0), 1.0, 2.0, 1.0)
---@description TODO: Add description for vec3:intersects(segment_end, point, margin, radius, denominator)
---@example local result = vec3:intersects(segment_end, point, margin, radius, denominator)
---@since 1.0.0
function vec3:intersects(segment_end, point, margin, radius, denominator) end

---@param other vec3
---@return boolean
---@description Returns true if this vec3 is oriented towards the specified vector.
---@example local facing = vec3.new(1, 0, 0):is_facing(vec3.new(1, 0, 0))
---@since 1.0.0
function vec3:is_facing(other) end

---@return string
---@description Converts this vec3 to a string representation, displaying its coordinates.
---@example local result = vec3:to_string()
---@since 1.0.0
function vec3:to_string() end

---@param margin number
---@return vec3
---@description Randomizes the X and Z coordinates within the specified margin, altering the vector's position.
---@example local randomized = vec3.new(0, 0, 0):randomize_xz(1.0)
---@since 1.0.0
function vec3:randomize_xz(margin) end

---@return number
---@description Calculates the 2D length (ignoring Z coordinate).
---@example local len = vec3.new(3, 4, 5):length_2d() -- Returns 5.0
---@since 1.0.0
function vec3:length_2d() end

---@return number
---@description Computes the full 3D length of the vector.
---@return any
---@description TODO: Add description for vec3:length_3d()
---@example local result = vec3:length_3d()
---@since 1.0.0
function vec3:length_3d() end

---@return number
---@description Determines the 3D length, excluding Z coordinate.
---@description TODO: Add description for vec3:length_3d_ignore_z()
---@example local result = vec3:length_3d_ignore_z()
---@since 1.0.0
function vec3:length_3d_ignore_z() end

---@return number
---@description Calculates the squared 3D length for performance efficiency.
---@example local sq_len = vec3.new(3, 4, 5):length_3d_squared() -- Returns 50.0
---@since 1.0.0
function vec3:length_3d_squared() end

---@param other vec3
---@return number
---@description Measures the distance to another vec3.
---@example local dist = vec3.new(0, 0, 0):dist_to(vec3.new(3, 4, 0)) -- Returns 5.0
---@return any
---@description TODO: Add description for vec3:dist_to(other)
---@example local result = vec3:dist_to(other)
---@since 1.0.0
function vec3:dist_to(other) end

---@param other vec3
---@return number
---@description Measures distance, ignoring Z coordinates.
---@example local dist = vec3.new(0, 0, 0):dist_to_ignore_z(vec3.new(3, 4, 5)) -- Returns 5.0
---@example local result = vec3:dist_to_ignore_z(other)
---@since 1.0.0
function vec3:dist_to_ignore_z(other) end

---@param other vec3
---@return number
---@description Calculates the squared distance for efficiency.
---@example local sq_dist = vec3.new(0, 0, 0):squared_dist_to(vec3.new(3, 4, 0)) -- Returns 25.0
---@since 1.0.0
function vec3:squared_dist_to(other) end

---@param other vec3
---@return number
---@description Squared distance calculation, excluding Z. Use this for performance in loops instead of dist_to_ignore_z(). See also: actors_manager.get_enemy_npcs() for enemy iteration.
---@example local sq_dist = vec3.new(0, 0, 0):squared_dist_to_ignore_z(vec3.new(3, 4, 5)) -- Returns 25.0
---@example -- Performance optimization in enemy checks
---@example local player_pos = get_player_position()
---@example local enemies = actors_manager.get_enemy_npcs()
---@example for _, enemy in ipairs(enemies) do
---@example     local dist_sq = enemy:get_position():squared_dist_to_ignore_z(player_pos)
---@example     if dist_sq < 64 then -- 8^2
---@example         -- Enemy is within 8 units
---@example     end
---@example end
---@description TODO: Add description for vec3:squared_dist_to_ignore_z(other)
---@example local result = vec3:squared_dist_to_ignore_z(other)
---@since 1.0.0
function vec3:squared_dist_to_ignore_z(other) end

---@param origin vec3
---@param degree number
---@return vec3
---@description Rotates this vec3 around a specified origin point by a given degree, altering its orientation.
---@return any
---@description TODO: Add description for vec3:rotate_around(origin, degree)
---@example local result = vec3:rotate_around(origin, degree)
---@since 1.0.0
function vec3:rotate_around(origin, degree) end

---@return vec2
---@description Projects the vec3 onto a 2D plane, typically by ignoring the Y coordinate, and returns a vec2.
---@description TODO: Add description for vec3:project_2d()
---@example local result = vec3:project_2d()
---@since 1.0.0
function vec3:project_2d() end

---@param other vec3
---@return vec3
---@description Computes the cross product of this vec3 and another vec3.
---@example local cross = vec3.new(1, 0, 0):cross(vec3.new(0, 1, 0)) -- Returns vec3.new(0, 0, 1)
---@return any
---@description TODO: Add description for vec3:cross(other)
---@example local result = vec3:cross(other)
---@since 1.0.0
function vec3:cross(other) end

---@return vec3
---@description The `vec3` class offers a comprehensive set of methods for 3D vector manipulation, pivotal for spatial calculations, movement, and graphical positioning in the Diablo Lua API.
---@return any
---@description TODO: Add description for vec3:get_unit_vector()
---@example local result = vec3:get_unit_vector()
---@since 1.0.0
function vec3:get_unit_vector() end

---@param target vec3
---@param units number
---@return vec3
---@description Extends this vec3 towards the target by the specified number of units.
---@example local extended = vec3.new(0, 0, 0):get_extended(vec3.new(1, 0, 0), 5.0)
---@return any
---@description TODO: Add description for vec3:get_extended(target, units)
---@example local result = vec3:get_extended(target, units)
---@since 1.0.0
function vec3:get_extended(target, units) end

---@param origin vec3
---@param factor number
---@return vec3
---@description Calculates the perpendicular left vector relative to the origin, scaled by the factor.
---@example local left = vec3.new(0, 0, 0):get_perp_left(vec3.new(1, 0, 0), 1.0)
---@return any
---@description TODO: Add description for vec3:get_perp_left(origin, factor)
---@example local result = vec3:get_perp_left(origin, factor)
---@since 1.0.0
function vec3:get_perp_left(origin, factor) end

---@param origin vec3
---@param factor number
---@return vec3
---@description Calculates the perpendicular right vector relative to the origin, scaled by the factor.
---@example local right = vec3.new(0, 0, 0):get_perp_right(vec3.new(1, 0, 0), 1.0)
---@return any
---@description TODO: Add description for vec3:get_perp_right(origin, factor)
---@example local result = vec3:get_perp_right(origin, factor)
---@since 1.0.0
function vec3:get_perp_right(origin, factor) end

---@param target vec3
---@param coefficient number
---@return vec3
---@description Linearly interpolates between this vec3 and the target vec3 based on the coefficient (0.0 to 1.0).
---@example local interpolated = vec3.new(0, 0, 0):lerp(vec3.new(10, 10, 10), 0.5) -- Returns vec3.new(5, 5, 5)
---@return any
---@description TODO: Add description for vec3:lerp(target, coefficient)
---@example local result = vec3:lerp(target, coefficient)
---@since 1.0.0
function vec3:lerp(target, coefficient) end

---@param other vec3
---@return number
---@description Calculates the relative angle between this vec3 and another vec3.
---@example local angle = vec3.new(1, 0, 0):get_relative_angle(vec3.new(0, 1, 0))
---@return any
---@description TODO: Add description for vec3:get_relative_angle(other)
---@example local result = vec3:get_relative_angle(other)
---@since 1.0.0
function vec3:get_relative_angle(other) end

---@return boolean
---@description The `vec3` class offers a comprehensive set of methods for 3D vector manipulation, pivotal for spatial calculations, movement, and graphical positioning in the Diablo Lua API.
---@return any
---@description TODO: Add description for vec3:is_nan()
---@example local result = vec3:is_nan()
---@since 1.0.0
function vec3:is_nan() end

---@return boolean
---@description The `vec3` class offers a comprehensive set of methods for 3D vector manipulation, pivotal for spatial calculations, movement, and graphical positioning in the Diablo Lua API.
---@return any
---@description TODO: Add description for vec3:is_zero()
---@example local result = vec3:is_zero()
---@since 1.0.0
function vec3:is_zero() end

---@param target vec3
---@param origin vec3
---@return number
---@description Calculates the angle between this vec3, the target vec3, and the origin vec3.
---@example local angle = vec3.new(0, 0, 0):get_angle(vec3.new(1, 0, 0), vec3.new(0, 1, 0))
---@return any
---@description TODO: Add description for vec3:get_angle(target, origin)
---@example local result = vec3:get_angle(target, origin)
---@since 1.0.0
function vec3:get_angle(target, origin) end

---@param target vec3
---@param origin vec3
---@return number
---@description Calculates the side of the angle between this vec3, the target vec3, and the origin vec3.
---@example local side = vec3.new(0, 0, 0):get_angle_side(vec3.new(1, 0, 0), vec3.new(0, 1, 0))
---@return any
---@description TODO: Add description for vec3:get_angle_side(target, origin)
---@example local result = vec3:get_angle_side(target, origin)
---@since 1.0.0
function vec3:get_angle_side(target, origin) end
