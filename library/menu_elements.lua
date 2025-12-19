---@meta

---@class button
button = {}

---@param id any
function button.new(id) end

---@class checkbox
checkbox = {}

---@param default_state any
---@param id any
function checkbox.new(default_state, id) end

---@class combo_box
combo_box = {}

---@param default_state any
---@param id any
function combo_box.new(default_state, id) end

---@class input_text
input_text = {}

---@param id any
function input_text.new(id) end

---@class slider_int
slider_int = {}

---@param min_value any
---@param max_value any
---@param default_value any
---@param id any
function slider_int.new(min_value, max_value, default_value, id) end

---@class slider_float
slider_float = {}

---@param min_value any
---@param max_value any
---@param default_value any
---@param id any
---@param rounding any
function slider_float.new(min_value, max_value, default_value, id, rounding) end

---@class tree_node
tree_node = {}

---@param node_depth any
function tree_node.new(node_depth) end

---@class colorpicker
colorpicker = {}

---@param id any
---@param default_color any
function colorpicker.new(id, default_color) end

---@param button_name any
---@param tooltip any
---@param activation_delay any
---@param click_type any
function render(button_name, tooltip, activation_delay, click_type) end

function get() end

---@param number any
function set_id(number) end

function get_full() end

---@param label any
---@param tooltip any
function render(label, tooltip) end

function get() end

---@param value any
function set(value) end

---@param label any
---@param items any
---@param tooltip any
function render(label, items, tooltip) end

function get() end

---@param value any
function set(value) end

---@param label any
---@param tooltip any
---@param require_button any
---@param button_label any
---@param button_tooltip any
function render(label, tooltip, require_button, button_label, button_tooltip) end

function get() end

function get_in_vec3() end

function is_open() end

---@param label any
---@param tooltip any
---@param rounding any
function render(label, tooltip, rounding) end

function get() end

---@param key number
---@param pressed boolean
---@param flags number
function keybind(key, pressed, flags) end

---@param label any
---@param tooltip any
function render(label, tooltip) end

function get_state() end

function get_key() end

---@param key any
---@param toggle any
---@param mode any
function set(key, toggle, mode) end

---@param label any
---@param tooltip any
---@param show_on_button_press any
---@param button_label any
---@param button_tooltip any
function render(label, tooltip, show_on_button_press, button_label, button_tooltip) end

function get() end

---@param color any
function set(color) end
