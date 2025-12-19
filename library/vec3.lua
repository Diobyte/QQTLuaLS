---@meta

---@class actors_manager
actors_manager = {}

function actors_manager.get_enemy_npcs() end

---@param x any
---@param y any
---@param z any
function vec3(x, y, z) end

---@param other any
function vec3(other) end

---@return vec3
function get_rotation() end

---@return vec3
function normalize_rotation() end

---@return vec3
function normalize() end

function x() end

function y() end

function z() end

---@param other any
function equals_ignore_z(other) end

---@param other any
---@param threshold any
function equals_ignore_z_threshold(other, threshold) end

---@param segment_end any
---@param point any
---@param margin any
---@param radius any
---@param denominator any
function intersects(segment_end, point, margin, radius, denominator) end

---@param other any
function is_facing(other) end

function to_string() end

---@param margin any
function randomize_xz(margin) end

function length_2d() end

function length_3d() end

function length_3d_ignore_z() end

function length_3d_squared() end

---@param other any
function dist_to(other) end

---@param other any
function dist_to_ignore_z(other) end

---@param other any
function squared_dist_to(other) end

---@param other any
function squared_dist_to_ignore_z(other) end

---@param origin any
---@param degree any
---@return vec3
function rotate_around(origin, degree) end

function project_2d() end

---@param other any
---@return vec3
function cross(other) end

function get_unit_vector() end

---@param target any
---@param units any
function get_extended(target, units) end

---@param origin any
---@param factor any
function get_perp_left(origin, factor) end

---@param origin any
---@param factor any
function get_perp_right(origin, factor) end

---@param target any
---@param coefficient any
function lerp(target, coefficient) end

---@param other any
function get_relative_angle(other) end

function is_nan() end

function is_zero() end

---@param target any
---@param origin any
function get_angle(target, origin) end

---@param target any
---@param origin any
function get_angle_side(target, origin) end

function get_player_position() end
