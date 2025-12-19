---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Callbacks

---@alias OnRenderCallback fun(delta_time: number)
---@alias OnUpdateCallback fun()
---@alias OnKeyCallback fun(key_code: number, pressed: boolean)

---@class callbacks
local callbacks = {}

---@param callback OnRenderCallback
---@return nil
---@description Registers a render callback fired every frame with delta_time.
---@since 1.0.0
function callbacks.on_render(callback) end

---@param callback OnUpdateCallback
---@return nil
---@description Registers an update callback fired every tick.
---@since 1.0.0
function callbacks.on_update(callback) end

---@param callback OnUpdateCallback
---@return nil
---@description Registers a pre-tick callback executed before each game tick.
---@since 1.0.0
function callbacks.on_pre_tick(callback) end

---@param callback OnUpdateCallback
---@return nil
---@description Registers a render-menu callback for drawing UI.
---@since 1.0.0
function callbacks.on_render_menu(callback) end

---@param callback OnKeyCallback
---@return nil
---@description Registers a key press handler.
---@since 1.0.0
function callbacks.on_key_press(callback) end

---@param callback OnKeyCallback
---@return nil
---@description Registers a key release handler.
---@since 1.0.0
function callbacks.on_key_release(callback) end

return callbacks
