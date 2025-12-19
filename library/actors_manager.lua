---@meta

---@see https://github.com/Diobit27/QQTLuaLS/wiki/Actors-Manager

---@class actors_manager

local actors_manager = {}

---@return game_object[]
---@description Returns a table with all actors in game memory.
---@example local all_actors = actors_manager.get_all_actors()
---@since 1.0.0
function actors_manager.get_all_actors() end

---@return game_object[]
---@description Returns a table with all enemy actors in game memory.
---@example local enemies = actors_manager.get_enemy_actors()
---@return any
---@description TODO: Add description for actors_manager.get_enemy_actors()
---@example local result = actors_manager.get_enemy_actors()()
---@since 1.0.0
function actors_manager.get_enemy_actors() end

---@return game_object[]
---@description Returns a table with all ally actors in game memory.
---@example local allies = actors_manager.get_ally_actors()
---@since 1.0.0
function actors_manager.get_ally_actors() end

---@return game_object[]
---@description Returns a table with all particles in game memory.
---@example local particles = actors_manager.get_all_particles()
---@return any
---@description TODO: Add description for actors_manager.get_all_particles()
---@example local result = actors_manager.get_all_particles()()
---@since 1.0.0
function actors_manager.get_all_particles() end

---@return game_object[]
---@description Returns a table with all ally particles in game memory.
---@example local ally_particles = actors_manager.get_ally_particles()
---@since 1.0.0
function actors_manager.get_ally_particles() end

---@return game_object[]
---@description Returns a table with all enemy particles in game memory.
---@example local enemy_particles = actors_manager.get_enemy_particles()
---@return any
---@description TODO: Add description for actors_manager.get_enemy_particles()
---@example local result = actors_manager.get_enemy_particles()()
---@since 1.0.0
function actors_manager.get_enemy_particles() end

---@return game_object[]
---@description Returns a table with all players in game memory.
---@example local players = actors_manager.get_all_players()
---@description TODO: Add description for actors_manager.get_all_players()
---@example local result = actors_manager.get_all_players()()
---@since 1.0.0
function actors_manager.get_all_players() end

---@return game_object[]
---@description Returns a table with all ally players in game memory.
---@example local allies = actors_manager.get_ally_players()
---@since 1.0.0
function actors_manager.get_ally_players() end

---@return game_object[]
---@description Returns a table with all enemy players in game memory.
---@example local enemies = actors_manager.get_enemy_players()
---@since 1.0.0
function actors_manager.get_enemy_players() end

---@return game_object[]
---@description Returns a table with all npc in game memory.
---@example local result = actors_manager.get_all_npcs()()
---@since 1.0.0
function actors_manager.get_all_npcs() end

---@return game_object[]
---@description Returns a table with all ally npc in game memory.
---@return any
---@description TODO: Add description for actors_manager.get_ally_npcs()
---@example local result = actors_manager.get_ally_npcs()()
---@since 1.0.0
function actors_manager.get_ally_npcs() end

---@return game_object[]
---@description Fetches data on enemy NPCs, organizing it in a table format. See also: vec3:squared_dist_to_ignore_z() for efficient proximity checks.
---@example local enemies = actors_manager.get_enemy_npcs()
---@example for _, enemy in ipairs(enemies) do
---@example     local dist_sq = enemy:get_position():squared_dist_to_ignore_z(get_player_position())
---@example     if dist_sq < 64 then -- within 8 units
---@example         -- Handle close enemy
---@example     end
---@example end
---@since 1.0.0
---@return any
---@description TODO: Add description for actors_manager.get_enemy_npcs()
---@example local result = actors_manager.get_enemy_npcs()()
---@since 1.0.0
function actors_manager.get_enemy_npcs() end

---@return game_object[]
---@description Returns a table with all items in game memory.
---@return any
---@description TODO: Add description for actors_manager.get_all_items()
---@example local result = actors_manager.get_all_items()()
---@since 1.0.0
function actors_manager.get_all_items() end
