# Auto-update script for QQTLuaLS annotations
# This script helps synchronize annotations with wiki changes
# Run with: python update_annotations.py

import os
import re
import json
import subprocess
from pathlib import Path

# Type mapping for wiki to Lua types
TYPE_MAP = {
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
    'color': 'color',
    'spell_data': 'spell_data',
    'item_data': 'item_data',
    'buff': 'buff',
    'characterclass': 'CharacterClass',
    'button_click': 'button_click',
    'spell_geometry': 'spell_geometry',
    'targeting_type': 'targeting_type',
    'orb_mode': 'orb_mode',
    'item_rarity': 'item_rarity',
}

def run_command(cmd):
    """Run a shell command and return output."""
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    return result.returncode == 0, result.stdout, result.stderr

def update_submodule():
    """Update the temp_wiki submodule."""
    print("Skipping submodule update for testing...")
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

# Type mapping for wiki to Lua types
TYPE_MAP = {
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
    'color': 'color',
    'spell_data': 'spell_data',
    'item_data': 'item_data',
    'buff': 'buff',
    'characterclass': 'CharacterClass',
    'button_click': 'button_click',
    'spell_geometry': 'spell_geometry',
    'targeting_type': 'targeting_type',
    'orb_mode': 'orb_mode',
    'item_rarity': 'item_rarity',
}

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
            func_name, params_str, return_type = match.groups()
            # Parse params into list
            if params_str.strip():
                params = [p.strip() for p in params_str.split(',')]
            else:
                params = []
            return func_name, params, return_type
    return None, None, None

def generate_lua_annotation(func_name, params, return_type, description=""):
    """Generate Lua Emmy annotation."""
    # params is now a list of param names
    params_str = ', '.join(params) if params else ''
    
    lua_return = TYPE_MAP.get(return_type, return_type)

    annotation = ""
    # Add @param for each parameter
    for param in params:
        # Try to infer type from param name or use any
        param_type = 'any'  # Default
        if 'id' in param.lower():
            param_type = 'number'
        elif 'name' in param.lower():
            param_type = 'string'
        elif 'pos' in param.lower() or 'position' in param.lower():
            param_type = 'vec3'
        elif 'count' in param.lower() or 'index' in param.lower():
            param_type = 'number'
        annotation += f"---@param {param} {param_type}\n"
    
    annotation += f"---@return {lua_return}\n"
    if description:
        annotation += f"---@description {description}\n"
    annotation += f"---@example local result = {func_name}({params_str})\n"
    annotation += f"---@since 1.0.0\n"
    annotation += f"function {func_name}({params_str})\nend\n"

    return annotation

def generate_updated_lua(existing_content, functions, lua_file):
    """Generate updated Lua content with new annotations."""
    class_name = lua_file.split('.')[0] if '.' in lua_file else lua_file
    
    for func_name, params, return_type, desc in functions:
        full_func_name = f"{class_name}:{func_name}" if class_name != "global" else func_name
        if f"function {full_func_name}(" not in existing_content:
            # Add the function
            annotation = generate_lua_annotation(full_func_name, params, return_type, desc)
            existing_content += "\n" + annotation
    
    return existing_content

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

    with open(wiki_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Extract functions (simplified parsing)
    functions = []
    lines = content.split('\n')
    i = 0
    while i < len(lines):
        line = lines[i]
        if line.startswith('`') and '->' in line:
            # Format: `func()` -> type
            func_name, params, return_type = parse_markdown_function(line)
            if func_name:
                # Get description from next line if it's a note
                desc = ""
                if i + 1 < len(lines) and "> [!NOTE]" in lines[i + 1]:
                    desc = lines[i + 1].replace("> [!NOTE]", "").strip()
                functions.append((func_name, params, return_type, desc))
        elif line.startswith('`') and '()' in line and '->' not in line:
            # Format for functions without -> : `func()` then > [!NOTE] desc then - Returns: type
            func_match = re.match(r'`([^\(\s]+)\(([^)]*)\)`', line)
            if func_match:
                func_name, params = func_match.groups()
                # Parse params into list
                params = [p.strip() for p in params.split(',')] if params.strip() else []
                desc = ""
                return_type = "any"
                # Look for description and return type in next lines
                j = i + 1
                while j < len(lines) and not (lines[j].startswith('`') and '()' in lines[j]):
                    if "> [!NOTE]" in lines[j]:
                        desc = lines[j].replace("> [!NOTE]", "").strip()
                    elif lines[j].strip().startswith("- Returns:"):
                        return_part = lines[j].replace("- Returns:", "").strip()
                        # Extract type from "type" or "[`type`](link)" or "Table of type"
                        if "Table of" in return_part:
                            # Extract the type after "Table of"
                            table_type_match = re.search(r'Table of ([^\s]+)', return_part)
                            if table_type_match:
                                base_type = table_type_match.group(1).lower()
                                type_map_lower = {k.lower(): v for k, v in TYPE_MAP.items()}
                                lua_base_type = type_map_lower.get(base_type, base_type)
                                return_type = f"{lua_base_type}[]"
                            else:
                                return_type = "table"
                        else:
                            type_match = re.search(r'`?([^`\s\[]+)`?', return_part)
                            if type_match:
                                return_type = type_match.group(1)
                    j += 1
                functions.append((func_name, params, return_type, desc))
        elif line.strip().startswith('- `') and '->' in line:
            # Format: - `func`: `func()` -> type - description
            match = re.search(r'`(\w+)\(\)`\s*->\s*`?([^`\s]+)`?', line)
            if match:
                func_name, return_type = match.groups()
                desc = line.split('-', 1)[1].strip() if '-' in line else ""
                functions.append((func_name, "", return_type, desc))

    if not functions:
        print(f"No functions found in {wiki_file}")
        return False

    # Read existing lua file
    with open(lua_path, 'r', encoding='utf-8') as f:
        existing_content = f.read()

    # Generate updated content
    updated_content = generate_updated_lua(existing_content, functions, lua_file)
    
    # Write back if changed
    if updated_content != existing_content:
        with open(lua_path, 'w', encoding='utf-8') as f:
            f.write(updated_content)
        print(f"Updated {lua_file} with {len(functions)} functions")
        return True
    else:
        print(f"No changes needed for {lua_file}")
        return True

def update_all_annotations():
    """Update all library files from wiki files."""
    try:
        mapping = get_wiki_file_mapping()
        updated_count = 0

        for wiki_file, lua_file in mapping.items():
            if update_library_file(wiki_file, lua_file):
                updated_count += 1

        print(f"Updated {updated_count} library files")
        return updated_count > 0
    except Exception as e:
        print(f"Error in update_all_annotations: {e}")
        return False

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
        with open(lua_path, 'r', encoding='utf-8') as f:
            lua_content = f.read()

        lua_functions = set()
        for line in lua_content.split('\n'):
            if line.startswith('function ') and '(' in line:
                func_name = line.split('(')[0].replace('function ', '').strip()
                lua_functions.add(func_name)
                # Also add just the method name for class methods
                if ':' in func_name:
                    lua_functions.add(func_name.split(':')[1])

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
        print("Failed to update submodule. Running update anyway for testing...")
        if update_all_annotations():
            # Bump version on successful update
            new_version = bump_version(current_version)
            update_version_files(new_version)
            print(f"Version bumped to {new_version}")

        check_missing_functions()
        print("Update process completed. Please review and test changes.")