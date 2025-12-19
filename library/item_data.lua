---@meta

---@see https://github.com/qqtnn/qqt_diablo/wiki/Item-Data

---@class item_data
local item_data = {}

---@return string
---@description Retrieves the skin name of the item.
---@since 1.0.0
---@example local skin = item:get_skin_name()
function item_data:get_skin_name() end

---@return boolean
---@description Indicates whether the item data handle is valid.
---@since 1.0.0
function item_data:is_valid() end

---@return string
---@description Provides the name of the item.
---@since 1.0.0
function item_data:get_name() end

---@return string
---@description Provides the display name of the item.
---@since 1.0.0
function item_data:get_display_name() end

---@return boolean
---@description Indicates if the item is sacred.
---@since 1.0.0
function item_data:is_sacred() end

---@return boolean
---@description Checks if the item is ancestral.
---@since 1.0.0
function item_data:is_ancestral() end

---@return item_rarity
---@description Returns the rarity level of the item.
---@since 1.0.0
function item_data:get_rarity() end

---@return boolean
---@description Determines if the item is classified as junk.
---@since 1.0.0
function item_data:is_junk() end

---@return boolean
---@description Indicates if the item is locked.
---@since 1.0.0
function item_data:is_locked() end

---@return item_data_affix[]
---@description Retrieves a table of affixes associated with the item.
---@since 1.0.0
function item_data:get_affixes() end

---@return number
---@description Provides the item's durability value.
---@since 1.0.0
function item_data:get_durability() end

---@return userdata
---@description Accesses internal ACD data (for advanced use).
---@since 1.0.0
function item_data:get_acd() end

---@return number
---@description Returns the SNO ID of the item.
---@since 1.0.0
function item_data:get_sno_id() end

---@return number
---@description Provides the balance offset of the item.
---@since 1.0.0
function item_data:get_balance_offset() end

---@return number
---@description Returns the row number in the inventory where the item is located.
---@since 1.0.0
function item_data:get_inventory_row() end

---@return number
---@description Returns the column number in the inventory where the item is located.
---@since 1.0.0
function item_data:get_inventory_column() end

---@return number
---@description Returns the item price.
---@since 1.0.0
function item_data:get_price() end

---@return number
---@description Returns the current stack count.
---@since 1.0.0
function item_data:get_stack_count() end

---@class item_data_affix
---@field affix_name_hash number
---@field balance_offset number
local item_data_affix = {}

---@return number
---@description Returns the roll value of the affix.
---@since 1.0.0
function item_data_affix:get_roll() end

---@return number
---@description Returns the minimum roll value.
---@since 1.0.0
function item_data_affix:get_roll_min() end

---@return number
---@description Returns the maximum roll value.
---@since 1.0.0
function item_data_affix:get_roll_max() end

---@return string
---@description Retrieves the name of the affix.
---@since 1.0.0
function item_data_affix:get_name() end

---@return number
---@description Provides the rarity type of the affix.
---@since 1.0.0
function item_data_affix:get_rarity_type() end

---@return userdata
---@description Accesses internal affix data (for advanced use).
---@since 1.0.0
function item_data_affix:get_affix_data() end

---@return number
---@description Returns the seed value used for the affix.
---@since 1.0.0
function item_data_affix:get_affix_seed() end

return item_data
