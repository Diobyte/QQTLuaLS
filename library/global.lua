---@meta

function get_local_player() end

function get_local_player_name() end

function get_player_position() end

function get_actors_list() end

function get_attachments_list() end

---@param str any
function get_hash(str) end

function get_cursor_position() end

function get_gametime() end

function get_time_since_inject() end

function get_equipped_spell_ids() end

---@param spell_id any
function get_name_for_spell(spell_id) end

function is_inventory_open() end

function get_open_inventory_bag() end

---@param key any
function get_key_state(key) end

function get_quests() end

function get_hovered_item() end

---@param object any
function interact_object(object) end

---@param object any
function interact_vendor(object) end

---@return void
function get_screen_width() end

---@return void
function get_screen_height() end

function get_helltide_coin_cinders() end

function get_helltide_coin_hearts() end

---@return bool
function leave_dungeon() end

---@return bool
function revive_at_checkpoint() end

---@return bool
function start_game() end

---@return void
function leave_game() end

---@return void
function use_health_potion() end

---@return void
function reset_all_dungeons() end

---@param id any
---@return nil
function teleport_to_waypoint(id) end
