---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Callbacks

---@param callback function
---@return nil
---@description All graphics-related elements must be placed inside this callback.
---@example local result = on_render(callback)()
---@since 1.0.0
function on_render(callback) end

---@param callback function
---@return nil
---@description Ideal for most game logics and spell casts.
---@return any
---@description TODO: Add description for on_update(callback)
---@example local result = on_update(callback)()
---@since 1.0.0
function on_update(callback) end

---@param callback function
---@return nil
---@description Designed for logics requiring anticipation of the next game tick.
---@return any
---@description TODO: Add description for on_pre_tick(callback)
---@example local result = on_pre_tick(callback)()
---@since 1.0.0
function on_pre_tick(callback) end

---@param callback function
---@return nil
---@description All menu elements must be rendered in this callback. [!WARNING] All menu elements id must be unique otherwise they will overlap with other menu elements at saving.
---@example local result = on_render_menu(callback)()
---@since 1.0.0
function on_render_menu(callback) end

---@param callback function
---@return nil
---@description Triggers when any key is either press or released.
---@return any
---@description TODO: Add description for on_key_press(callback)
---@example local result = on_key_press(callback)()
---@since 1.0.0
function on_key_press(callback) end

---@param callback function
---@return nil
---@description Triggers when any key is either press or released.
---@return any
---@description TODO: Add description for on_key_release(callback)
---@example local result = on_key_release(callback)()
---@since 1.0.0
function on_key_release(callback) end
