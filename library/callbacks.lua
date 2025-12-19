---@meta

---@see https://github.com/qqtnn/qqt_diablo.wiki.git/wiki/Callbacks

---@---@param callback function
---@return nil
---@description All graphics-related elements must be placed inside this callback.
function on_render(callback) end

---@param callback function
---@return nil
---@description Ideal for most game logics and spell casts.
function on_update(callback) end

---@param callback function
---@return nil
---@description Designed for logics requiring anticipation of the next game tick.
function on_pre_tick(callback) end

---@param callback function
---@return nil
---@description All menu elements must be rendered in this callback. [!WARNING] All menu elements id must be unique otherwise they will overlap with other menu elements at saving.
function on_render_menu(callback) end

---@param callback function
---@return nil
---@description Triggers when any key is either press or released.
function on_key_press(callback) end

---@param callback function
---@return nil
---@description Triggers when any key is either press or released.
function on_key_release(callback) end
