---@meta

---@see https://github.com/qqtnn/qqt_diablo/wiki/Game-Object

---@class game_object
---@enum CharacterClass
CharacterClass = {
    Sorcerer = 0,
    Barbarian = 1,
    Unknown2 = 2,
    Rogue = 3,
    Unknown4 = 4,
    Druid = 5,
    Necromancer = 6
}

local game_object = {}

---@return number
---@description Returns the unique identifier of the game object.
---@example local id = obj:get_id()
---@since 1.0.0
function game_object:get_id() end

---@return number
---@description Returns the secondary data identifier of the game object.
function game_object:get_secondary_data_id() end

---@return number
---@description Provides the type identifier of the game object.
function game_object:get_type_id() end

---@return vec3
---@description Retrieves the current position of the game object.
function game_object:get_position() end

---@return boolean
---@description Indicates whether the game object is currently moving.
function game_object:is_moving() end

---@return boolean
---@description Checks if the game object is performing a dash action.
function game_object:is_dashing() end

---@return number
---@description Returns the identifier of the currently active spell.
function game_object:get_active_spell_id() end

---@return vec3
---@description Retrieves the origin position of the current active spell.
function game_object:get_active_spell_origin() end

---@return vec3
---@description Retrieves the destination of the current active spell.
function game_object:get_active_spell_destination() end

---@return vec3
---@description Retrieves the destination of the current move action.
function game_object:get_move_destination() end

---@return vec3
---@description Provides the destination of the current dash action.
function game_object:get_dash_destination() end

---@return vec3
---@description Retrieves the current direction of the game object.
function game_object:get_direction() end

---@return number
---@description Retrieves the current speed of the game object.
function game_object:get_current_speed() end

---@return number
---@description Retrieves the total movement speed (base plus multipliers).
function game_object:get_total_movement_speed() end

---@return number
---@description Retrieves the base movement speed of the game object.
function game_object:get_base_movement_speed() end

---@return number
---@description Retrieves the movement speed multiplier applied to the game object.
function game_object:get_movement_speed_multiplier() end

---@return string
---@description Returns the skin name of the game object.
function game_object:get_skin_name() end

---@return number
---@description Provides the type value of the game object.
function game_object:get_type() end

---@return boolean
---@description Checks if the game object is a basic particle.
function game_object:is_basic_particle() end

---@return boolean
---@description Indicates whether the game object is classified as elite.
function game_object:is_elite() end

---@return boolean
---@description Determines if the game object is a champion.
function game_object:is_champion() end

---@return boolean
---@description Checks if the game object is a minion.
function game_object:is_minion() end

---@return boolean
---@description Indicates whether the game object is a boss.
function game_object:is_boss() end

---@return boolean
---@description Checks if the game object is currently immune.
function game_object:is_immune() end

---@return boolean
---@description Determines if the game object is vulnerable.
function game_object:is_vulnerable() end

---@return boolean
---@description Checks if the game object is untargetable.
function game_object:is_untargetable() end

---@return boolean
---@description Indicates whether the game object is an item.
function game_object:is_item() end

---@return boolean
---@description Determines if the game object can be interacted with.
function game_object:is_interactable() end

---@return number
---@description Returns the interact spell id for the game object.
function game_object:get_interact_spell_id() end

---@return number
---@description Returns the base health of the game object.
function game_object:get_base_health() end

---@return number
---@description Provides the bonus health modifier for the game object.
function game_object:get_bonus_health_modifier() end

---@return number
---@description Retrieves the current health value of the game object.
function game_object:get_current_health() end

---@return number
---@description Returns the maximum health value of the game object.
function game_object:get_max_health() end

---@return number
---@description Returns the base attack speed of the game object.
function game_object:get_base_attack_speed() end

---@return number
---@description Provides the bonus attack speed added to the game object.
function game_object:get_bonus_attack_speed() end

---@return number
---@description Retrieves the weapon damage of the game object.
function game_object:get_weapon_damage() end

