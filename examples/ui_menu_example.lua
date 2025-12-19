-- UI and Menu Example Script
-- Demonstrates menu creation and UI elements

-- Menu configuration
local menu_config = {
    enabled = true,
    combat_range = 8.0,
    show_visuals = true,
    auto_loot = false
}

-- Create main menu
local main_menu = menu_elements.new("QQT Combat Script")

-- Add menu elements
local enabled_checkbox = main_menu:add_checkbox("Enable Script", menu_config.enabled)
local range_slider = main_menu:add_slider_float("Combat Range", 5.0, 15.0, menu_config.combat_range, "%.1f")
local visuals_checkbox = main_menu:add_checkbox("Show Visuals", menu_config.show_visuals)
local loot_checkbox = main_menu:add_checkbox("Auto Loot", menu_config.auto_loot)

-- Color picker for visual customization
local circle_color = main_menu:add_colorpicker("Circle Color", color_red(200))

-- Update configuration from menu
local function update_config()
    menu_config.enabled = enabled_checkbox:get()
    menu_config.combat_range = range_slider:get()
    menu_config.show_visuals = visuals_checkbox:get()
    menu_config.auto_loot = auto_loot_checkbox:get()
end

-- Visual rendering
local function render_visuals()
    if not menu_config.show_visuals then return end

    local enemies = actors_manager.get_enemy_npcs()
    local player_pos = get_player_position()

    if not enemies or not player_pos then return end

    for _, enemy in ipairs(enemies) do
        if not enemy:is_dead() then
            local enemy_pos = enemy:get_position()
            if enemy_pos then
                local dist_sq = enemy_pos:squared_dist_to_ignore_z(player_pos)
                if dist_sq <= (menu_config.combat_range * menu_config.combat_range) then
                    -- Draw circle with selected color
                    graphics.circle_3d(enemy_pos, 1.5, circle_color:get())
                end
            end
        end
    end
end

-- Auto loot functionality
local function auto_loot_items()
    if not menu_config.auto_loot then return end

    local items = loot_manager.get_near_item_list(get_player_position(), 5.0)
    if items then
        for _, item in ipairs(items) do
            if loot_manager.is_lootable_item(item, true, true) then
                loot_manager.loot_item(item)
            end
        end
    end
end

-- Main update loop
on_update(function()
    if not menu_config.enabled then return end

    update_config()
    auto_loot_items()
end)

-- Render loop
on_render(function()
    if not menu_config.enabled then return end

    render_visuals()

    -- Draw range indicator
    local player_pos = get_player_position()
    if player_pos then
        graphics.circle_3d(player_pos, menu_config.combat_range, color_blue(100))
    end
end)

-- Render menu
on_render_menu(function()
    main_menu:render()
end)

print("UI and Menu example script loaded!")
print("Access the menu with the game's menu key to configure settings.")
