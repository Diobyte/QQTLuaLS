---@meta

---@return number (int)
function get_id() end

---@return number (int)
function get_secondary_data_id() end

---@return number (int)
function get_type_id() end

function get_position() end

---@return bool
function is_moving() end

---@return bool
function is_dashing() end

---@return number (int)
function get_active_spell_id() end

function get_active_spell_origin() end

function get_active_spell_destination() end

function get_move_destination() end

function get_dash_destination() end

function get_direction() end

---@return number (float)
function get_current_speed() end

---@return number (float)
function get_total_movement_speed() end

---@return number (float)
function get_base_movement_speed() end

---@return number (float)
function get_movement_speed_multiplier() end

---@return string
function get_skin_name() end

---@return number (int)
function get_type() end

---@return bool
function is_basic_particle() end

---@return bool
function is_elite() end

---@return bool
function is_champion() end

---@return bool
function is_minion() end

---@return bool
function is_boss() end

---@return bool
function is_immune() end

---@return bool
function is_vulnerable() end

---@return bool
function is_untargetable() end

---@return bool
function is_item() end

---@return bool
function is_interactable() end

---@return int
function get_interact_spell_id() end

---@return number (float)
function get_base_health() end

---@return number (float)
function get_bonus_health_modifier() end

---@return number (float)
function get_current_health() end

---@return number (float)
function get_max_health() end

---@return number (float)
function get_base_attack_speed() end

---@return number (float)
function get_bonus_attack_speed() end

---@return number (float)
function get_weapon_damage() end

---@return number (int)
function get_level() end

---@return number (int)
function get_current_experience() end

---@return number (int)
function get_experience_total_next_level() end

---@return number (int)
function get_experience_remaining_next_level() end

---@return number (int)
function get_character_class_id() end

---@return number (int)
function get_health_potion_max_count() end

---@return number (int)
function get_health_potion_count() end

---@return number (int)
function get_health_potion_tier() end

---@return number (int)
function get_primary_resource_current() end

---@return number (int)
function get_primary_resource_max() end

---@return number (int)
function get_class_specialization_id() end

---@return number (int)
function get_rogue_combo_points() end

---@return bool
function is_dead() end

---@return bool
function is_enemy() end

---@param other any
---@return bool
function is_enemy_with(other) end

---@return number (int)
function get_debug_int() end

---@return number (int)
function get_debug_int_2() end

---@return number (float)
function get_debug_float() end

---@return table of [buff]
function get_buffs() end

---@return string
function get_name() end

---@return Number (float)
function get_end_time() end

---@return Number (float)
function get_remaining_time() end

---@return Number (float)
function get_duration() end

---@return Boolean
function is_active_buff() end

---@return table of [item_data]
function get_inventory_items() end

---@return number (int)
function get_item_count() end

---@return number (int)
function get_consumable_count() end

---@return number (int)
function get_quest_item_count() end

---@return number (int)
function get_aspect_count() end

---@param bag_id any
---@return table of number (int)
function get_item_ids_for_bag(bag_id) end

---@return table of number (int)
function get_inventory_item_secondary_ids() end

---@return table of number (int)
function get_consumables_ids() end

---@return table of string
function get_consumables_names() end

---@param spell_id any
---@return bool
function is_spell_ready(spell_id) end

---@param spell_id any
---@return bool
function has_enough_resources_for_spell(spell_id) end

---@return table of [item_data]
function get_equipped_items() end

---@return table of [item_data]
function get_inventory_items() end

---@return table of [item_data]
function get_consumable_items() end

---@return table of [item_data]
function get_stash_items() end

---@return table of [item_data]
function get_dungeon_key_items() end

---@return table of [item_data]
function get_socketable_items() end

---@param item_id any
---@return item_data
function get_item_info(item_id) end

---@return number (float)
function get_roll() end

---@return number (float)
function get_roll_min() end

---@return number (float)
function get_roll_max() end

---@return string
function get_name() end

---@return number (int)
function get_rarity_type() end

---@return userdata
function get_affix_data() end

---@return number (int64)
function get_affix_seed() end

---@return string
function get_skin_name() end

---@return string
function get_name() end

---@return string
function get_name() end

---@return bool
function is_sacred() end

---@return bool
function is_ancestral() end

---@return item_rarity
function get_rarity() end

---@return bool
function is_junk() end

---@return bool
function is_locked() end

---@return table of [item_data_affix]
function get_affixes() end

---@return number (float)
function get_durability() end

---@return userdata
function get_acd() end

---@return number (int)
function get_sno_id() end

---@return number (int)
function get_balance_offset() end

---@return number (int)
function get_inventory_row() end

---@return number (int)
function get_inventory_column() end

---@return number (int)
function get_price() end

---@return number (int)
function get_stack_count() end
