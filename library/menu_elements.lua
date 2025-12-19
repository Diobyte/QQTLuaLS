---@meta

---@see https://github.com/qqtnn/qqt_diablo.wiki.git/wiki/Menu-Elements

---@class button

local button = {}

---@param id number
---@return button
---@description Creates a new button menu element with the specified unique identifier.
---@example local my_button = button:new(get_hash("my_button"))
function button:new(id) end

---@class checkbox

local checkbox = {}

---@param default_state boolean
---@param id number
---@return checkbox
---@description Creates a new checkbox menu element with default state and unique identifier.
---@example local my_checkbox = checkbox:new(true, get_hash("my_checkbox"))
function checkbox:new(default_state, id) end

---@class combo_box

local combo_box = {}

---@param default_state number
---@param id number
---@return combo_box
---@description Creates a new combo box menu element with the specified default state and ID.
---@example local combo = combo_box:new(0, get_hash("my_combo"))
function combo_box:new(default_state, id) end

---@class input_text

local input_text = {}

---@param id number
---@return input_text
---@description Creates a new input text menu element with the specified ID.
---@example local input = input_text:new(get_hash("my_input"))
function input_text:new(id) end

---@class slider_int

local slider_int = {}

---@param min_value number
---@param max_value number
---@param default_value number
---@param id number
---@return slider_int
---@description Creates a new integer slider menu element with specified range and default value.
---@example local slider = slider_int:new(0, 100, 50, get_hash("my_slider"))
function slider_int:new(min_value, max_value, default_value, id) end

---@class slider_float

local slider_float = {}

---@param min_value number
---@param max_value number
---@param default_value number
---@param id number
---@param rounding number
---@return slider_float
---@description Creates a new float slider menu element with specified range, default value, and rounding precision.
---@example local slider = slider_float:new(0.0, 1.0, 0.5, get_hash("my_slider"), 2)
function slider_float:new(min_value, max_value, default_value, id, rounding) end

---@class tree_node

local tree_node = {}

---@param node_depth number
---@return tree_node
---@description Creates a new tree node menu element with the specified depth level.
---@example local node = tree_node:new(1)
function tree_node:new(node_depth) end

---@class colorpicker

local colorpicker = {}

---@param id number
---@param default_color color
---@return colorpicker
---@description Creates a new color picker menu element with the specified ID and default color.
---@example local picker = colorpicker:new(get_hash("my_color"), color_red(255))
function colorpicker:new(id, default_color) end

---@overload fun(button_name: string, tooltip: string, activation_delay: number, click_type: button_click): any
---@overload fun(label: string, tooltip: string): any
---@overload fun(label: string, items: table, tooltip: string): any
---@overload fun(label: string, tooltip: string, require_button: boolean, button_label: string, button_tooltip: string): any
---@overload fun(label: string, tooltip: string, rounding: number): any
---@overload fun(label: string, tooltip: string): any
---@overload fun(label: string, tooltip: string, show_on_button_press: boolean, button_label: string, button_tooltip: string): any
---@param button_name string
---@param tooltip string
---@param activation_delay number
---@param click_type button_click
---@return any
---@description Buttons are fundamental for triggering actions and navigating menus. The unique ID is crucial for distinguishing different buttons.
function render(button_name, tooltip, activation_delay, click_type) end

---@overload fun(): any
---@overload fun(): any
---@overload fun(): any
---@overload fun(): any
---@overload fun(): any
---@overload fun(): any
---@return any
---@description Buttons are fundamental for triggering actions and navigating menus. The unique ID is crucial for distinguishing different buttons.
function get() end

---@param number number
---@return any
---@description Buttons are fundamental for triggering actions and navigating menus. The unique ID is crucial for distinguishing different buttons.
function set_id(number) end

---@return any
---@description Buttons are fundamental for triggering actions and navigating menus. The unique ID is crucial for distinguishing different buttons.
function get_full() end

---@overload fun(value: boolean): any
---@overload fun(value: boolean): any
---@overload fun(key: number, toggle: boolean, mode: number): any
---@overload fun(color: any): any
---@param value boolean
---@return any
---@description Checkboxes are ideal for enabling or disabling features and settings within the menu.
function set(value) end

---@return any
---@description Input Text fields are versatile for user inputs, from simple text entries to coordinates and numerical values.
function get_in_vec3() end

---@return boolean
---@description Input Text fields are versatile for user inputs, from simple text entries to coordinates and numerical values.
function is_open() end

---@param int any
---@param bool any
---@param uint32_t any
---@return any
function keybind(int, bool, uint32_t) end

---@return any
function get_state() end

---@return any
function get_key() end
