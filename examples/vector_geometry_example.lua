-- Vector Operations and Geometry Example
-- Demonstrates advanced vector math and geometric operations

-- Utility functions for vector operations
local function calculate_distance_point_to_line(point, line_start, line_end)
    -- Calculate distance from point to line segment
    local line_vec = line_end - line_start
    local point_vec = point - line_start

    local line_length_sq = line_vec:length_3d_squared()
    if line_length_sq == 0 then
        return point_vec:length_3d() -- Line start and end are the same
    end

    local t = math.max(0, math.min(1, point_vec:dot_product(line_vec) / line_length_sq))
    local projection = line_start + line_vec * t

    return (point - projection):length_3d()
end

local function is_point_in_triangle(point, v1, v2, v3)
    -- Barycentric coordinate method
    local denom = (v2.y - v3.y) * (v1.x - v3.x) + (v3.x - v2.x) * (v1.y - v3.y)
    if math.abs(denom) < 0.0001 then return false end

    local a = ((v2.y - v3.y) * (point.x - v3.x) + (v3.x - v2.x) * (point.y - v3.y)) / denom
    local b = ((v3.y - v1.y) * (point.x - v3.x) + (v1.x - v3.x) * (point.y - v3.y)) / denom
    local c = 1 - a - b

    return a >= 0 and a <= 1 and b >= 0 and b <= 1 and c >= 0 and c <= 1
end

local function rotate_point_around_axis(point, axis, angle_degrees)
    -- Rodrigues' rotation formula for 3D rotation around an axis
    local angle_rad = math.rad(angle_degrees)
    local cos_theta = math.cos(angle_rad)
    local sin_theta = math.sin(angle_rad)

    local k = axis:normalize()
    local rotated = point * cos_theta +
        k:cross(point) * sin_theta +
        k * (k:dot_product(point)) * (1 - cos_theta)

    return rotated
end

-- Path prediction and smoothing
local function smooth_path(raw_path, smoothing_factor)
    if not raw_path or #raw_path < 3 then
        return raw_path
    end

    local smoothed = { raw_path[1] } -- Keep start point

    for i = 2, #raw_path - 1 do
        local prev = raw_path[i - 1]
        local curr = raw_path[i]
        local next_point = raw_path[i + 1]

        -- Simple Catmull-Rom spline interpolation
        local p0 = prev
        local p1 = curr
        local p2 = next_point

        -- Add intermediate points
        for t = 0.2, 0.8, 0.2 do
            local tt = t * t
            local ttt = tt * t

            local q = p0 * (-0.5 * ttt + tt - 0.5 * t) +
                p1 * (1.5 * ttt - 2.5 * tt + 1) +
                p2 * (-1.5 * ttt + 2 * tt + 0.5 * t)

            table.insert(smoothed, q)
        end
    end

    table.insert(smoothed, raw_path[#raw_path]) -- Keep end point
    return smoothed
end

-- Geometric shape operations
local function create_circle_points(center, radius, num_points)
    local points = {}
    for i = 1, num_points do
        local angle = (i - 1) * (2 * math.pi) / num_points
        local x = center.x + radius * math.cos(angle)
        local z = center.z + radius * math.sin(angle)
        table.insert(points, vec3.new(x, center.y, z))
    end
    return points
end

local function calculate_convex_hull(points)
    -- Simple gift wrapping algorithm for 2D convex hull
    if #points < 3 then return points end

    -- Convert to 2D (XZ plane)
    local points_2d = {}
    for _, p in ipairs(points) do
        table.insert(points_2d, vec2.new(p.x, p.z))
    end

    -- Find leftmost point
    local leftmost_idx = 1
    for i = 2, #points_2d do
        if points_2d[i].x < points_2d[leftmost_idx].x then
            leftmost_idx = i
        end
    end

    local hull = {}
    local p = leftmost_idx

    repeat
        table.insert(hull, points[p])
        local q = p % #points_2d + 1

        for i = 1, #points_2d do
            if i ~= p and i ~= q then
                -- Check orientation
                local o = (points_2d[q].y - points_2d[p].y) * (points_2d[i].x - points_2d[q].x) -
                    (points_2d[q].x - points_2d[p].x) * (points_2d[i].y - points_2d[q].y)

                if o < 0 then
                    q = i
                end
            end
        end

        p = q
    until p == leftmost_idx

    return hull
end

-- Demonstration functions
local function demonstrate_vector_math()
    print("Vector Math Demonstration:")

    -- Basic operations
    local v1 = vec3.new(1, 2, 3)
    local v2 = vec3.new(4, 5, 6)

    print("v1:", v1:to_string())
    print("v2:", v2:to_string())
    print("v1 + v2:", (v1 + v2):to_string())
    print("v1 · v2:", v1:dot_product(v2))
    print("v1 × v2:", v1:cross(v2):to_string())

    -- Normalization and angles
    local normalized = v1:normalize()
    print("v1 normalized:", normalized:to_string())
    print("Angle between v1 and v2:", math.deg(v1:get_relative_angle(v2)), "degrees")

    -- Projections
    local projected_2d = v1:project_2d()
    print("v1 projected to XZ plane:", projected_2d:to_string())
end

local function demonstrate_geometry()
    print("\nGeometry Demonstration:")

    local center = vec3.new(0, 0, 0)
    local circle_points = create_circle_points(center, 5.0, 8)

    print("Circle points around origin:")
    for i, point in ipairs(circle_points) do
        print(string.format("  Point %d: (%.2f, %.2f, %.2f)", i, point.x, point.y, point.z))
    end

    -- Test point-in-triangle
    local triangle = {
        vec2.new(0, 0),
        vec2.new(1, 0),
        vec2.new(0.5, 1)
    }

    local test_points = {
        vec2.new(0.5, 0.5), -- Inside
        vec2.new(1.5, 0.5), -- Outside
        vec2.new(0, 0)      -- On vertex
    }

    print("\nPoint-in-triangle test:")
    for _, point in ipairs(test_points) do
        local inside = is_point_in_triangle(point, triangle[1], triangle[2], triangle[3])
        print(string.format("  Point (%.1f, %.1f): %s", point.x, point.y, inside and "INSIDE" or "OUTSIDE"))
    end
end

-- Run demonstrations
demonstrate_vector_math()
demonstrate_geometry()

print("\nVector and Geometry example completed!")
print("This script demonstrates advanced mathematical operations available in QQTLuaLS.")
