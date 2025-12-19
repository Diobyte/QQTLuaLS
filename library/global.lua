---@meta

---@see https://github.com/qqtnn/qqt_diablo.wiki.git/wiki/Global-Functions

---@alias spell_id number
---@alias waypoint_id number

---@return game_object
---@description Accesses the game object representing the local player, essential for many player-centric operations. See also: get_player_position() for positioning.
---@example local player = get_local_player()
---@since 1.0.0
function get_local_player() end

---@return string
---@description Retrieves Character Name of Local Player.
---@example local name = get_local_player_name()
---@since 1.0.0
function get_local_player_name() end

---@return vec3
---@description Retrieves the current geographical position of the local player in the game world, useful for navigation and positioning strategies. See also: get_local_player() for player object.
---@example local pos = get_player_position()
---@since 1.0.0
function get_player_position() end

---@return game_object[]
---@description Gathers a comprehensive list of all active game actors, providing a broad overview of the entities present in the current game environment.
---@example local actors = get_actors_list()
function get_actors_list() end

---@return game_object[]
---@description Fetches a list of all game objects that are currently attached, offering insights into various game entities and their interactions.
function get_attachments_list() end

---@param str string
---@return number
---@description Converts a given string into a hash integer, facilitating efficient data storage and retrieval operations.
function get_hash(str) end

---@return vec3
---@description Obtains the precise position of the cursor in the game world, useful for UI interactions and in-game targeting.
function get_cursor_position() end

---@return number
---@description Provides the current in-game time, essential for time-based events and game dynamics.
function get_gametime() end

---@return number
---@description Measures the duration since the last code injection, offering a timing benchmark for scripts and operations.
function get_time_since_inject() end

---@return number[]
function get_equipped_spell_ids() end

---@param spell_id number
---@return string
---@description Returns the name of the spell for the given spell ID.
function get_name_for_spell(spell_id) end

---@return boolean
---@description Return boolean of inventory open state.
function is_inventory_open() end

---@return number
---@description Returns a number indicating which inventory is open.
function get_open_inventory_bag() end

---@param key number
---@return boolean
---@description Checks if the specified key is currently pressed down.
function get_key_state(key) end

---@return table
---@description Retrieves a table of all active quests in the game.
function get_quests() end

---@return game_object
---@description Fetches the game object that is currently being hovered by the cursor.
function get_hovered_item() end

---@param object game_object
---@return boolean
---@description Initiates an interaction with the specified game object.
function interact_object(object) end

---@param object game_object
---@return nil
---@description Initiates an interaction with the specified vendor object.
function interact_vendor(object) end

---@return number
---@description Retrieves the current width of the game screen in pixels.
function get_screen_width() end

---@return number
---@description Retrieves the current height of the game screen in pixels.
function get_screen_height() end

---@return number
---@description Retrieves the current count of Helltide coin cinders.
function get_helltide_coin_cinders() end

---@return number
---@description Retrieves the current count of Helltide coin hearts.
function get_helltide_coin_hearts() end

---@return boolean
---@description Initiates the action to exit the current dungeon, useful for automating transitions or escaping unfavorable situations.
function leave_dungeon() end

---@return nil
---@description Revives the player at the nearest checkpoint.
function revive_at_checkpoint() end

---@return nil
---@description Starts the game session.
function start_game() end

---@return nil
---@description Leaves the current game session.
function leave_game() end

---@return nil
---@description Uses a health potion to restore the player's health.
function use_health_potion() end

---@return nil
---@description Initiates the action to reset dungeons which also kicks you for any dungeon you are into
function reset_all_dungeons() end

---@param id number
---@return nil
---@description Initiates the action to teleport to an specific waypoint
function teleport_to_waypoint(id) end

---@param alpha number
---@return color
---@description Creates a white color with specified alpha transparency.
function color_white(alpha) end

---@param alpha number
---@return color
---@description Creates a black color with specified alpha transparency.
function color_black(alpha) end

