---@meta

---@see https://github.com/qqtnn/qqt_diablo/wiki/Graphics

---@class graphics
---@description Rendering helpers for shapes, text, and images in 2D/3D.
local graphics = {}

---@param pos vec2
---@param radius number
---@param color color
---@return nil
---@description Draws a filled 2D circle (useful for highlights or markers).
---@example graphics.circle_2d_filled(vec2.new(100, 100), 50, color_red(255))
---@since 1.0.0
function graphics.circle_2d_filled(pos, radius, color) end

---@overload fun(pos: vec3, radius: number, color: color): nil
---@param pos vec2
---@param radius number
---@param color color
---@param thickness number
---@return nil
---@description Draws a 2D circle outline. Accepts vec2 or vec3 centers; with vec3 the circle projects from world space.
---@example graphics.circle_2d(vec2.new(200, 200), 30, color_blue(255), 2)
---@example graphics.circle_2d(get_player_position(), 6.0, color_green(200), 1)
---@since 1.0.0
function graphics.circle_2d(pos, radius, color, thickness) end

---@param text string
---@param pos vec3
---@param size number
---@param color color
---@return nil
---@description Renders text in 3D space (above actors or positions).
---@example graphics.text_3d("Hello World", get_player_position(), 15, color_white(255))
---@since 1.0.0
function graphics.text_3d(text, pos, size, color) end

---@param from vec2
---@param to vec2
---@param color color
---@param thickness number
---@return nil
---@description Draws a line between two screen positions; `thickness` controls stroke width.
---@example graphics.line(vec2.new(0, 0), vec2.new(100, 100), color_green(255), 1)
---@since 1.0.0
function graphics.line(from, to, color, thickness) end

---@param from vec2
---@param to vec2
---@param color color
---@param rounding number
---@param thickness number
---@return nil
---@description Draws a rectangle outline; rounding adds corner radius and thickness controls stroke width.
---@example graphics.rect(vec2.new(50, 50), vec2.new(150, 150), color_yellow(255), 5, 2)
---@since 1.0.0
function graphics.rect(from, to, color, rounding, thickness) end

---@param from vec2
---@param to vec2
---@param color color
---@return nil
---@description Fills a rectangular area with solid color (useful for bars and overlays).
---@example graphics.rect_filled(vec2.new(50, 50), vec2.new(150, 150), color_black(200))
---@since 1.0.0
function graphics.rect_filled(from, to, color) end

---@param path_to_asset string
---@return any -- image object
---@description Loads an image from disk and returns a handle for rendering.
---@example local img = graphics.load_image("path/to/image.png")
---@since 1.0.0
function graphics.load_image(path_to_asset) end

---@param image any
---@param pos vec2
---@return nil
---@description Draws a loaded image at the given 2D screen position.
---@example graphics.draw_image(img, vec2.new(0, 0))
---@since 1.0.0
function graphics.draw_image(image, pos) end

---@param start_position vec3
---@return vec2
---@description Converts a 3D world position to a 2D screen coordinate.
---@example local screen_pos = graphics.w2s(get_player_position())
---@since 1.0.0
function graphics.w2s(start_position) end

---@param pos vec3
---@param radius number
---@param color color
---@return nil
---@description Draws a circle in 3D world space to highlight an actor or location.
---@example graphics.circle_3d(vec3.new(0, 0, 0), 5, color_red(255))
---@since 1.0.0
function graphics.circle_3d(pos, radius, color) end

---@param text string
---@param pos vec3
---@param size number
---@param color color
---@return nil
---@description Displays large, attention-grabbing text in 3D space.
---@example graphics.l_text("Important!", vec3.new(10, 0, 10), 20, color_white(255))
---@since 1.0.0
function graphics.l_text(text, pos, size, color) end

---@param text string
---@param pos vec2
---@param size number
---@param color color
---@return nil
---@description Renders large text in 2D screen space (HUD-style alternative to l_text).
---@example graphics.l_text_2d("Boss incoming", vec2.new(500, 120), 24, color_yellow(255))
---@since 1.0.0
function graphics.l_text_2d(text, pos, size, color) end

---@param from vec3
---@param to vec3
---@param width number
---@param color color
---@param thickness number
---@return nil
---@description Draws a 3D rectangular prism between two world points; width and thickness control size and stroke.
---@example graphics.rect_3d(vec3.new(0,0,0), vec3.new(10,0,10), 2, color_blue(255), 1)
---@since 1.0.0
function graphics.rect_3d(from, to, width, color, thickness) end
