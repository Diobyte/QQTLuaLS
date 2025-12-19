---@meta

---@see https://github.com/qqtnn/qqt_diablo.wiki.git/wiki/Game-Object

---@class item_data

local item_data = {}

---@return string
---@description Retrieves the skin name of the item.
function item_data:get_skin_name() end

---@return string
---@description Provides the name of the item.
---@example local name = item_data:get_name()
function item_data:get_name() end

---@return string
---@description Provides the display name of the item.
function item_data:get_display_name() end

---@return boolean
---@description Indicates if the item is sacred.
function item_data:is_sacred() end

---@return boolean
---@description Checks if the item is ancestral.
function item_data:is_ancestral() end

---@return item_rarity
---@description Returns the rarity level of the item.
function item_data:get_rarity() end

---@return boolean
---@description Determines if the item is classified as junk.
function item_data:is_junk() end

---@return boolean
---@description Indicates if the item is locked.
function item_data:is_locked() end

---@return table
---@description Retrieves a table of affixes associated with the item.
function item_data:get_affixes() end

---@return number
---@description Provides the item's durability value.
function item_data:get_durability() end

---@return userdata
---@description Accesses internal ACD data (for advanced use).
function item_data:get_acd() end

---@return number
---@description Returns the SNO ID of the item.
function item_data:get_sno_id() end

---@return number
---@description Provides the balance offset of the item.
function item_data:get_balance_offset() end

---@return number
---@description Returns the row number in the inventory where the item is located.
function item_data:get_inventory_row() end

---@return number
---@description Returns the column number in the inventory where the item is located.
function item_data:get_inventory_column() end

---@return number
function item_data:get_price() end

---@return number
function item_data:get_stack_count() end

---@class item_data_affix

local item_data_affix = {}

---@return number
---@description Returns the roll value of the affix.
function item_data_affix:get_roll() end

---@return number
---@description Returns the minimum roll value.
function item_data_affix:get_roll_min() end

---@return number
---@description Returns the maximum roll value.
function item_data_affix:get_roll_max() end

---@return string
---@description Retrieves the name of the affix.
function item_data_affix:get_name() end

---@return number
---@description Provides the rarity type of the affix.
function item_data_affix:get_rarity_type() end

---@return userdata
---@description Accesses internal affix data (for advanced use).
function item_data_affix:get_affix_data() end

---@return number
---@description Returns the seed value used for the affix.
function item_data_affix:get_affix_seed() end
