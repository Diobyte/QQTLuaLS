---@meta

---@class buff
local buff = {}

---@return string
function buff:name() end

---@return number
function buff:get_end_time() end

---@return number
function buff:get_remaining_time() end

---@return number
function buff:get_duration() end

---@return boolean
function buff:is_active_buff() end

---@class item_data_affix
local item_data_affix = {}

---@return number
function item_data_affix:get_roll() end

---@return number
function item_data_affix:get_roll_min() end

---@return number
function item_data_affix:get_roll_max() end

---@return string
function item_data_affix:get_name() end

---@return number
function item_data_affix:get_rarity_type() end

---@return userdata
function item_data_affix:get_affix_data() end

---@return number
function item_data_affix:get_affix_seed() end

---@class item_data
local item_data = {}

---@return string
function item_data:get_skin_name() end

---@return string
function item_data:get_name() end

---@return string
function item_data:get_display_name() end

---@return boolean
function item_data:is_sacred() end

---@return boolean
function item_data:is_ancestral() end

---@return string
function item_data:get_rarity() end

---@return boolean
function item_data:is_junk() end

---@return boolean
function item_data:is_locked() end

---@return item_data_affix[]
function item_data:get_affixes() end

---@return number
function item_data:get_durability() end

---@return userdata
function item_data:get_acd() end

---@return number
function item_data:get_sno_id() end

---@return number
function item_data:get_balance_offset() end

---@return number
function item_data:get_inventory_row() end

---@return number
function item_data:get_inventory_column() end

---@return number
function item_data:get_price() end

---@return number
function item_data:get_stack_count() end

---@return boolean
function item_data:is_valid() end

---@class game_object
local game_object = {}

---@return number
function game_object:get_id() end

---@return number
function game_object:get_secondary_data_id() end

---@return number
function game_object:get_type_id() end

---@return vec3
function game_object:get_position() end

---@return boolean
function game_object:is_moving() end

---@return boolean
function game_object:is_dashing() end

---@return number
function game_object:get_active_spell_id() end

---@return vec3
function game_object:get_active_spell_origin() end

---@return vec3
function game_object:get_active_spell_destination() end

---@return vec3
function game_object:get_move_destination() end

---@return vec3
function game_object:get_dash_destination() end

---@return vec3
function game_object:get_direction() end

---@return number
function game_object:get_current_speed() end

---@return number
function game_object:get_total_movement_speed() end

---@return number
function game_object:get_base_movement_speed() end

---@return number
function game_object:get_movement_speed_multiplier() end

---@return string
function game_object:get_skin_name() end

---@return number
function game_object:get_type() end

---@return boolean
function game_object:is_basic_particle() end

---@return boolean
function game_object:is_elite() end

---@return boolean
function game_object:is_champion() end

---@return boolean
function game_object:is_minion() end

---@return boolean
function game_object:is_boss() end

---@return boolean
function game_object:is_immune() end

---@return boolean
function game_object:is_vulnerable() end

---@return boolean
function game_object:is_untargetable() end

---@return boolean
function game_object:is_item() end

---@return boolean
function game_object:is_interactable() end

---@return number
function game_object:get_interact_spell_id() end

---@return number
function game_object:get_base_health() end

---@return number
function game_object:get_bonus_health_modifier() end

---@return number
function game_object:get_current_health() end

---@return number
function game_object:get_max_health() end

---@return number
function game_object:get_base_attack_speed() end

---@return number
function game_object:get_bonus_attack_speed() end

---@return number
function game_object:get_weapon_damage() end

---@return number
function game_object:get_level() end

---@return number
function game_object:get_current_experience() end

---@return number
function game_object:get_experience_total_next_level() end

---@return number
function game_object:get_experience_remaining_next_level() end

---@return number
function game_object:get_character_class_id() end

---@return number
function game_object:get_health_potion_max_count() end

---@return number
function game_object:get_health_potion_count() end

---@return number
function game_object:get_health_potion_tier() end

---@return number
function game_object:get_primary_resource_current() end

---@return number
function game_object:get_primary_resource_max() end

---@return number
function game_object:get_class_specialization_id() end

---@return number
function game_object:get_rogue_combo_points() end

---@return boolean
function game_object:is_dead() end

---@return boolean
function game_object:is_enemy() end

---@param other game_object
---@return boolean
function game_object:is_enemy_with(other) end

---@return number
function game_object:get_debug_int() end

---@return number
function game_object:get_debug_int_2() end

---@return number
function game_object:get_debug_float() end

---@return buff[]
function game_object:get_buffs() end

---@return item_data[]
function game_object:get_inventory_items() end

---@return number
function game_object:get_item_count() end

---@return number
function game_object:get_consumable_count() end

---@return number
function game_object:get_quest_item_count() end

---@return number
function game_object:get_aspect_count() end

---@param bag_id number
---@return number[]
function game_object:get_item_ids_for_bag(bag_id) end

---@return number[]
function game_object:get_inventory_item_secondary_ids() end

---@return number[]
function game_object:get_consumables_ids() end

---@return string[]
function game_object:get_consumables_names() end

---@param spell_id number
---@return boolean
function game_object:is_spell_ready(spell_id) end

---@param spell_id number
---@return boolean
function game_object:has_enough_resources_for_spell(spell_id) end

---@return item_data[]
function game_object:get_equipped_items() end

---@return item_data[]
function game_object:get_consumable_items() end

---@return item_data[]
function game_object:get_stash_items() end

---@return item_data[]
function game_object:get_dungeon_key_items() end

---@return item_data[]
function game_object:get_socketable_items() end

---@param item_id number
---@return item_data
function game_object:get_item_info(item_id) end

---@return number
function item_data_affix:get_roll() end

---@return number
function item_data_affix:get_roll_min() end

---@return number
function item_data_affix:get_roll_max() end

---@return string
function item_data_affix:get_name() end

---@return number
function item_data_affix:get_rarity_type() end

---@return userdata
function item_data_affix:get_affix_data() end

---@return number
function item_data_affix:get_affix_seed() end

---@return string
function item_data:get_skin_name() end

---@return string
function item_data:get_name() end

---@return string
function item_data:get_display_name() end

---@return boolean
function item_data:is_sacred() end

---@return boolean
function item_data:is_ancestral() end

---@return string
function item_data:get_rarity() end

---@return boolean
function item_data:is_junk() end

---@return boolean
function item_data:is_locked() end

---@return item_data_affix[]
function item_data:get_affixes() end

---@return number
function item_data:get_durability() end

---@return userdata
function item_data:get_acd() end

---@return number
function item_data:get_sno_id() end

---@return number
function item_data:get_balance_offset() end

---@return number
function item_data:get_inventory_row() end

---@return number
function item_data:get_inventory_column() end

---@return number
function item_data:get_price() end

---@return number
function item_data:get_stack_count() end
