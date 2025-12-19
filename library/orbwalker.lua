---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Orbwalker

---@class orbwalker
---@description Combat movement controller.

local orbwalker = {}

---@return number
---@description Current orbwalker mode id.
---@since 1.0.0
---@example local mode = orbwalker.get_orb_mode()
function orbwalker.get_orb_mode() end

---@param mode number
---@return nil
---@description Set orbwalker mode.
---@since 1.0.0
function orbwalker.set_orbwalker_mode(mode) end

---@param value boolean
---@return nil
---@description Toggle clear mode.
---@since 1.0.0
function orbwalker.set_clear_toggle(value) end

---@param value boolean
---@return nil
---@description Toggle movement blocking.
---@since 1.0.0
function orbwalker.set_block_movement(value) end

---@param value boolean
---@return nil
---@description Toggle auto-loot while orbwalking.
---@since 1.0.0
function orbwalker.set_auto_loot_toggle(value) end

return orbwalker