---@param alpha number
---@return color
---@description Creates a yellow color with specified alpha transparency.
function color_yellow(alpha) end

---@param alpha number
---@return color
---@description Creates a red color with specified alpha transparency.
function color_red(alpha) end

---@param alpha number
---@return color
---@description Creates a green color with specified alpha transparency.
function color_green(alpha) end

---@param alpha number
---@return color
---@description Creates a blue color with specified alpha transparency.
function color_blue(alpha) end

---@param alpha number
---@return color
---@description Creates a pink color with specified alpha transparency.
function color_pink(alpha) end

---@param alpha number
---@return color
---@description Creates a purple color with specified alpha transparency.
function color_purple(alpha) end

---@param alpha number
---@return color
---@description Creates a grey color with specified alpha transparency.
function color_grey(alpha) end

---@param alpha number
---@return color
---@description Creates a brown color with specified alpha transparency.
function color_brown(alpha) end

---@param alpha number
---@return color
---@description Creates a gold color with specified alpha transparency.
function color_gold(alpha) end

---@param alpha number
---@return color
---@description Creates a silver color with specified alpha transparency.
function color_silver(alpha) end

---@param alpha number
---@return color
---@description Creates an orange color with specified alpha transparency.
function color_orange(alpha) end

---@param alpha number
---@return color
---@description Creates a cyan color with specified alpha transparency.
function color_cyan(alpha) end

---@param alpha number
---@return color
---@description Creates a green pastel color with specified alpha transparency.
function color_green_pastel(alpha) end

---@param alpha number
---@return color
---@description Creates a red pale color with specified alpha transparency.
function color_red_pale(alpha) end

---@param alpha number
---@return color
---@description Creates a green pale color with specified alpha transparency.
function color_green_pale(alpha) end

---@param alpha number
---@return color
---@description Creates a blue pale color with specified alpha transparency.
function color_blue_pale(alpha) end

---@param alpha number
---@return color
---@description Creates a cyan pale color with specified alpha transparency.
function color_cyan_pale(alpha) end

---@param alpha number
---@return color
---@description Creates a gray pale color with specified alpha transparency.
function color_gray_pale(alpha) end

---@param alpha number
---@return color
---@description Creates a gray clear color with specified alpha transparency.
function color_gray_clear(alpha) end

---@param alpha number
---@return color
---@description Creates an orange red color with specified alpha transparency.
function color_orange_red(alpha) end

---@class waypoints_enum
local waypoints_enum = {
    GEA_KUL = 0xB66AB,
    IRON_WOLVES_ENCAMPMENT = 0xDEAFC,
    IMPERIAL_LIBRARY = 0x10D63D,
    DENSHAR = 0x8AF45,
    TARSARAK = 0x8C7B7,
    ZARBINZET = 0xA46E5,
    JIRANDAI = 0x462E2,
    ALZUUDA = 0x792DA,
    WEJINHANI = 0x9346B,
    RUINS_OF_RAKHAT_KEEP_INNER_COURT = 0xF77C2,
    THE_TREE_OF_WHISPERS = 0x90557,
    BACKWATER = 0xA491F,
    KED_BARDU = 0x34CE7,
    HIDDEN_OVERLOOK = 0x460D4,
    FATES_RETREAT = 0xEEEB3,
    FAROBRU = 0x2D392,
    TUR_DULRA = 0x8D596,
    MAROWEN = 0x27E01,
    BRAESTAIG = 0x7FD82,
    CERRIGAR = 0x76D58,
    FIREBREAK_MANOR = 0x803EE,
    CORBACH = 0x22EBE,
    TIRMAIR = 0xB92BE,
    UNDER_THE_FAT_GOOSE_INN = 0xEED6B,
    MENESTAD = 0xACE9B,
    KYOVASHAD = 0x6CC71,
    BEAR_TRIBE_REFUGE = 0x8234E,
    MARGRAVE = 0x90A86,
    YELESNA = 0x833F8,
    NEVESK = 0x6D945,
    NOSTRAVA = 0x8547F
}
