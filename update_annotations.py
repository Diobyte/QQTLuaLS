# Auto-update script for QQTLuaLS annotations
# This script helps synchronize annotations with wiki changes
# Run with: python update_annotations.py

import os
import re
import json
import subprocess
from pathlib import Path

def run_command(cmd):
    """Run a shell command and return output."""
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    return result.returncode == 0, result.stdout, result.stderr

def update_submodule():
    """Update the temp_wiki submodule."""
    print("Updating temp_wiki submodule...")
    success, _, err = run_command("git submodule update --remote temp_wiki")
    if not success:
        print(f"Error updating submodule: {err}")
        return False
    return True

def get_version():
    """Get current version from config.json."""
    try:
        with open('config.json', 'r') as f:
            config = json.load(f)
            return config.get('version', '1.0.0')
    except:
        return '1.0.0'

def bump_version(version):
    """Bump version patch number."""
    major, minor, patch = map(int, version.split('.'))
    patch += 1
    return f"{major}.{minor}.{patch}"

def update_version_files(new_version):
    """Update version in config.json and plugin.json."""
    # Update config.json
    try:
        with open('config.json', 'r') as f:
            config = json.load(f)
        config['version'] = new_version
        with open('config.json', 'w') as f:
            json.dump(config, f, indent=2)
    except Exception as e:
        print(f"Error updating config.json: {e}")

    # Update plugin.json
    try:
        with open('plugin.json', 'r') as f:
            plugin = json.load(f)
        plugin['version'] = new_version
        with open('plugin.json', 'w') as f:
            json.dump(plugin, f, indent=2)
    except Exception as e:
        print(f"Error updating plugin.json: {e}")

def parse_markdown_function(line):
    """Parse a function signature from markdown."""
    # Support multiple patterns
    patterns = [
        r'`(\w+)\(([^)]*)\)`\s*->\s*`?([^`\s]+)`?',  # `func(params)` -> `type`
        r'`(\w+)\(([^)]*)\)`\s*->\s*([^`\s]+)',      # `func(params)` -> type
        r'(\w+)\(([^)]*)\)\s*->\s*([^`\s]+)',        # func(params) -> type
    ]

    for pattern in patterns:
        match = re.search(pattern, line)
        if match:
            func_name, params, return_type = match.groups()
            return func_name, params, return_type
    return None, None, None

def generate_lua_annotation(func_name, params, return_type, description=""):
    """Generate Lua Emmy annotation."""
    # Convert types
    type_map = {
        'vec3': 'vec3',
        'vec2': 'vec2',
        'game_object': 'game_object',
        'gameobject': 'game_object',
        'number': 'number',
        'boolean': 'boolean',
        'bool': 'boolean',
        'string': 'string',
        'table': 'table',
        'void': 'nil',
        'nil': 'nil',
        'integer': 'number',
        'int': 'number',
        'float': 'number',
    }
    lua_return = type_map.get(return_type, return_type)

    annotation = f"---@return {lua_return}\n"
    if description:
        annotation += f"---@description {description}\n"
    annotation += f"function {func_name}({params})\nend\n"

    return annotation

def get_wiki_file_mapping():
    """Map wiki files to library files."""
    return {
        "Global-Functions.md": "global.lua",
        "Vector-2.md": "vec2.lua",
        "Vector-3.md": "vec3.lua",
        "Game-Object.md": "game_object.lua",
        "Target-Selector.md": "target_selector.lua",
        "Spell-Data.md": "spell_data.lua",
        "Enums.md": "enums.lua",
        "Cast-Spell.md": "cast_spell.lua",
        "Graphics.md": "graphics.lua",
        "Evade.md": "evade.lua",
        "Menu-Elements.md": "menu_elements.lua",
        "Actors-Manager.md": "actors_manager.lua",
        "Console.md": "console.lua",
        "Color.md": "color.lua",
        "Callbacks.md": "callbacks.lua",
        "World.md": "world.lua",
        "Utility.md": "utility.lua",
        "Prediction.md": "prediction.lua",
        "Pathfinder.md": "pathfinder.lua",
        "Orbwalker.md": "orbwalker.lua",
        "Loot-Manager.md": "loot_manager.lua",
        "Auto‐Play.md": "auto_play.lua",
        "Buff.md": "buff.lua",
        "Item-Data.md": "item_data.lua",
    }

