---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Callbacks

---@alias OnRenderCallback fun(delta_time: number)
---@alias OnUpdateCallback fun()
---@alias OnKeyCallback fun(key_code: number, pressed: boolean)

---@class callbacks
callbacks = {}

---@param callback OnRenderCallback
---@return nil
---@description All graphics-related elements must be placed inside this callback.
---@example on_render(function(delta) graphics.circle_3d(player_pos, 5, color_white(255)) end)
---@since 1.0.0
function on_render(callback) end

---@param callback OnUpdateCallback
---@return nil
---@description Ideal for most game logics and spell casts.
---@example on_update(function() cast_spell.cast_spell(player, spell_data.get_spell_by_name("Fireball")) end)
---@since 1.0.0
function on_update(callback) end

---@param callback function
---@return nil
---@description Designed for logics requiring anticipation of the next game tick.
---@example on_pre_tick(function() evade.evade_dangerous_spell() end)
---@since 1.0.0
function on_pre_tick(callback) end

---@param callback function
---@return nil
---@description All menu elements must be rendered in this callback. [!WARNING] All menu elements id must be unique otherwise they will overlap with other menu elements at saving.
---@example on_render_menu(function() menu_elements.checkbox("Enable Auto Play", "enable_auto_play") end)
---@since 1.0.0
function on_render_menu(callback) end

---@param callback OnKeyCallback
---@return nil
---@description Triggers when any key is either press or released.
---@example on_key_press(function(key, pressed) if key == 32 and pressed then console.print("Space pressed") end end)
---@since 1.0.0
function on_key_press(callback) end

---@param callback OnKeyCallback
---@return nil
---@description Triggers when any key is either press or released.
---@example on_key_release(function(key, pressed) if key == 27 then console.print("Escape released") end end)
---@since 1.0.0
function on_key_release(callback) end

---@return any
function callbacks:on_render()
end

---@return any
function callbacks:on_update()
end

---@return any
function callbacks:on_pre_tick()
end

---@return any
function callbacks:on_render_menu()
end

---@return any
function callbacks:on_key_press()
end

---@return any
function callbacks:on_key_release()
end
