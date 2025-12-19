---@meta

---@see https://github.com/qqtnn/qqt_diablo.wiki.git/wiki/Actors-Manager

---@class actors_manager

local actors_manager = {}

---@return game_object[]
---@description Returns a table with all actors in game memory.
---@example local all_actors = actors_manager.get_all_actors()
function actors_manager.get_all_actors() end

---@return game_object[]
---@description Returns a table with all enemy actors in game memory.
---@example local enemies = actors_manager.get_enemy_actors()
function actors_manager.get_enemy_actors() end

---@return game_object[]
---@description Returns a table with all ally actors in game memory.
---@example local allies = actors_manager.get_ally_actors()
function actors_manager.get_ally_actors() end

---@return game_object[]
---@description Returns a table with all particles in game memory.
---@example local particles = actors_manager.get_all_particles()
function actors_manager.get_all_particles() end

---@return game_object[]
---@description Returns a table with all ally particles in game memory.
---@example local ally_particles = actors_manager.get_ally_particles()
function actors_manager.get_ally_particles() end

---@return game_object[]
---@description Returns a table with all enemy particles in game memory.
---@example local enemy_particles = actors_manager.get_enemy_particles()
function actors_manager.get_enemy_particles() end

---@return game_object[]
---@description Returns a table with all players in game memory.
---@example local players = actors_manager.get_all_players()
function actors_manager.get_all_players() end

---@return game_object[]
---@description Returns a table with all ally players in game memory.
function actors_manager.get_ally_players() end

---@return game_object[]
---@description Returns a table with all enemy players in game memory.
function actors_manager.get_enemy_players() end

---@return game_object[]
---@description Returns a table with all npc in game memory.
function actors_manager.get_all_npcs() end

---@return game_object[]
---@description Returns a table with all ally npc in game memory.
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
function actors_manager.get_enemy_npcs() end

---@return game_object[]
---@description Returns a table with all items in game memory.
function actors_manager.get_all_items() end
