---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Global-Functions

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
---@since 1.0.0
function get_actors_list() end

---@return game_object[]
---@description Fetches a list of all game objects that are currently attached, offering insights into various game entities and their interactions.
---@return game_object[]
---@description Fetches a list of all game objects that are currently attached, offering insights into various game entities and their interactions.
---@example local attachments = get_attachments_list()
---@since 1.0.0
function get_attachments_list() end

---@param str string
---@return number
---@description Converts a given string into a hash integer, facilitating efficient data storage and retrieval operations.
---@example local hash = get_hash("example")
---@since 1.0.0
function get_hash(str) end

---@return vec3
---@description Obtains the precise position of the cursor in the game world, useful for UI interactions and in-game targeting.
---@example local cursor_pos = get_cursor_position()
---@since 1.0.0
function get_cursor_position() end

---@return number
---@description Provides the current in-game time, essential for time-based events and game dynamics.
---@example local time = get_gametime()
---@since 1.0.0
function get_gametime() end

---@return number
---@description Measures the duration since the last code injection, offering a timing benchmark for scripts and operations.
---@example local time_elapsed = get_time_since_inject()
---@since 1.0.0
function get_time_since_inject() end

---@return number[]
---@description Retrieves the IDs of all currently equipped spells, providing access to the player's active spell configuration.
---@example local spell_ids = get_equipped_spell_ids()
---@since 1.0.0
function get_equipped_spell_ids() end

---@param spell_id number
---@return string
---@description Returns the name of the spell for the given spell ID.
---@return any
---@description TODO: Add description for get_name_for_spell(spell_id)
---@example local result = get_name_for_spell(spell_id)()
---@since 1.0.0
function get_name_for_spell(spell_id) end

---@return boolean
---@description Return boolean of inventory open state.
---@return any
---@description TODO: Add description for is_inventory_open()
---@example local result = is_inventory_open()()
---@since 1.0.0
function is_inventory_open() end

---@return number
---@description Returns a number indicating which inventory is open.
---@return any
---@description TODO: Add description for get_open_inventory_bag()
---@example local result = get_open_inventory_bag()()
---@since 1.0.0
function get_open_inventory_bag() end

---@param key number
---@return boolean
---@description Checks if the specified key is currently pressed down.
---@return any
---@description TODO: Add description for get_key_state(key)
---@example local result = get_key_state(key)()
---@since 1.0.0
function get_key_state(key) end

---@return table
---@description Retrieves a table of all active quests in the game.
---@example local quests = get_quests()
---@since 1.0.0
function get_quests() end

---@return game_object
---@description Fetches the game object that is currently being hovered by the cursor.
---@return any
---@description TODO: Add description for get_hovered_item()
---@example local result = get_hovered_item()()
---@since 1.0.0
function get_hovered_item() end

---@param object game_object
---@return boolean
---@description Initiates an interaction with the specified game object.
---@return any
---@description TODO: Add description for interact_object(object)
---@example local result = interact_object(object)()
---@since 1.0.0
function interact_object(object) end

---@param object game_object
---@return nil
---@description Initiates an interaction with the specified vendor object.
---@example interact_vendor(vendor_obj)
---@since 1.0.0
function interact_vendor(object) end

---@return number
---@description Retrieves the current width of the game screen in pixels.
---@example local result = get_screen_width()()
---@since 1.0.0
function get_screen_width() end

---@return number
---@description Retrieves the current height of the game screen in pixels.
---@example local height = get_screen_height()
---@since 1.0.0
function get_screen_height() end

---@return number
---@description Retrieves the current count of Helltide coin cinders.
---@description TODO: Add description for get_helltide_coin_cinders()
---@example local result = get_helltide_coin_cinders()()
---@since 1.0.0
function get_helltide_coin_cinders() end

---@return number
---@description Retrieves the current count of Helltide coin hearts.
---@example local hearts = get_helltide_coin_hearts()
---@since 1.0.0
function get_helltide_coin_hearts() end

---@return boolean
---@description Initiates the action to exit the current dungeon, useful for automating transitions or escaping unfavorable situations.
---@description TODO: Add description for leave_dungeon()
---@example local result = leave_dungeon()()
---@since 1.0.0
function leave_dungeon() end

---@return nil
---@description Revives the player at the nearest checkpoint.
---@return any
---@description TODO: Add description for revive_at_checkpoint()
---@example local result = revive_at_checkpoint()()
---@since 1.0.0
function revive_at_checkpoint() end

---@return nil
---@description Starts the game session.
---@example start_game()
---@since 1.0.0
function start_game() end

---@return nil
---@description Leaves the current game session.
---@example leave_game()
---@since 1.0.0
function leave_game() end

---@return nil
---@description Uses a health potion to restore the player's health.
---@description TODO: Add description for use_health_potion()
---@example local result = use_health_potion()()
---@since 1.0.0
function use_health_potion() end

---@return nil
---@description Initiates the action to reset dungeons which also kicks you for any dungeon you are into
---@return any
---@description TODO: Add description for reset_all_dungeons()
---@example local result = reset_all_dungeons()()
---@since 1.0.0
function reset_all_dungeons() end

---@param id number
---@return nil
---@description Initiates the action to teleport to an specific waypoint
---@example local result = teleport_to_waypoint(id)()
---@since 1.0.0
function teleport_to_waypoint(id) end

---@param alpha number
---@return color
---@description Creates a white color with specified alpha transparency.
---@return any
---@description TODO: Add description for color_white(alpha)
---@example local result = color_white(alpha)()
---@since 1.0.0
function color_white(alpha) end

