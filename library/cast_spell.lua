---@meta

---@see https://github.com/qqtnn/qqt_diablo.wiki.git/wiki/Cast-Spell

---@class cast_spell

local cast_spell = {}

---@param spell_id number
---@param animation_time number
---@return boolean
---@description Casts a spell on the caster with specified animation time.
function cast_spell.self(spell_id, animation_time) end

---@overload fun(self, target: game_object, spell_id: number, animation_time: number, is_debug_mode: boolean): boolean
---@overload fun(self, target: game_object, spell_data: spell_data, is_debug_mode: boolean): boolean
---@param target game_object
---@param spell_id number
---@param animation_time number
---@param is_debug_mode boolean
---@return boolean
---@description Casts a spell towards a specific target with animation time and an optional debug mode.
function cast_spell.target(target, spell_id, animation_time, is_debug_mode) end

---@param spell_id number
---@param position vec3
---@param animation_time number
---@return boolean
---@description Casts a spell on a specified [`vec3`] position with given animation time.
function cast_spell.position(spell_id, position, animation_time) end

---@param spell_id number
---@param start_time? number
---@param finish_time? number
---@param cast_target? game_object
---@param cast_position? vec3
---@param animation_time? number
---@param interval? number
---@return boolean
---@description Adds a channel spell with specified parameters. Defaults are provided for optional parameters.
---@example local success = cast_spell.add_channel_spell(123, 0.0, 2.0, target, pos, 1.0, 0.1)
function cast_spell.add_channel_spell(spell_id, start_time, finish_time, cast_target, cast_position, animation_time,
                                      interval)
    return true
end

---@param pause_duration number
---@return boolean
---@description Pauses all active channel spells for the specified duration.
---@example local success = cast_spell.pause_all_channel_spells(2.0)
function cast_spell.pause_all_channel_spells(pause_duration) end

---@param spell_id number
---@param pause_duration number
---@return boolean
---@description Pauses a specific channel spell by its identifier for the specified duration.
function cast_spell.pause_specific_channel_spell(spell_id, pause_duration) end

---@param spell_id number
---@return boolean
---@description Checks if a specific spell is currently active in the channel spell handler.
function cast_spell.is_channel_spell_active(spell_id) end

---@param spell_id number
---@param new_target game_object
---@return boolean
---@description Updates the target object of a specific channel spell.
function cast_spell.update_channel_spell_target(spell_id, new_target) end

---@param spell_id number
---@param new_position vec3
---@return boolean
---@description Updates the position of a specific channel spell.
function cast_spell.update_channel_spell_position(spell_id, new_position) end

---@param spell_id number
---@param new_finish_time number
---@return boolean
---@description Updates the finish time of a specific channel spell.
function cast_spell.update_channel_spell_finish_time(spell_id, new_finish_time) end

---@param spell_id number
---@param new_start_time number
---@return boolean
---@description Updates the start time of a specific channel spell.
function cast_spell.update_channel_spell_start_time(spell_id, new_start_time) end

---@param spell_id number
---@param new_animation_time number
---@return boolean
---@description Updates the animation time of a specific channel spell.
function cast_spell.update_channel_spell_animation_time(spell_id, new_animation_time) end

---@param spell_id number
---@param new_interval number
---@return boolean
---@description Updates the interval time of a specific channel spell.
function cast_spell.update_channel_spell_interval(spell_id, new_interval) end

---@param spell_id number
---@return boolean
---@description Removes a specific channel spell by its identifier.
function cast_spell.remove_channel_spell(spell_id) end
