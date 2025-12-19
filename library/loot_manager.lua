---@meta

---@class loot_manager
loot_manager = {}

---@param obj any
function loot_manager.get_item_identifier(obj) end

---@param obj any
function loot_manager.is_interactuable_object(obj) end

---@param obj any
---@param exclude_potions any
---@param exclude_gold any
function loot_manager.is_lootable_item(obj, exclude_potions, exclude_gold) end

function loot_manager.is_potion_necesary() end

function loot_manager.can_loot_potion() end

---@param obj any
function loot_manager.is_gold(obj) end

---@param obj any
function loot_manager.is_potion(obj) end

---@param obj any
function loot_manager.is_shrine(obj) end

---@param obj any
function loot_manager.is_obols(obj) end

---@param obj any
function loot_manager.is_locked_chest(obj) end

---@param obj any
function loot_manager.has_whispering_key(obj) end

---@param obj any
function loot_manager.is_ore_exception(obj) end

---@param obj any
function loot_manager.is_chest_exception(obj) end

---@param obj any
function loot_manager.is_event_trigger_exception(obj) end

function loot_manager.get_all_items_and_chest_sorted_by_distance() end

---@param point any
---@param threshold any
---@param exclude_potions any
---@param exclude_gold any
function loot_manager.any_item_around(point, threshold, exclude_potions, exclude_gold) end

---@param obj any
---@param exclude_potions any
---@param exclude_gold any
function loot_manager.loot_item(obj, exclude_potions, exclude_gold) end

---@param item any
function loot_manager.loot_item_orbwalker(item) end

---@param obj any
function loot_manager.interact_with_object(obj) end

---@param vendor any
function loot_manager.interact_with_vendor_and_sell_all(vendor) end

function loot_manager.sell_all_items() end

function loot_manager.salvage_all_items() end

---@param item any
function loot_manager.sell_specific_item(item) end

---@param item any
function loot_manager.salvage_specific_item(item) end

---@param vendor any
function loot_manager.interact_with_vendor_and_repair_all(vendor) end

function loot_manager.repair_all_items() end

---@param item_data any
function loot_manager.use_item(item_data) end

---@param item_data any
function loot_manager.move_item_to_stash(item_data) end

---@param item_data any
function loot_manager.move_item_from_stash(item_data) end

---@param item_data any
function loot_manager.drop_item(item_data) end

---@param item_data any
function loot_manager.buy_item(item_data) end

function loot_manager.get_current_vendor() end

function loot_manager.is_in_vendor_screen() end

function loot_manager.get_vendor_currency_type() end

function loot_manager.get_vendor_items() end
