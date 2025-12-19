---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Graphics

---@class graphics

local graphics = {}

---@param pos vec2
---@param radius number
---@param color color
---@return nil
---@description This function draws a solid, filled circle in 2D space. Useful for highlighting areas or points on the screen.
---@example graphics.circle_2d_filled(vec2.new(100, 100), 50, color_red(255))
---@since 1.0.0
function graphics.circle_2d_filled(pos, radius, color) end

---@overload fun(self, pos: vec2, radius: number, color: color, thickness: number): nil
---@overload fun(self, pos: vec3, radius: number, color: color): nil
---@param pos vec2
---@param radius number
---@param color color
---@param thickness number
---@return nil
---@description Creates a 2D circle outline. Ideal for marking areas without obscuring underlying details.
---@example graphics.circle_2d(vec2.new(200, 200), 30, color_blue(255), 2)
---@return any
---@description TODO: Add description for graphics.circle_2d(pos, radius, color, thickness)
---@example local result = graphics.circle_2d(pos, radius, color, thickness)()
---@since 1.0.0
function graphics.circle_2d(pos, radius, color, thickness) end

---@overload fun(self, text: string, pos: vec3, size: number, color: color): nil
---@param text string
---@param pos vec3
---@param size number
---@param color color
---@return nil
---@description This function allows displaying text in a 3D space, which can float above game objects or specific locations.
---@example graphics.text_3d("Hello World", get_player_position(), 15, color_white(255))
---@return any
---@description TODO: Add description for graphics.text_3d(text, pos, size, color)
---@example local result = graphics.text_3d(text, pos, size, color)()
---@since 1.0.0
function graphics.text_3d(text, pos, size, color) end

---@param from vec2
---@param to vec2
---@param color color
---@param thickness number
---@return nil
---@description Useful for connecting two points with a visible line, aiding in mapping paths or connections between elements.
---@example graphics.line(vec2.new(0, 0), vec2.new(100, 100), color_green(255), 1)
---@example local result = graphics.line(from, to, color, thickness)()
---@since 1.0.0
function graphics.line(from, to, color, thickness) end

---@param from vec2
---@param to vec2
---@param color color
---@param rounding number
---@param thickness number
---@return nil
---@description Outlines a rectangular area on the screen, perfect for framing sections or creating boundaries.
---@example graphics.rect(vec2.new(50, 50), vec2.new(150, 150), color_yellow(255), 5, 2)
---@return any
---@description TODO: Add description for graphics.rect(from, to, color, rounding, thickness)
---@example local result = graphics.rect(from, to, color, rounding, thickness)()
---@since 1.0.0
function graphics.rect(from, to, color, rounding, thickness) end

---@param from vec2
---@param to vec2
---@param color color
---@return nil
---@description Fills a specified rectangular area with color. Great for background elements or highlighting zones.
---@example graphics.rect_filled(vec2.new(50, 50), vec2.new(150, 150), color_black(200))
---@return any
---@description TODO: Add description for graphics.rect_filled(from, to, color)
---@example local result = graphics.rect_filled(from, to, color)()
---@since 1.0.0
function graphics.rect_filled(from, to, color) end

---@param path_to_asset string
---@return any -- image object
---@description Loads an image from the specified file path, preparing it for rendering in the game environment.
---@example local img = graphics.load_image("path/to/image.png")
---@description TODO: Add description for graphics.load_image(path_to_asset)
---@example local result = graphics.load_image(path_to_asset)()
---@since 1.0.0
function graphics.load_image(path_to_asset) end

---@param image any
---@param pos vec2
---@return nil
---@description Renders a previously loaded image at a specified position. Ideal for adding custom visuals or icons.
---@example graphics.draw_image(img, vec2.new(0, 0))
---@example local result = graphics.draw_image(image, pos)()
---@since 1.0.0
function graphics.draw_image(image, pos) end

---@param start_position vec3
---@return vec2
---@description Converts a 3D world position to a 2D screen position, bridging the gap between game world and screen space.
---@example local screen_pos = graphics.w2s(get_player_position())
---@return any
---@description TODO: Add description for graphics.w2s(start_position)
---@example local result = graphics.w2s(start_position)()
---@since 1.0.0
function graphics.w2s(start_position) end

---@param pos vec3
---@param radius number
---@param color color
---@return nil
---@description Draws a circle that appears in 3D space, useful for encircling objects or points of interest.
---@example graphics.circle_3d(vec3.new(0, 0, 0), 5, color_red(255))
---@return any
---@description TODO: Add description for graphics.circle_3d(pos, radius, color)
---@example local result = graphics.circle_3d(pos, radius, color)()
---@since 1.0.0
function graphics.circle_3d(pos, radius, color) end

---@param text string
---@param pos vec3
---@param size number
---@param color color
---@return nil
---@description This function is designed for displaying large, noticeable text in a 3D environment.
---@example graphics.l_text("Important!", vec3.new(10, 0, 10), 20, color_white(255))
---@return any
---@description TODO: Add description for graphics.l_text(text, pos, size, color)
---@example local result = graphics.l_text(text, pos, size, color)()
---@since 1.0.0
function graphics.l_text(text, pos, size, color) end

---@param from vec3
---@param to vec3
---@param width number
---@param color color
---@param thickness number
---@return nil
---@description Creates a 3D rectangular shape, extending between two points in space. Effective for visualizing areas or paths in the game world.
---@example graphics.rect_3d(vec3.new(0,0,0), vec3.new(10,0,10), 2, color_blue(255), 1)
---@return any
---@description TODO: Add description for graphics.rect_3d(from, to, width, color, thickness)
---@example local result = graphics.rect_3d(from, to, width, color, thickness)()
---@since 1.0.0
function graphics.rect_3d(from, to, width, color, thickness) end