---@param alpha number
---@return color
---@description Creates a black color with specified alpha transparency.
---@return any
---@description TODO: Add description for color_black(alpha)
---@example local result = color_black(alpha)()
---@since 1.0.0
function color_black(alpha) end

---@param alpha number
---@return color
---@description Creates a yellow color with specified alpha transparency.
---@return any
---@description TODO: Add description for color_yellow(alpha)
---@example local result = color_yellow(alpha)()
---@since 1.0.0
function color_yellow(alpha) end

---@param alpha number
---@return color
---@description Creates a red color with specified alpha transparency.
---@return any
---@description TODO: Add description for color_red(alpha)
---@example local result = color_red(alpha)()
---@since 1.0.0
function color_red(alpha) end

---@param alpha number
---@return color
---@description Creates a green color with specified alpha transparency.
---@return any
---@description TODO: Add description for color_green(alpha)
---@example local result = color_green(alpha)()
---@since 1.0.0
function color_green(alpha) end

---@param alpha number
---@return color
---@description Creates a blue color with specified alpha transparency.
---@return any
---@description TODO: Add description for color_blue(alpha)
---@example local result = color_blue(alpha)()
---@since 1.0.0
function color_blue(alpha) end

---@param alpha number
---@return color
---@description Creates a pink color with specified alpha transparency.
---@return any
---@description TODO: Add description for color_pink(alpha)
---@example local result = color_pink(alpha)()
---@since 1.0.0
function color_pink(alpha) end

---@param alpha number
---@return color
---@description Creates a purple color with specified alpha transparency.
---@return any
---@description TODO: Add description for color_purple(alpha)
---@example local result = color_purple(alpha)()
---@since 1.0.0
function color_purple(alpha) end

---@param alpha number
---@return color
---@description Creates a grey color with specified alpha transparency.
---@return any
---@description TODO: Add description for color_grey(alpha)
---@example local result = color_grey(alpha)()
---@since 1.0.0
function color_grey(alpha) end

---@param alpha number
---@return color
---@description Creates a brown color with specified alpha transparency.
---@return any
---@description TODO: Add description for color_brown(alpha)
---@example local result = color_brown(alpha)()
---@since 1.0.0
function color_brown(alpha) end

---@param alpha number
---@return color
---@description Creates a gold color with specified alpha transparency.
---@return any
---@description TODO: Add description for color_gold(alpha)
---@example local result = color_gold(alpha)()
---@since 1.0.0
function color_gold(alpha) end

---@param alpha number
---@return color
---@description Creates a silver color with specified alpha transparency.
---@return any
---@description TODO: Add description for color_silver(alpha)
---@example local result = color_silver(alpha)()
---@since 1.0.0
function color_silver(alpha) end

---@param alpha number
---@return color
---@description Creates an orange color with specified alpha transparency.
---@return any
---@description TODO: Add description for color_orange(alpha)
---@example local result = color_orange(alpha)()
---@since 1.0.0
function color_orange(alpha) end

---@param alpha number
---@return color
---@description Creates a cyan color with specified alpha transparency.
---@return any
---@description TODO: Add description for color_cyan(alpha)
---@example local result = color_cyan(alpha)()
---@since 1.0.0
function color_cyan(alpha) end

---@param alpha number
---@return color
---@description Creates a green pastel color with specified alpha transparency.
---@return any
---@description TODO: Add description for color_green_pastel(alpha)
---@example local result = color_green_pastel(alpha)()
---@since 1.0.0
function color_green_pastel(alpha) end

---@param alpha number
---@return color
---@description Creates a red pale color with specified alpha transparency.
---@return any
---@description TODO: Add description for color_red_pale(alpha)
---@example local result = color_red_pale(alpha)()
---@since 1.0.0
function color_red_pale(alpha) end

---@param alpha number
---@return color
---@description Creates a green pale color with specified alpha transparency.
---@return any
---@description TODO: Add description for color_green_pale(alpha)
---@example local result = color_green_pale(alpha)()
---@since 1.0.0
function color_green_pale(alpha) end

---@param alpha number
---@return color
---@description Creates a blue pale color with specified alpha transparency.
---@return any
---@description TODO: Add description for color_blue_pale(alpha)
---@example local result = color_blue_pale(alpha)()
---@since 1.0.0
function color_blue_pale(alpha) end

---@param alpha number
---@return color
---@description Creates a cyan pale color with specified alpha transparency.
---@return any
---@description TODO: Add description for color_cyan_pale(alpha)
---@example local result = color_cyan_pale(alpha)()
---@since 1.0.0
function color_cyan_pale(alpha) end

---@param alpha number
---@return color
---@description Creates a gray pale color with specified alpha transparency.
---@return any
---@description TODO: Add description for color_gray_pale(alpha)
---@example local result = color_gray_pale(alpha)()
---@since 1.0.0
function color_gray_pale(alpha) end

---@param alpha number
---@return color
---@description Creates a gray clear color with specified alpha transparency.
---@return any
---@description TODO: Add description for color_gray_clear(alpha)
---@example local result = color_gray_clear(alpha)()
---@since 1.0.0
function color_gray_clear(alpha) end

---@param alpha number
---@return color
---@description Creates an orange red color with specified alpha transparency.
---@return any
---@description TODO: Add description for color_orange_red(alpha)
---@example local result = color_orange_red(alpha)()
---@since 1.0.0
function color_orange_red(alpha) end

---@enum waypoints_enum
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
