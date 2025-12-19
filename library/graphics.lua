---@meta

---@class graphics
graphics = {}

---@param pos any
---@param radius any
---@param color any
function graphics.circle_2d_filled(pos, radius, color) end

---@param pos any
---@param radius any
---@param color any
---@param thickness any
function graphics.circle_2d(pos, radius, color, thickness) end

---@param pos any
---@param radius any
---@param color any
function graphics.circle_2d(pos, radius, color) end

---@param text any
---@param pos any
---@param size any
---@param color any
function graphics.text_3d(text, pos, size, color) end

---@param "Hello World" any
---@param get_player_position() any
---@param 15 any
---@param color_white(255) any
function graphics.text_3d("Hello World", get_player_position(), 15, color_white(255)) end

---@param from any
---@param to any
---@param color any
---@param thickness any
function graphics.line(from, to, color, thickness) end

---@param from any
---@param to any
---@param color any
---@param rounding any
---@param thickness any
function graphics.rect(from, to, color, rounding, thickness) end

---@param from any
---@param to any
---@param color any
function graphics.rect_filled(from, to, color) end

---@param path_to_asset any
function graphics.load_image(path_to_asset) end

---@param image any
---@param pos any
function graphics.draw_image(image, pos) end

---@param start_position any
function graphics.w2s(start_position) end

---@param pos any
---@param radius any
---@param color any
function graphics.circle_3d(pos, radius, color) end

---@param text any
---@param pos any
---@param size any
---@param color any
function graphics.l_text(text, pos, size, color) end

---@param from any
---@param to any
---@param width any
---@param color any
---@param thickness any
function graphics.rect_3d(from, to, width, color, thickness) end
