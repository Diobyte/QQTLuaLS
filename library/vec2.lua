---@meta

---@param x any
---@param y any
function vec2(x, y) end

function is_zero() end

function project_3d() end

---@param other any
function distance(other) end

---@param other any
function distance_squared(other) end

function intersects() end

function length() end

---@param other any
function dot_product(other) end

function get_unit_vector() end

---@param point any
---@param origin any
function get_angle(point, origin) end

---@param target any
---@param dist any
function get_extended(target, dist) end

function screen_to_coordinate() end

function coordinate_to_screen() end

---@param origin any
---@param degree any
function rotate_around(origin, degree) end

---@param other any
function equals(other) end
