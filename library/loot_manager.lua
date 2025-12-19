---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Loot-Manager

---@class loot_manager

local loot_manager = {}

---@param obj game_object
---@return number
---@description Retrieves the unique identifier of an item, crucial for differentiating and tracking items in the game world.
---@example local id = loot_manager.get_item_identifier(item_obj)
---@since 1.0.0
function loot_manager.get_item_identifier(obj) end

---@param obj game_object
---@return boolean
---@description Determines if the specified object is interactable, aiding in automating interactions within the game.
---@example if loot_manager.is_interactuable_object(obj) then interact(obj) end
---@return any
---@description TODO: Add description for loot_manager.is_interactuable_object(obj)
---@example local result = loot_manager.is_interactuable_object(obj)()
---@since 1.0.0
function loot_manager.is_interactuable_object(obj) end

---@param obj game_object
---@param exclude_potions boolean
---@param exclude_gold boolean
---@return boolean
---@description Checks whether an item is lootable, facilitating inventory management and item collection strategies.
---@example if loot_manager.is_lootable_item(item, false, true) then loot(item) end
---@return any
---@description TODO: Add description for loot_manager.is_lootable_item(obj, exclude_potions, exclude_gold)
---@example local result = loot_manager.is_lootable_item(obj, exclude_potions, exclude_gold)()
---@since 1.0.0
function loot_manager.is_lootable_item(obj, exclude_potions, exclude_gold) end

---@return boolean
---@return any
---@description TODO: Add description for loot_manager.is_potion_necesary()
---@example local result = loot_manager.is_potion_necesary()()
---@since 1.0.0
function loot_manager.is_potion_necesary() end

---@return boolean
---@return any
---@description TODO: Add description for loot_manager.can_loot_potion()
---@example local result = loot_manager.can_loot_potion()()
---@since 1.0.0
function loot_manager.can_loot_potion() end

---@param obj game_object
---@return boolean
---@description Identifies if the object in question is gold, an essential aspect of resource management.
---@return any
---@description TODO: Add description for loot_manager.is_gold(obj)
---@example local result = loot_manager.is_gold(obj)()
---@since 1.0.0
function loot_manager.is_gold(obj) end

---@param obj game_object
---@return boolean
---@description Checks if the object is a potion, aiding in automating potion collection and usage.
---@return any
---@description TODO: Add description for loot_manager.is_potion(obj)
---@example local result = loot_manager.is_potion(obj)()
---@since 1.0.0
function loot_manager.is_potion(obj) end

---@param obj game_object
---@return boolean
---@description Determines whether an object is a shrine, useful for automated interactions with game shrines.
---@example local result = loot_manager.is_shrine(obj)()
---@since 1.0.0
function loot_manager.is_shrine(obj) end

---@param obj game_object
---@return boolean
---@description Identifies if the object is obols, a specific type of in-game currency or item.
---@return any
---@description TODO: Add description for loot_manager.is_obols(obj)
---@example local result = loot_manager.is_obols(obj)()
---@since 1.0.0
function loot_manager.is_obols(obj) end

---@param obj game_object
---@return boolean
---@description Checks if a chest is locked, which is key for deciding whether to attempt opening it.
---@example local result = loot_manager.is_locked_chest(obj)()
---@since 1.0.0
function loot_manager.is_locked_chest(obj) end

---@param obj game_object
---@return boolean
---@description Determines if an object, typically a chest, contains a whispering key.
---@description TODO: Add description for loot_manager.has_whispering_key(obj)
---@example local result = loot_manager.has_whispering_key(obj)()
---@since 1.0.0
function loot_manager.has_whispering_key(obj) end

---@param obj game_object
---@return boolean
---@description Identifies if an ore object is an exception, often used in specialized loot collection logic.
---@example local is_exception = loot_manager.is_ore_exception(some_ore)
---@since 1.0.0
function loot_manager.is_ore_exception(obj) end