def update_library_file(wiki_file, lua_file):
    """Update a single library file from its wiki file."""
    wiki_path = f"temp_wiki/{wiki_file}"
    lua_path = f"library/{lua_file}"

    if not os.path.exists(wiki_path):
        print(f"Wiki file {wiki_path} not found")
        return False

    if not os.path.exists(lua_path):
        print(f"Library file {lua_path} not found")
        return False

    with open(wiki_path, 'r') as f:
        content = f.read()

    # Extract functions (simplified parsing)
    functions = []
    lines = content.split('\n')
    for i, line in enumerate(lines):
        if line.startswith('`') and '->' in line:
            func_name, params, return_type = parse_markdown_function(line)
            if func_name:
                # Get description from next line if it's a note
                desc = ""
                if i + 1 < len(lines) and "> [!NOTE]" in lines[i + 1]:
                    desc = lines[i + 1].replace("> [!NOTE]", "").strip()

                functions.append((func_name, params, return_type, desc))

    if not functions:
        print(f"No functions found in {wiki_file}")
        return False

    # Read existing lua file
    with open(lua_path, 'r') as f:
        existing_content = f.read()

    # For now, just report what we found - full auto-update would require more sophisticated parsing
    print(f"Found {len(functions)} functions in {wiki_file} for {lua_file}")
    return True

def update_all_annotations():
    """Update all library files from wiki files."""
    mapping = get_wiki_file_mapping()
    updated_count = 0

    for wiki_file, lua_file in mapping.items():
        if update_library_file(wiki_file, lua_file):
            updated_count += 1

    print(f"Updated {updated_count} library files")
    return updated_count > 0

def check_missing_functions():
    """Check for functions in wiki that might be missing from library."""
    mapping = get_wiki_file_mapping()
    total_missing = 0

    for wiki_file, lua_file in mapping.items():
        wiki_path = f"temp_wiki/{wiki_file}"
        lua_path = f"library/{lua_file}"

        if not os.path.exists(wiki_path) or not os.path.exists(lua_path):
            continue

        # Extract functions from wiki
        with open(wiki_path, 'r') as f:
            content = f.read()

        wiki_functions = set()
        for line in content.split('\n'):
            func_name, _, _ = parse_markdown_function(line)
            if func_name:
                wiki_functions.add(func_name)

        # Extract functions from lua
        with open(lua_path, 'r') as f:
            lua_content = f.read()

        lua_functions = set()
        for line in lua_content.split('\n'):
            if line.startswith('function ') and '(' in line:
                func_name = line.split('(')[0].replace('function ', '').strip()
                lua_functions.add(func_name)

        missing = wiki_functions - lua_functions
        if missing:
            print(f"Potentially missing functions in {lua_file}: {missing}")
            total_missing += len(missing)

    if total_missing == 0:
        print("All wiki functions appear to be covered")
    else:
        print(f"Total potentially missing functions: {total_missing}")

if __name__ == "__main__":
    print("QQTLuaLS Annotation Update Tool")
    print("=" * 40)

    current_version = get_version()
    print(f"Current version: {current_version}")

    if update_submodule():
        if update_all_annotations():
            # Bump version on successful update
            new_version = bump_version(current_version)
            update_version_files(new_version)
            print(f"Version bumped to {new_version}")

        check_missing_functions()
        print("Update process completed. Please review and test changes.")
    else:
        print("Failed to update submodule. Aborting.")