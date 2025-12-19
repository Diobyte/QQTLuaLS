---@meta

---@class cast_spell
cast_spell = {}

---@param spell_id any
---@param animation_time any
function cast_spell.self(spell_id, animation_time) end

---@param target any
---@param spell_id any
---@param animation_time any
---@param is_debug_mode any
---@return boolean
function cast_spell.target(target, spell_id, animation_time, is_debug_mode) end

---@param target any
---@param spell_data any
---@param is_debug_mode any
---@return boolean
function cast_spell.target(target, spell_data, is_debug_mode) end

---@param spell_id any
---@param position any
---@param animation_time any
---@return boolean
function cast_spell.position(spell_id, position, animation_time) end

---@param spell_id any
---@param start_time any
---@param finish_time any
---@param cast_target any
---@param cast_position any
---@param animation_time any
---@param interval any
---@return boolean
function cast_spell.add_channel_spell(spell_id, start_time, finish_time, cast_target, cast_position, animation_time,
                                      interval)
end

---@param pause_duration any
function cast_spell.pause_all_channel_spells(pause_duration) end

---@param spell_id any
---@param pause_duration any
function cast_spell.pause_specific_channel_spell(spell_id, pause_duration) end

---@param spell_id any
function cast_spell.is_channel_spell_active(spell_id) end

---@param spell_id any
---@param new_target any
---@return boolean
function cast_spell.update_channel_spell_target(spell_id, new_target) end

---@param spell_id any
---@param new_position any
function cast_spell.update_channel_spell_position(spell_id, new_position) end

---@param spell_id any
---@param new_finish_time any
function cast_spell.update_channel_spell_finish_time(spell_id, new_finish_time) end

---@param spell_id any
---@param new_start_time any
function cast_spell.update_channel_spell_start_time(spell_id, new_start_time) end

---@param spell_id any
---@param new_animation_time any
function cast_spell.update_channel_spell_animation_time(spell_id, new_animation_time) end

---@param spell_id any
---@param new_interval any
function cast_spell.update_channel_spell_interval(spell_id, new_interval) end

---@param spell_id any
function cast_spell.remove_channel_spell(spell_id) end
