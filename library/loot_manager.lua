---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Loot-Manager

---@class loot_manager
---@description Loot interaction and vendor utilities.

local loot_manager = {}

---@param obj game_object
---@return number
---@description Unique identifier for an item object.
---@since 1.0.0
function loot_manager.get_item_identifier(obj) end

---@param obj game_object
---@return boolean
---@description True if object is interactable.
---@since 1.0.0
function loot_manager.is_interactuable_object(obj) end

---@param obj game_object
---@param exclude_potions boolean
---@param exclude_gold boolean
---@return boolean
---@description True if item should be looted.
---@since 1.0.0
function loot_manager.is_lootable_item(obj, exclude_potions, exclude_gold) end

---@return boolean
---@description True if a potion is needed.
---@since 1.0.0
function loot_manager.is_potion_necesary() end

---@return boolean
---@description True if potion loot is allowed.
---@since 1.0.0
function loot_manager.can_loot_potion() end

---@param obj game_object
---@return boolean
---@description True if object is gold.
---@since 1.0.0
function loot_manager.is_gold(obj) end

---@param obj game_object
---@return boolean
---@description True if object is a potion.
---@since 1.0.0
function loot_manager.is_potion(obj) end

---@param obj game_object
---@return boolean
---@description True if object is a shrine.
---@since 1.0.0
function loot_manager.is_shrine(obj) end

---@param obj game_object
---@return boolean
---@description True if object is obols.
---@since 1.0.0
function loot_manager.is_obols(obj) end

---@param obj game_object
---@return boolean
---@description True if chest is locked.
---@since 1.0.0
function loot_manager.is_locked_chest(obj) end

---@param obj game_object
---@return boolean
---@description True if chest requires whispering key.
---@since 1.0.0
function loot_manager.has_whispering_key(obj) end

---@param obj game_object
---@return boolean
---@description True if ore object is an exception.
---@since 1.0.0
function loot_manager.is_ore_exception(obj) end

---@param obj game_object
---@return boolean
---@description True if chest is an exception.
---@since 1.0.0
function loot_manager.is_chest_exception(obj) end

---@param obj game_object
---@return boolean
---@description True if event trigger is an exception.
---@since 1.0.0
function loot_manager.is_event_trigger_exception(obj) end

---@return table
---@description All items and chests sorted by distance.
---@since 1.0.0
function loot_manager.get_all_items_and_chest_sorted_by_distance() end

---@param point vec3
---@param threshold number
---@param exclude_potions boolean
---@param exclude_gold boolean
---@return boolean
---@description True if any item is within threshold.
---@since 1.0.0
function loot_manager.any_item_around(point, threshold, exclude_potions, exclude_gold) end

---@param obj game_object
---@param exclude_potions boolean
---@param exclude_gold boolean
---@return boolean
---@description Loot the given item respecting filters.
---@since 1.0.0
function loot_manager.loot_item(obj, exclude_potions, exclude_gold) end

---@param item game_object
---@return nil
---@description Request orbwalker to loot item.
---@since 1.0.0
function loot_manager.loot_item_orbwalker(item) end

---@param obj game_object
---@return boolean
---@description Interact with the given object.
---@since 1.0.0
function loot_manager.interact_with_object(obj) end

---@param vendor game_object
---@return boolean
---@description Interact with vendor and sell all items.
---@since 1.0.0
function loot_manager.interact_with_vendor_and_sell_all(vendor) end

---@return boolean
---@description Sell all items at current vendor.
---@since 1.0.0
function loot_manager.sell_all_items() end

---@return boolean
---@description Salvage all items at current salvager.
---@since 1.0.0
function loot_manager.salvage_all_items() end

---@param item item_data
---@return boolean
---@description Sell a specific item.
---@since 1.0.0
function loot_manager.sell_specific_item(item) end

---@param item item_data
---@return boolean
---@description Salvage a specific item.
---@since 1.0.0
function loot_manager.salvage_specific_item(item) end

---@param vendor game_object
---@return boolean
---@description Interact with vendor and repair all items.
---@since 1.0.0
function loot_manager.interact_with_vendor_and_repair_all(vendor) end

---@return boolean
---@description Repair all items at current vendor.
---@since 1.0.0
function loot_manager.repair_all_items() end

---@param item_data table
---@return boolean
---@description Use an item from inventory.
---@since 1.0.0
function loot_manager.use_item(item_data) end

---@param item_data table
---@return boolean
---@description Move item to stash.
---@since 1.0.0
function loot_manager.move_item_to_stash(item_data) end

---@param item_data table
---@return boolean
---@description Move item from stash.
---@since 1.0.0
function loot_manager.move_item_from_stash(item_data) end

---@param item_data table
---@return boolean
---@description Drop item from inventory.
---@since 1.0.0
function loot_manager.drop_item(item_data) end

---@param item_data table
---@return boolean
---@description Buy an item from vendor list.
---@since 1.0.0
function loot_manager.buy_item(item_data) end

---@return game_object|nil
---@description Current vendor object or nil.
---@since 1.0.0
function loot_manager.get_current_vendor() end

---@return boolean
---@description True if vendor screen is open.
---@since 1.0.0
function loot_manager.is_in_vendor_screen() end

---@return string
---@description Currency type used by current vendor.
---@since 1.0.0
function loot_manager.get_vendor_currency_type() end

---@return table
---@description Current vendor items table.
---@since 1.0.0
function loot_manager.get_vendor_items() end

return loot_manager
