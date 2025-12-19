---@meta

---@see https://github.com/qqtnn/qqt_diablo.wiki.git/wiki/Orbwalker

---@class orbwalker

local orbwalker = {}

---@return number
---@description Returns the current orbwalker mode as an integer identifier.
---@example local mode = orbwalker.get_orb_mode()
function orbwalker.get_orb_mode() end

---@param mode number
---@return nil
---@description Sets the orbwalker mode to the specified integer value.
---@example orbwalker.set_orbwalker_mode(orb_mode.pvp)
function orbwalker.set_orbwalker_mode(mode) end

---@param value boolean
---@return nil
---@description Toggles the clear mode on or off. When enabled, the orbwalker will focus on clearing camps or waves.
---@example orbwalker.set_clear_toggle(true)
function orbwalker.set_clear_toggle(value) end

---@param value boolean
---@return nil
---@description Controls whether movement is blocked during orbwalking. Useful for precise positioning.
---@example orbwalker.set_block_movement(false)
function orbwalker.set_block_movement(value) end

---@param value boolean
---@return nil
---@description Enables or disables automatic looting of items during orbwalking.
---@example orbwalker.set_auto_loot_toggle(true)
function orbwalker.set_auto_loot_toggle(value) end
