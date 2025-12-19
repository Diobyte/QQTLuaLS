---@meta

---@see https://github.com/qqtnn/qqt_diablo/wiki/Actors-Manager

---@class actors_manager
local actors_manager = {}

---@return game_object[]
---@description Returns a table with all actors in game memory.
---@example local all = actors_manager.get_all_actors()
---@since 1.0.0
function actors_manager.get_all_actors() end

---@return game_object[]
---@description Returns a table with all enemy actors in game memory.
function actors_manager.get_enemy_actors() end

---@return game_object[]
---@description Returns a table with all ally actors in game memory.
function actors_manager.get_ally_actors() end

---@return game_object[]
---@description Returns a table with all particles in game memory.
function actors_manager.get_all_particles() end

---@return game_object[]
---@description Returns a table with all ally particles in game memory.
function actors_manager.get_ally_particles() end

---@return game_object[]
---@description Returns a table with all enemy particles in game memory.
function actors_manager.get_enemy_particles() end

---@return game_object[]
---@description Returns a table with all players in game memory.
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
---@description Returns a table with all enemy npc in game memory.
function actors_manager.get_enemy_npcs() end

---@return game_object[]
---@description Returns a table with all items in game memory.
function actors_manager.get_all_items() end

return actors_manager