---@param obj game_object
---@return boolean
---@description Determines if a chest is an exception, aiding in automated decision-making regarding chest interactions.
---@example local is_exception = loot_manager.is_chest_exception(some_chest)
---@since 1.0.0
function loot_manager.is_chest_exception(obj) end

---@param obj game_object
---@return boolean
---@description Checks if an object is an exception in triggering events, important for automating event-related actions.
---@example local is_exception = loot_manager.is_event_trigger_exception(some_trigger)
---@since 1.0.0
function loot_manager.is_event_trigger_exception(obj) end

---@return table
---@description Returns a sorted list of all items and chests by distance from the player.
---@example local items = loot_manager.get_all_items_and_chest_sorted_by_distance()
---@since 1.0.0
function loot_manager.get_all_items_and_chest_sorted_by_distance() end

---@param point vec3
---@param threshold number
---@param exclude_potions boolean
---@param exclude_gold boolean
---@return boolean
---@description Scans for any items within a specified radius, with options to exclude potions and gold, aiding in targeted loot collection.
---@example if loot_manager.any_item_around(my_pos, 10.0, true, false) then loot() end
---@return any
---@description TODO: Add description for loot_manager.any_item_around(point, threshold, exclude_potions, exclude_gold)
---@example local result = loot_manager.any_item_around(point, threshold, exclude_potions, exclude_gold)()
---@since 1.0.0
function loot_manager.any_item_around(point, threshold, exclude_potions, exclude_gold) end

---@param obj game_object
---@param exclude_potions boolean
---@param exclude_gold boolean
---@return boolean
---@description Executes the action of looting a specified item, with options to filter out potions and gold.
---@example local success = loot_manager.loot_item(item, false, false)
---@return any
---@description TODO: Add description for loot_manager.loot_item(obj, exclude_potions, exclude_gold)
---@example local result = loot_manager.loot_item(obj, exclude_potions, exclude_gold)()
---@since 1.0.0
function loot_manager.loot_item(obj, exclude_potions, exclude_gold) end

---@param item game_object
---@return nil
---@description Requests the orbwalker to loot a specific item, integrating item collection into movement and combat routines.
---@example loot_manager.loot_item_orbwalker(target_item)
---@example local result = loot_manager.loot_item_orbwalker(item)()
---@since 1.0.0
function loot_manager.loot_item_orbwalker(item) end

---@param obj game_object
---@return boolean
---@description Triggers an interaction with the specified game object, useful for engaging with various elements in the game world.
---@example local success = loot_manager.interact_with_object(target_obj)
---@return any
---@description TODO: Add description for loot_manager.interact_with_object(obj)
---@example local result = loot_manager.interact_with_object(obj)()
---@since 1.0.0
function loot_manager.interact_with_object(obj) end

---@param vendor game_object
---@return boolean
---@description Automates the process of interacting with a vendor and selling all items in the player's inventory, streamlining inventory management.
---@example local success = loot_manager.interact_with_vendor_and_sell_all(vendor_obj)
---@description TODO: Add description for loot_manager.interact_with_vendor_and_sell_all(vendor)
---@example local result = loot_manager.interact_with_vendor_and_sell_all(vendor)()
---@since 1.0.0
function loot_manager.interact_with_vendor_and_sell_all(vendor) end

---@return boolean
---@description Sells all items in the player's inventory to the currently open vendor.
---@example local success = loot_manager.sell_all_items()
---@description TODO: Add description for loot_manager.sell_all_items()
---@example local result = loot_manager.sell_all_items()()
---@since 1.0.0
function loot_manager.sell_all_items() end

---@return boolean
---@description Salvages all eligible items in the player's inventory at the currently open salvager.
---@example local success = loot_manager.salvage_all_items()
---@return any
---@description TODO: Add description for loot_manager.salvage_all_items()
---@example local result = loot_manager.salvage_all_items()()
---@since 1.0.0
function loot_manager.salvage_all_items() end