---@return number
---@description Provides the current level of the game object.
function game_object:get_level() end

---@return number
---@description Retrieves the current experience points of the game object.
function game_object:get_current_experience() end

---@return number
---@description Returns the total experience needed for the next level.
function game_object:get_experience_total_next_level() end

---@return number
---@description Indicates the remaining experience needed for the next level.
function game_object:get_experience_remaining_next_level() end

---@return number
---@description Provides the character class id of the game object.
function game_object:get_character_class_id() end

---@return number
---@description Returns the maximum count of health potions the game object can hold.
function game_object:get_health_potion_max_count() end

---@return number
---@description Indicates the current count of health potions held by the game object.
function game_object:get_health_potion_count() end

---@return number
---@description Returns the tier of health potions held by the game object.
function game_object:get_health_potion_tier() end

---@return number
---@description Retrieves the current primary resource value of the game object.
function game_object:get_primary_resource_current() end

---@return number
---@description Provides the maximum primary resource value of the game object.
function game_object:get_primary_resource_max() end

---@return number
---@description Provides the specialization id of the game object.
function game_object:get_class_specialization_id() end

---@return number
---@description Returns the amount of rogue combo points on the game object.
function game_object:get_rogue_combo_points() end

---@return boolean
---@description Checks if the game object is currently dead.
function game_object:is_dead() end

---@return boolean
---@description Determines if the game object is an enemy.
function game_object:is_enemy() end

---@param other game_object
---@return boolean
---@description Checks if the game object is an enemy of another specified game object.
function game_object:is_enemy_with(other) end

---@return number
---@description Retrieves a debug integer value from the game object.
function game_object:get_debug_int() end

---@return number
---@description Retrieves a second debug integer value from the game object.
function game_object:get_debug_int_2() end

---@return number
---@description Retrieves a debug float value from the game object.
function game_object:get_debug_float() end

---@return buff[]
---@description Retrieves all buffs currently applied to the game object.
function game_object:get_buffs() end

---@return item_data[]
---@description Retrieves item data for items in the game object's inventory.
function game_object:get_inventory_items() end

---@return number
---@description Returns the count of items in the game object's inventory.
function game_object:get_item_count() end

---@return number
---@description Retrieves the count of consumable items in the game object's inventory.
function game_object:get_consumable_count() end

---@return number
---@description Returns the count of quest items in the game object's inventory.
function game_object:get_quest_item_count() end

---@return number
---@description Provides the count of aspects associated with the game object.
function game_object:get_aspect_count() end

---@param bag_id number
---@return number[]
---@description Returns a table of item ids for the specified bag id.
function game_object:get_item_ids_for_bag(bag_id) end

---@return number[]
---@description Retrieves secondary ids for items in the game object's inventory.
function game_object:get_inventory_item_secondary_ids() end

---@return number[]
---@description Returns ids for consumable items in the inventory.
function game_object:get_consumables_ids() end

---@return string[]
---@description Retrieves names for consumable items in the inventory.
function game_object:get_consumables_names() end

---@param spell_id number
---@return boolean
---@description Checks if the specified spell is ready to cast.
function game_object:is_spell_ready(spell_id) end

---@param spell_id number
---@return boolean
---@description Determines if the game object has enough resources to cast the specified spell.
function game_object:has_enough_resources_for_spell(spell_id) end

---@return item_data[]
---@description Returns item data for currently equipped items.
function game_object:get_equipped_items() end

---@return item_data[]
---@description Returns item data for consumable items.
function game_object:get_consumable_items() end

---@return item_data[]
---@description Returns item data for stash items.
function game_object:get_stash_items() end

---@return item_data[]
---@description Returns item data for dungeon key items.
function game_object:get_dungeon_key_items() end

---@return item_data[]
---@description Returns item data for socketable items.
function game_object:get_socketable_items() end

---@param item_id? number
---@return item_data
---@description Provides item data for the given item id.
function game_object:get_item_info(item_id) end

return game_object
