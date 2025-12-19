---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Menu-Elements

---@class button
---@class checkbox
---@class combo_box
---@class input_text
---@class slider_int
---@class slider_float
---@class tree_node
---@class colorpicker

---@class menu_elements
local menu_elements = {}

---@param id number
---@return button
---@description Creates a button element identified by a unique hash/id.
---@since 1.0.0
---@example local btn = menu_elements.button_new(get_hash("start"))
function menu_elements.button_new(id) end

---@param default_state boolean
---@param id number
---@return checkbox
---@description Creates a checkbox with a default state and unique id.
---@since 1.0.0
function menu_elements.checkbox_new(default_state, id) end

---@param default_state number
---@param id number
---@return combo_box
---@description Creates a combo box with a default selection and unique id.
---@since 1.0.0
function menu_elements.combo_box_new(default_state, id) end

---@param id number
---@return input_text
---@description Creates an input text field.
---@since 1.0.0
function menu_elements.input_text_new(id) end

---@param min_value number
---@param max_value number
---@param default_value number
---@param id number
---@return slider_int
---@description Creates an integer slider element.
---@since 1.0.0
function menu_elements.slider_int_new(min_value, max_value, default_value, id) end

---@param min_value number
---@param max_value number
---@param default_value number
---@param id number
---@param rounding number
---@return slider_float
---@description Creates a float slider element.
---@since 1.0.0
function menu_elements.slider_float_new(min_value, max_value, default_value, id, rounding) end

---@param node_depth number
---@return tree_node
---@description Creates a tree node for hierarchical menus.
---@since 1.0.0
function menu_elements.tree_node_new(node_depth) end

---@param id number
---@param default_color color
---@return colorpicker
---@description Creates a color picker element.
---@since 1.0.0
function menu_elements.colorpicker_new(id, default_color) end

---@param label string
---@param tooltip string
---@param activation_delay number|nil
---@param click_type button_click|nil
---@return any
---@description Renders a button or menu control; overload behavior depends on supplied parameters.
---@since 1.0.0
function menu_elements.render(label, tooltip, activation_delay, click_type) end

---@return any
---@description Retrieves the current menu value for the last element context.
---@since 1.0.0
function menu_elements.get() end

---@param id number
---@return nil
---@description Sets the current element id context.
---@since 1.0.0
function menu_elements.set_id(id) end

---@return any
---@description Retrieves the full value/structure for the current element.
---@since 1.0.0
function menu_elements.get_full() end

---@param value any
---@return nil
---@description Sets the value for the current element.
---@since 1.0.0
function menu_elements.set(value) end

---@return vec3
---@description Reads a vec3 value from an input element.
---@since 1.0.0
function menu_elements.get_in_vec3() end

---@return boolean
---@description Indicates if the current element/menu is open.
---@since 1.0.0
function menu_elements.is_open() end

---@param key number
---@param toggle boolean
---@param mode number
---@return any
---@description Declares a keybind element and returns its state.
---@since 1.0.0
function menu_elements.keybind(key, toggle, mode) end

---@return any
---@description Returns the current state of the active menu element.
---@since 1.0.0
function menu_elements.get_state() end

---@return any
---@description Returns the key assigned to the current keybind element.
---@since 1.0.0
function menu_elements.get_key() end

return menu_elements
