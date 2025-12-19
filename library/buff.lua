---@meta

---@see https://github.com/qqtnn/qqt_diablo.wiki.git/wiki/Game-Object

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
function buff:get_name() end

---@return number
---@description Retrieves the end time of the buff.
---@example local end_time = buff:get_end_time()
function buff:get_end_time() end

---@return number
---@description Retrieves the remaining time of the buff.
---@example local remaining = buff:get_remaining_time()
function buff:get_remaining_time() end

---@return number
---@description Retrieves the duration of the buff.
---@example local duration = buff:get_duration()
function buff:get_duration() end

---@return boolean
---@description Checks if the buff is active.
function buff:is_active_buff() end
