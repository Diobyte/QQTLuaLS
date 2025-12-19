---@meta

---@return game_object
function get_local_player() end

---@return string
function get_local_player_name() end

---@return vec3
function get_player_position() end

---@return game_object[]
function get_actors_list() end

---@return game_object[]
function get_attachments_list() end

---@param str string
---@return number
function get_hash(str) end

---@return vec3
function get_cursor_position() end

---@return number
function get_gametime() end

---@return number
function get_time_since_inject() end

---@return number[]
function get_equipped_spell_ids() end

---@param spell_id number
---@return string
function get_name_for_spell(spell_id) end

---@return boolean
function is_inventory_open() end

---@return number
function get_open_inventory_bag() end

---@param key number
---@return boolean
function get_key_state(key) end

---@return table
function get_quests() end

---@return game_object
function get_hovered_item() end

---@param object game_object
---@return boolean
function interact_object(object) end

---@param object game_object
function interact_vendor(object) end

---@return number
function get_screen_width() end

---@return number
function get_screen_height() end

---@return number
function get_helltide_coin_cinders() end

---@return number
function get_helltide_coin_hearts() end

---@return boolean
function leave_dungeon() end

---@return boolean
function revive_at_checkpoint() end

---@return boolean
function start_game() end

function leave_game() end

function use_health_potion() end

function reset_all_dungeons() end

---@param id number
function teleport_to_waypoint(id) end
