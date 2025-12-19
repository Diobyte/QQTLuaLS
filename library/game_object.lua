---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Game-Object

---@class game_object
---@enum CharacterClass
local CharacterClass = {
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
---@description Returns the unique identifier of the [game object].
---@example local obj_id = game_object:get_id()
---@since 1.0.0
function game_object:get_id() end

---@return number
---@description Returns the secondary data identifier of the [game object].
---@since 1.0.0
---@example local result = game_object:get_secondary_data_id()
function game_object:get_secondary_data_id() end

---@return number
---@description Provides the type identifier of the [game object].
---@since 1.0.0
---@return any
---@description TODO: Add description for game_object:get_type_id()
---@example local result = game_object:get_type_id()
---@since 1.0.0
function game_object:get_type_id() end

---@return vec3
---@description Retrieves the current position of the [game object] as a [`vec3`].
---@example local pos = game_object:get_position()
---@since 1.0.0
---@since 1.0.0
function game_object:get_position() end

---@return boolean
---@description Indicates whether the [game object] is currently moving.
---@example if game_object:is_moving() then print("Moving") end
---@return any
---@description TODO: Add description for game_object:is_moving()
---@example local result = game_object:is_moving()
---@since 1.0.0
function game_object:is_moving() end

---@return boolean
---@description Checks if the [game object] is performing a dash action.
---@return any
---@description TODO: Add description for game_object:is_dashing()
---@example local result = game_object:is_dashing()
---@since 1.0.0
function game_object:is_dashing() end

---@return number
---@description Returns the identifier of the currently active spell of the [game object].
---@return any
---@description TODO: Add description for game_object:get_active_spell_id()
---@example local result = game_object:get_active_spell_id()
---@since 1.0.0
function game_object:get_active_spell_id() end

---@return vec3|nil
---@description Retrieves the origin of the current active spell as a [`vec3`] for the [game object]. Returns nil if no active spell.
---@return any
---@description TODO: Add description for game_object:get_active_spell_origin()
---@example local result = game_object:get_active_spell_origin()
---@since 1.0.0
function game_object:get_active_spell_origin() end

---@return vec3|nil
---@description Retrieves the destination of the current active spell as a [`vec3`] for the [game object]. Returns nil if no active spell.
---@return any
---@description TODO: Add description for game_object:get_active_spell_destination()
---@example local result = game_object:get_active_spell_destination()
---@since 1.0.0
function game_object:get_active_spell_destination() end

---@return vec3|nil
---@description Retrieves the destination of the current move action as a [`vec3`] for the [game object]. Returns nil if not moving.
---@return any
---@description TODO: Add description for game_object:get_move_destination()
---@example local result = game_object:get_move_destination()
---@since 1.0.0
function game_object:get_move_destination() end

---@return vec3|nil
---@description Provides the destination of the current dash as a [`vec3`] for the [game object]. Returns nil if not dashing.
---@example local result = game_object:get_dash_destination()
---@since 1.0.0
function game_object:get_dash_destination() end

---@return vec3
---@description Retrieves the current direction of the [game object] as a [`vec3`].
---@return any
---@description TODO: Add description for game_object:get_direction()
---@example local result = game_object:get_direction()
---@since 1.0.0
function game_object:get_direction() end

---@return number
---@description Retrieves the current speed of the [game object].
---@return any
---@description TODO: Add description for game_object:get_current_speed()
---@example local result = game_object:get_current_speed()
---@since 1.0.0
function game_object:get_current_speed() end

---@return number
---@description Retrieves the total movement speed of the [game object], combining base speed and any multipliers.
---@return any
---@description TODO: Add description for game_object:get_total_movement_speed()
---@example local result = game_object:get_total_movement_speed()
---@since 1.0.0
function game_object:get_total_movement_speed() end

---@return number
---@description Retrieves the base movement speed of the [game object], excluding any multipliers.
---@return any
---@description TODO: Add description for game_object:get_base_movement_speed()
---@example local result = game_object:get_base_movement_speed()
---@since 1.0.0
function game_object:get_base_movement_speed() end

---@return number
---@description Retrieves the movement speed multiplier of the [game object], indicating the factor by which the base speed is modified.
---@return any
---@description TODO: Add description for game_object:get_movement_speed_multiplier()
---@example local result = game_object:get_movement_speed_multiplier()
---@since 1.0.0
function game_object:get_movement_speed_multiplier() end

---@overload fun(self, ): string
---@overload fun(self, ): string
---@return string
---@description Returns the name of the current skin of the [game object].
---@return any
---@description TODO: Add description for game_object:get_skin_name()
---@example local result = game_object:get_skin_name()
---@since 1.0.0
function game_object:get_skin_name() end

---@return number
---@description Provides the type of the [game object].
---@return any
---@description TODO: Add description for game_object:get_type()
---@example local result = game_object:get_type()
---@since 1.0.0
function game_object:get_type() end

---@return boolean
---@description Checks if the [game object] is a basic particle.
---@return any
---@description TODO: Add description for game_object:is_basic_particle()
---@example local result = game_object:is_basic_particle()
---@since 1.0.0
function game_object:is_basic_particle() end

---@return boolean
---@description Indicates whether the [game object] is classified as elite.
---@return any
---@description TODO: Add description for game_object:is_elite()
---@example local result = game_object:is_elite()
---@since 1.0.0
function game_object:is_elite() end

---@return boolean
---@description Determines if the [game object] is a champion.
---@return any
---@description TODO: Add description for game_object:is_champion()
---@example local result = game_object:is_champion()
---@since 1.0.0
function game_object:is_champion() end

---@return boolean
---@description Checks if the [game object] is a minion.
---@return any
---@description TODO: Add description for game_object:is_minion()
---@example local result = game_object:is_minion()
---@since 1.0.0
function game_object:is_minion() end

---@return boolean
---@description Indicates whether the [game object] is a boss.
---@return any
---@description TODO: Add description for game_object:is_boss()
---@example local result = game_object:is_boss()
---@since 1.0.0
function game_object:is_boss() end

---@return boolean
---@description Checks if the [game object] is currently immune.
---@return any
---@description TODO: Add description for game_object:is_immune()
---@example local result = game_object:is_immune()
---@since 1.0.0
function game_object:is_immune() end

---@return boolean
---@description Determines if the [game object] is vulnerable.
---@return any
---@description TODO: Add description for game_object:is_vulnerable()
---@example local result = game_object:is_vulnerable()
---@since 1.0.0
function game_object:is_vulnerable() end

---@return boolean
---@description Checks if the [game object] is untargetable.
---@return any
---@description TODO: Add description for game_object:is_untargetable()
---@example local result = game_object:is_untargetable()
---@since 1.0.0
function game_object:is_untargetable() end

---@return boolean
---@description Indicates whether the [game object] is an item.
---@return any
---@description TODO: Add description for game_object:is_item()
---@example local result = game_object:is_item()
---@since 1.0.0
function game_object:is_item() end

---@return item_data
---@description Returns the item data for this game object if it is an item.
---@example local result = game_object:get_item_info()
---@since 1.0.0
function game_object:get_item_info() end

---@return boolean
---@description Determines if the [game object] can be interacted / used.
---@return any
---@description TODO: Add description for game_object:is_interactable()
---@example local result = game_object:is_interactable()
---@since 1.0.0
function game_object:is_interactable() end

---@return number
---@return any
---@description TODO: Add description for game_object:get_interact_spell_id()
---@example local result = game_object:get_interact_spell_id()
---@since 1.0.0
function game_object:get_interact_spell_id() end

---@return number
---@description Returns the base health of the [game object].
---@return any
---@description TODO: Add description for game_object:get_base_health()
---@example local result = game_object:get_base_health()
---@since 1.0.0
function game_object:get_base_health() end

---@return number
---@description Provides the bonus health modifier of the [game object].
---@return any
---@description TODO: Add description for game_object:get_bonus_health_modifier()
---@example local result = game_object:get_bonus_health_modifier()
---@since 1.0.0
function game_object:get_bonus_health_modifier() end

---@return number
---@description Retrieves the current health value of the [game object].
---@example local result = game_object:get_current_health()
---@since 1.0.0
function game_object:get_current_health() end

---@return number
---@description Returns the maximum health value of the [game object].
---@return any
---@description TODO: Add description for game_object:get_max_health()
---@example local result = game_object:get_max_health()
---@since 1.0.0
function game_object:get_max_health() end

---@return number
---@description Returns the base attack speed of the [game object].
---@return any
---@description TODO: Add description for game_object:get_base_attack_speed()
---@example local result = game_object:get_base_attack_speed()
---@since 1.0.0
function game_object:get_base_attack_speed() end

---@return number
---@description Provides the bonus attack speed added to the [game object].
---@example local result = game_object:get_bonus_attack_speed()
---@since 1.0.0
function game_object:get_bonus_attack_speed() end

---@return number
---@description Retrieves the weapon damage of the [game object].
---@return any
---@description TODO: Add description for game_object:get_weapon_damage()
---@example local result = game_object:get_weapon_damage()
---@since 1.0.0
function game_object:get_weapon_damage() end

---@return number
---@description Provides the current level of the [game object].
---@return any
---@description TODO: Add description for game_object:get_level()
---@example local result = game_object:get_level()
---@since 1.0.0
function game_object:get_level() end

---@return number
---@description Retrieves the current experience points of the [game object].
---@return any
---@description TODO: Add description for game_object:get_current_experience()
---@example local result = game_object:get_current_experience()
---@since 1.0.0
function game_object:get_current_experience() end

---@return number
---@description Returns the total experience needed for the next level for the [game object].
---@return any
---@description TODO: Add description for game_object:get_experience_total_next_level()
---@example local result = game_object:get_experience_total_next_level()
---@since 1.0.0
function game_object:get_experience_total_next_level() end

---@return number
---@description Indicates the remaining experience needed for the next level for the [game object].
---@return any
---@description TODO: Add description for game_object:get_experience_remaining_next_level()
---@example local result = game_object:get_experience_remaining_next_level()
---@since 1.0.0
function game_object:get_experience_remaining_next_level() end

---@return number
---@description Provides the character class ID of the [game object].
---@return any
---@description TODO: Add description for game_object:get_character_class_id()
---@example local result = game_object:get_character_class_id()
---@since 1.0.0
function game_object:get_character_class_id() end

---@return number
---@description Returns the maximum count of health potions the [game object] can hold.
---@return any
---@description TODO: Add description for game_object:get_health_potion_max_count()
---@example local result = game_object:get_health_potion_max_count()
---@since 1.0.0
function game_object:get_health_potion_max_count() end

---@return number
---@description Indicates the current count of health potions held by the [game object].
---@return any
---@description TODO: Add description for game_object:get_health_potion_count()
---@example local result = game_object:get_health_potion_count()
---@since 1.0.0
function game_object:get_health_potion_count() end

---@return number
---@description Returns the tier of health potions held by the [game object].
---@return any
---@description TODO: Add description for game_object:get_health_potion_tier()
---@example local result = game_object:get_health_potion_tier()
---@since 1.0.0
function game_object:get_health_potion_tier() end

---@return number
---@description Retrieves the current primary resource value of the [game object].
---@return any
---@description TODO: Add description for game_object:get_primary_resource_current()
---@example local result = game_object:get_primary_resource_current()
---@since 1.0.0
function game_object:get_primary_resource_current() end

---@return number
---@description Provides the maximum value of the primary resource of the [game object].
---@return any
---@description TODO: Add description for game_object:get_primary_resource_max()
---@example local result = game_object:get_primary_resource_max()
---@since 1.0.0
function game_object:get_primary_resource_max() end

---@return number
---@description Provides the specialization id of the [game object].
---@return any
---@description TODO: Add description for game_object:get_class_specialization_id()
---@example local result = game_object:get_class_specialization_id()
---@since 1.0.0
function game_object:get_class_specialization_id() end

---@return number
---@description Returns the amount of combo points of the [game object].
---@return any
---@description TODO: Add description for game_object:get_rogue_combo_points()
---@example local result = game_object:get_rogue_combo_points()
---@since 1.0.0
function game_object:get_rogue_combo_points() end

---@return boolean
---@description Checks if the [game object] is currently dead.
---@return any
---@description TODO: Add description for game_object:is_dead()
---@example local result = game_object:is_dead()
---@since 1.0.0
function game_object:is_dead() end

---@return boolean
---@description Determines if the [game object] is an enemy.
---@return any
---@description TODO: Add description for game_object:is_enemy()
---@example local result = game_object:is_enemy()
---@since 1.0.0
function game_object:is_enemy() end

---@param other game_object
---@return boolean
---@description Checks if the [game object] is an enemy of another specified game object.
---@return any
---@description TODO: Add description for game_object:is_enemy_with(other)
---@example local result = game_object:is_enemy_with(other)
---@since 1.0.0
function game_object:is_enemy_with(other) end

---@return number
---@description Retrieves a debug integer value from the [game object].
---@return any
---@description TODO: Add description for game_object:get_debug_int()
---@example local result = game_object:get_debug_int()
---@since 1.0.0
function game_object:get_debug_int() end

---@return number
---@description Retrieves a second debug integer value from the [game object].
---@return any
---@description TODO: Add description for game_object:get_debug_int_2()
---@example local result = game_object:get_debug_int_2()
---@since 1.0.0
function game_object:get_debug_int_2() end

---@return number
---@description Retrieves a debug float value from the [game object].
---@return any
---@description TODO: Add description for game_object:get_debug_float()
---@example local result = game_object:get_debug_float()
---@since 1.0.0
function game_object:get_debug_float() end

---@return buff[]
---@description Retrieves a table containing all the buffs currently applied to the [game object]. Each entry in the table is a `buff` object.
---@return any
---@description TODO: Add description for game_object:get_buffs()
---@example local result = game_object:get_buffs()
---@since 1.0.0
function game_object:get_buffs() end

---@return number
---@description Returns the count of items in the [game object]'s inventory.
---@return any
---@description TODO: Add description for game_object:get_item_count()
---@example local result = game_object:get_item_count()
---@since 1.0.0
function game_object:get_item_count() end

---@return number
---@description Retrieves the count of consumable items in the [game object]'s inventory.
---@return any
---@description TODO: Add description for game_object:get_consumable_count()
---@example local result = game_object:get_consumable_count()
---@since 1.0.0
function game_object:get_consumable_count() end

---@return number
---@description Returns the count of quest-related items in the [game object]'s inventory.
---@return any
---@description TODO: Add description for game_object:get_quest_item_count()
---@example local result = game_object:get_quest_item_count()
---@since 1.0.0
function game_object:get_quest_item_count() end

---@return number
---@description Provides the count of aspects (special items or effects) associated with the [game object].
---@return any
---@description TODO: Add description for game_object:get_aspect_count()
---@example local result = game_object:get_aspect_count()
---@since 1.0.0
function game_object:get_aspect_count() end

---@param bag_id number
---@return number[]
---@description Returns a table of item IDs for a specified bag in the [game object]'s inventory.
---@return any
---@description TODO: Add description for game_object:get_item_ids_for_bag(bag_id)
---@example local result = game_object:get_item_ids_for_bag(bag_id)
---@since 1.0.0
function game_object:get_item_ids_for_bag(bag_id) end

---@return number[]
---@description Retrieves a table of secondary IDs for items in the [game object]'s inventory.
---@return any
---@description TODO: Add description for game_object:get_inventory_item_secondary_ids()
---@example local result = game_object:get_inventory_item_secondary_ids()
---@since 1.0.0
function game_object:get_inventory_item_secondary_ids() end

---@return number[]
---@description Returns a table of IDs for consumable items in the [game object]'s inventory.
---@return any
---@description TODO: Add description for game_object:get_consumables_ids()
---@example local result = game_object:get_consumables_ids()
---@since 1.0.0
function game_object:get_consumables_ids() end

---@return string[]
---@description Retrieves a table of names for consumable items in the [game object]'s inventory.
---@return any
---@description TODO: Add description for game_object:get_consumables_names()
---@example local result = game_object:get_consumables_names()
---@since 1.0.0
function game_object:get_consumables_names() end

---@param spell_id number
---@return boolean
---@description Checks if a specified spell is ready to be cast by the [game object].
---@return any
---@description TODO: Add description for game_object:is_spell_ready(spell_id)
---@example local result = game_object:is_spell_ready(spell_id)
---@since 1.0.0
function game_object:is_spell_ready(spell_id) end

---@param spell_id number
---@return boolean
---@description Determines if the [game object] has enough resources to cast a specified spell.
---@return any
---@description TODO: Add description for game_object:has_enough_resources_for_spell(spell_id)
---@example local result = game_object:has_enough_resources_for_spell(spell_id)
---@since 1.0.0
function game_object:has_enough_resources_for_spell(spell_id) end

---@return item_data[]
---@description Returns a table of `item_data` for items equipped by the [game object].
---@return any
---@description TODO: Add description for game_object:get_equipped_items()
---@example local result = game_object:get_equipped_items()
---@since 1.0.0
function game_object:get_equipped_items() end

---@return item_data[]
---@description Retrieves a table of `item_data` for items in the [game object]'s inventory.
---@return any
---@description TODO: Add description for game_object:get_inventory_items()
---@example local result = game_object:get_inventory_items()
---@since 1.0.0
function game_object:get_inventory_items() end

---@return item_data[]
---@description Returns a table of `item_data` for consumable items in the [game object]'s inventory.
---@return any
---@description TODO: Add description for game_object:get_consumable_items()
---@example local result = game_object:get_consumable_items()
---@since 1.0.0
function game_object:get_consumable_items() end

---@return item_data[]
---@return any
---@description TODO: Add description for game_object:get_stash_items()
---@example local result = game_object:get_stash_items()
---@since 1.0.0
function game_object:get_stash_items() end

---@return item_data[]
---@return any
---@description TODO: Add description for game_object:get_dungeon_key_items()
---@example local result = game_object:get_dungeon_key_items()
---@since 1.0.0
function game_object:get_dungeon_key_items() end

---@return item_data[]
---@return any
---@description TODO: Add description for game_object:get_socketable_items()
---@example local result = game_object:get_socketable_items()
---@since 1.0.0
function game_object:get_socketable_items() end
