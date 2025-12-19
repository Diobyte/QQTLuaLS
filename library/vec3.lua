---@meta

---@class vec3
local vec3_class = {}

---@overload fun(other: vec3): vec3
---@param x number
---@param y number
---@param z number
---@return vec3
function vec3(x, y, z) end

---@return vec3
function vec3_class:get_rotation() end

---@return vec3
function vec3_class:normalize_rotation() end

---@return vec3
function vec3_class:normalize() end

---@return number
function vec3_class:x() end

---@return number
function vec3_class:y() end

---@return number
function vec3_class:z() end

---@param other vec3
---@return boolean
function vec3_class:equals_ignore_z(other) end

---@param other vec3
---@param threshold number
---@return boolean
function vec3_class:equals_ignore_z_threshold(other, threshold) end

---@param segment_end vec3
---@param point vec3
---@param margin number
---@param radius number
---@param denominator number
---@return boolean
function vec3_class:intersects(segment_end, point, margin, radius, denominator) end

---@param other vec3
---@return boolean
function vec3_class:is_facing(other) end

---@return string
function vec3_class:to_string() end

---@param margin number
function vec3_class:randomize_xz(margin) end

---@return number
function vec3_class:length_2d() end

---@return number
function vec3_class:length_3d() end

---@return number
function vec3_class:length_3d_ignore_z() end

---@return number
function vec3_class:length_3d_squared() end

---@param other vec3
---@return number
function vec3_class:dist_to(other) end

---@param other vec3
---@return number
function vec3_class:dist_to_ignore_z(other) end

---@param other vec3
---@return number
function vec3_class:squared_dist_to(other) end

---@param other vec3
---@return number
function vec3_class:squared_dist_to_ignore_z(other) end

---@param origin vec3
---@param degree number
---@return vec3
function vec3_class:rotate_around(origin, degree) end

---@return vec2
function vec3_class:project_2d() end

---@param other vec3
---@return vec3
function vec3_class:cross(other) end

---@return vec3
function vec3_class:get_unit_vector() end

---@param target vec3
---@param units number
---@return vec3
function vec3_class:get_extended(target, units) end

---@param origin vec3
---@param factor number
---@return vec3
function vec3_class:get_perp_left(origin, factor) end

---@param origin vec3
---@param factor number
---@return vec3
function vec3_class:get_perp_right(origin, factor) end

---@param target vec3
---@param coefficient number
---@return vec3
function vec3_class:lerp(target, coefficient) end

---@param other vec3
---@return number
function vec3_class:get_relative_angle(other) end

---@return boolean
function vec3_class:is_nan() end

---@return boolean
function vec3_class:is_zero() end

---@param target vec3
---@param origin vec3
---@return number
function vec3_class:get_angle(target, origin) end

---@param target vec3
---@param origin vec3
---@return number
function vec3_class:get_angle_side(target, origin) end