---@param item item_data
---@return boolean
---@return any
---@description TODO: Add description for loot_manager.sell_specific_item(item)
---@example local result = loot_manager.sell_specific_item(item)()
---@since 1.0.0
function loot_manager.sell_specific_item(item) end

---@param item item_data
---@return boolean
---@description The actions to sell or salvage items interact directly with the game's vendor interface. Ensure that the vendor interface is open before attempting to use these functions to prevent errors or unexpected behavior.
---@return any
---@description TODO: Add description for loot_manager.salvage_specific_item(item)
---@example local result = loot_manager.salvage_specific_item(item)()
---@since 1.0.0
function loot_manager.salvage_specific_item(item) end

---@param vendor game_object
---@return boolean
---@return any
---@description TODO: Add description for loot_manager.interact_with_vendor_and_repair_all(vendor)
---@example local result = loot_manager.interact_with_vendor_and_repair_all(vendor)()
---@since 1.0.0
function loot_manager.interact_with_vendor_and_repair_all(vendor) end

---@return boolean
---@return any
---@description TODO: Add description for loot_manager.repair_all_items()
---@example local result = loot_manager.repair_all_items()()
---@since 1.0.0
function loot_manager.repair_all_items() end

---@param item_data table
---@return boolean
---@description Uses the specified item from the inventory.
---@example local success = loot_manager.use_item(my_item)
---@return any
---@description TODO: Add description for loot_manager.use_item(item_data)
---@example local result = loot_manager.use_item(item_data)()
---@since 1.0.0
function loot_manager.use_item(item_data) end

---@param item_data table
---@return boolean
---@description Moves the specified item from inventory to stash.
---@example local success = loot_manager.move_item_to_stash(my_item)
---@return any
---@description TODO: Add description for loot_manager.move_item_to_stash(item_data)
---@example local result = loot_manager.move_item_to_stash(item_data)()
---@since 1.0.0
function loot_manager.move_item_to_stash(item_data) end

---@param item_data table
---@return boolean
---@return any
---@description TODO: Add description for loot_manager.move_item_from_stash(item_data)
---@example local result = loot_manager.move_item_from_stash(item_data)()
---@since 1.0.0
function loot_manager.move_item_from_stash(item_data) end

---@param item_data table
---@return boolean
---@return any
---@description TODO: Add description for loot_manager.drop_item(item_data)
---@example local result = loot_manager.drop_item(item_data)()
---@since 1.0.0
function loot_manager.drop_item(item_data) end

---@param item_data table
---@return boolean
---@description Purchases the specified item from the current vendor.
---@example local success = loot_manager.buy_item(vendor_item)
---@return any
---@description TODO: Add description for loot_manager.buy_item(item_data)
---@example local result = loot_manager.buy_item(item_data)()
---@since 1.0.0
function loot_manager.buy_item(item_data) end

---@return game_object | nil
---@description Returns the current vendor game object if interacting with one, otherwise nil.
---@example local vendor = loot_manager.get_current_vendor()
---@return any
---@description TODO: Add description for loot_manager.get_current_vendor()
---@example local result = loot_manager.get_current_vendor()()
---@since 1.0.0
function loot_manager.get_current_vendor() end

---@return boolean
---@return any
---@description TODO: Add description for loot_manager.is_in_vendor_screen()
---@example local result = loot_manager.is_in_vendor_screen()()
---@since 1.0.0
function loot_manager.is_in_vendor_screen() end

---@return string
---@description Returns the currency type accepted by the current vendor.
---@example local currency = loot_manager.get_vendor_currency_type()
---@return any
---@description TODO: Add description for loot_manager.get_vendor_currency_type()
---@example local result = loot_manager.get_vendor_currency_type()()
---@since 1.0.0
function loot_manager.get_vendor_currency_type() end

---@return boolean
---@return any
---@description TODO: Add description for loot_manager.get_vendor_items()
---@example local result = loot_manager.get_vendor_items()()
---@since 1.0.0
function loot_manager.get_vendor_items() end
