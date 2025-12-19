---@meta

---@see https://github.com/qqtnn/qqt_diablo/wiki/Game-Object

---@class buff
---@field instance number
---@field type number
---@field name_hash number
---@field start_tick number
---@field duration number
---@field flags number

local buff = {}

---@return string
---@description Returns the name of the buff.
---@example local buff_name = buff:get_name()
---@since 1.0.0
function buff:get_name() end

---@return string
---@description Alias for get_name to match wiki examples.
---@since 1.0.0
function buff:name() end

---@return number
---@description Retrieves the absolute end time tick for this buff.
---@example local end_time = buff:get_end_time()
---@since 1.0.0
function buff:get_end_time() end

---@return number
---@description Retrieves the remaining time of the buff.
---@example local remaining = buff:get_remaining_time()
---@since 1.0.0
function buff:get_remaining_time() end

---@return number
---@description Retrieves the full duration of the buff in ticks.
---@example local duration = buff:get_duration()
---@since 1.0.0
function buff:get_duration() end

---@return boolean
---@description Checks if the buff is currently flagged as active.
---@example local active = buff:is_active_buff()
---@since 1.0.0
function buff:is_active_buff() end

return buff
