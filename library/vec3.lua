---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Vector-3

---@class vec3
---@description 3D vector utilities for world-space calculations.
---@operator add(vec3):vec3
---@operator sub(vec3):vec3
---@operator mul(number):vec3
---@operator div(number):vec3
---@operator unm:vec3

---@overload fun(x: number, y: number, z: number): vec3
---@overload fun(other: vec3): vec3
local vec3 = {}

---@param x number
---@param y number
---@param z number
---@return vec3
---@description Creates a new vec3 with the given coordinates.
---@since 1.0.0
function vec3.new(x, y, z) end

---@return vec3
---@description Rotation vector representing this direction.
---@since 1.0.0
function vec3:get_rotation() end

---@return vec3
---@description Normalizes this rotation vector.
---@since 1.0.0
function vec3:normalize_rotation() end

---@return vec3
---@description Normalized unit vector preserving direction.
---@since 1.0.0
function vec3:normalize() end

---@return number
---@description Returns the x-coordinate.
---@since 1.0.0
function vec3:x() end

---@return number
---@description Returns the y-coordinate.
---@since 1.0.0
function vec3:y() end

---@return number
---@description Returns the z-coordinate.
---@since 1.0.0
function vec3:z() end

---@param other vec3
---@return boolean
---@description Checks equality with another vec3 ignoring z.
---@since 1.0.0
function vec3:equals_ignore_z(other) end

---@param other vec3
---@param threshold number
---@return boolean
---@description Approximate equality ignoring z within threshold.
---@since 1.0.0
function vec3:equals_ignore_z_threshold(other, threshold) end

---@param segment_end vec3
---@param point vec3
---@param margin number
---@param radius number
---@param denominator number
---@return boolean
---@description Tests line segment intersection with a radius/denominator margin.
---@since 1.0.0
function vec3:intersects(segment_end, point, margin, radius, denominator) end

---@param other vec3
---@return boolean
---@description Returns true if this vector faces the given direction.
---@since 1.0.0
function vec3:is_facing(other) end

---@return string
---@description String representation of this vec3.
---@since 1.0.0
function vec3:to_string() end

---@param margin number
---@return vec3
---@description Randomizes x and z within the given margin.
---@since 1.0.0
function vec3:randomize_xz(margin) end

---@return number
---@description 2D length ignoring z.
---@since 1.0.0
function vec3:length_2d() end

---@return number
---@description Full 3D length.
---@since 1.0.0
function vec3:length_3d() end

---@return number
---@description 3D length ignoring z.
---@since 1.0.0
function vec3:length_3d_ignore_z() end

---@return number
---@description Squared 3D length.
---@since 1.0.0
function vec3:length_3d_squared() end

---@param other vec3
---@return number
---@description Distance to another vec3.
---@since 1.0.0
function vec3:dist_to(other) end

---@param other vec3
---@return number
---@description Distance to another vec3 ignoring z.
---@since 1.0.0
function vec3:dist_to_ignore_z(other) end

---@param other vec3
---@return number
---@description Squared distance to another vec3.
---@since 1.0.0
function vec3:squared_dist_to(other) end

---@param other vec3
---@return number
---@description Squared distance ignoring z for faster comparisons.
---@since 1.0.0
function vec3:squared_dist_to_ignore_z(other) end

---@param origin vec3
---@param degree number
---@return vec3
---@description Rotates this vec3 around origin by degree.
---@since 1.0.0
function vec3:rotate_around(origin, degree) end

---@return vec2
---@description Projects this vec3 to 2D space.
---@since 1.0.0
function vec3:project_2d() end

---@param other vec3
---@return vec3
---@description Cross product of this vector with another.
---@since 1.0.0
function vec3:cross(other) end

---@return vec3
---@description Unit vector in the same direction.
---@since 1.0.0
function vec3:get_unit_vector() end

---@param target vec3
---@param units number
---@return vec3
---@description Extends this vector toward target by units.
---@since 1.0.0
function vec3:get_extended(target, units) end

---@param origin vec3
---@param factor number
---@return vec3
---@description Perpendicular left vector relative to origin scaled by factor.
---@since 1.0.0
function vec3:get_perp_left(origin, factor) end

---@param origin vec3
---@param factor number
---@return vec3
---@description Perpendicular right vector relative to origin scaled by factor.
---@since 1.0.0
function vec3:get_perp_right(origin, factor) end

---@param target vec3
---@param coefficient number
---@return vec3
---@description Linear interpolation toward target by coefficient 0..1.
---@since 1.0.0
function vec3:lerp(target, coefficient) end

---@param other vec3
---@return number
---@description Relative angle between this vector and another.
---@since 1.0.0
function vec3:get_relative_angle(other) end

---@return boolean
---@description Returns true when any component is NaN.
---@since 1.0.0
function vec3:is_nan() end

---@return boolean
---@description Checks if the vector is exactly zero on all axes.
---@since 1.0.0
function vec3:is_zero() end

---@param target vec3
---@param origin vec3
---@return number
---@description Angle (degrees) from origin to target relative to this vector.
---@since 1.0.0
function vec3:get_angle(target, origin) end

---@param target vec3
---@param origin vec3
---@return number
---@description Signed angle indicating side (left/right) relative to origin.
---@since 1.0.0
function vec3:get_angle_side(target, origin) end

return vec3

