---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Game-Object

---@class item_data

local item_data = {}

---@return string
---@description Retrieves the skin name of the item.
---@example local result = item_data:get_skin_name()
---@since 1.0.0
function item_data:get_skin_name() end

---@return string
---@description Provides the name of the item.
---@example local name = item_data:get_name()
---@return any
---@description TODO: Add description for item_data:get_name()
---@example local result = item_data:get_name()
---@since 1.0.0
function item_data:get_name() end

---@return string
---@description Provides the display name of the item.
---@return any
---@description TODO: Add description for item_data:get_display_name()
---@example local result = item_data:get_display_name()
---@since 1.0.0
function item_data:get_display_name() end

---@return boolean
---@description Indicates if the item is sacred.
---@return any
---@description TODO: Add description for item_data:is_sacred()
---@example local result = item_data:is_sacred()
---@since 1.0.0
function item_data:is_sacred() end

---@return boolean
---@description Checks if the item is ancestral.
---@return any
---@description TODO: Add description for item_data:is_ancestral()
---@example local result = item_data:is_ancestral()
---@since 1.0.0
function item_data:is_ancestral() end

---@return item_rarity
---@description Returns the rarity level of the item.
---@return any
---@description TODO: Add description for item_data:get_rarity()
---@example local result = item_data:get_rarity()
---@since 1.0.0
function item_data:get_rarity() end

---@return boolean
---@description Determines if the item is classified as junk.
---@return any
---@description TODO: Add description for item_data:is_junk()
---@example local result = item_data:is_junk()
---@since 1.0.0
function item_data:is_junk() end

---@return boolean
---@description Indicates if the item is locked.
---@return any
---@description TODO: Add description for item_data:is_locked()
---@example local result = item_data:is_locked()
---@since 1.0.0
function item_data:is_locked() end

---@return table
---@description Retrieves a table of affixes associated with the item.
---@description TODO: Add description for item_data:get_affixes()
---@example local result = item_data:get_affixes()
---@since 1.0.0
function item_data:get_affixes() end

---@return number
---@description Provides the item's durability value.
---@description TODO: Add description for item_data:get_durability()
---@example local result = item_data:get_durability()
---@since 1.0.0
function item_data:get_durability() end

---@return userdata
---@description Accesses internal ACD data (for advanced use).
---@return any
---@description TODO: Add description for item_data:get_acd()
---@example local result = item_data:get_acd()
---@since 1.0.0
function item_data:get_acd() end

---@return number
---@description Returns the SNO ID of the item.
---@return any
---@description TODO: Add description for item_data:get_sno_id()
---@example local result = item_data:get_sno_id()
---@since 1.0.0
function item_data:get_sno_id() end

---@return number
---@description Provides the balance offset of the item.
---@return any
---@description TODO: Add description for item_data:get_balance_offset()
---@example local result = item_data:get_balance_offset()
---@since 1.0.0
function item_data:get_balance_offset() end

---@return number
---@description Returns the row number in the inventory where the item is located.
---@return any
---@description TODO: Add description for item_data:get_inventory_row()
---@example local result = item_data:get_inventory_row()
---@since 1.0.0
function item_data:get_inventory_row() end

---@return number
---@description Returns the column number in the inventory where the item is located.
---@return any
---@description TODO: Add description for item_data:get_inventory_column()
---@example local result = item_data:get_inventory_column()
---@since 1.0.0
function item_data:get_inventory_column() end

---@return number
---@return any
---@description TODO: Add description for item_data:get_price()
---@example local result = item_data:get_price()
---@since 1.0.0
function item_data:get_price() end

---@return number
---@return any
---@description TODO: Add description for item_data:get_stack_count()
---@example local result = item_data:get_stack_count()
---@since 1.0.0
function item_data:get_stack_count() end

---@class item_data_affix

local item_data_affix = {}

---@return number
---@description Returns the roll value of the affix.
---@return any
---@description TODO: Add description for item_data_affix:get_roll()
---@example local result = item_data_affix:get_roll()
---@since 1.0.0
function item_data_affix:get_roll() end

---@return number
---@description Returns the minimum roll value.
---@return any
---@description TODO: Add description for item_data_affix:get_roll_min()
---@example local result = item_data_affix:get_roll_min()
---@since 1.0.0
function item_data_affix:get_roll_min() end

---@return number
---@description Returns the maximum roll value.
---@return any
---@description TODO: Add description for item_data_affix:get_roll_max()
---@example local result = item_data_affix:get_roll_max()
---@since 1.0.0
function item_data_affix:get_roll_max() end

---@return string
---@description Retrieves the name of the affix.
---@return any
---@description TODO: Add description for item_data_affix:get_name()
---@example local result = item_data_affix:get_name()
---@since 1.0.0
function item_data_affix:get_name() end

---@return number
---@description Provides the rarity type of the affix.
---@return any
---@description TODO: Add description for item_data_affix:get_rarity_type()
---@example local result = item_data_affix:get_rarity_type()
---@since 1.0.0
function item_data_affix:get_rarity_type() end

---@return userdata
---@description Accesses internal affix data (for advanced use).
---@return any
---@description TODO: Add description for item_data_affix:get_affix_data()
---@example local result = item_data_affix:get_affix_data()
---@since 1.0.0
function item_data_affix:get_affix_data() end

---@return number
---@description Returns the seed value used for the affix.
---@return any
---@description TODO: Add description for item_data_affix:get_affix_seed()
---@example local result = item_data_affix:get_affix_seed()
---@since 1.0.0
function item_data_affix:get_affix_seed() end
