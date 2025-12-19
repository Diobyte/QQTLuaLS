# Auto-update script for QQTLuaLS annotations
# This script helps synchronize annotations with wiki changes
# Run with: python update_annotations.py

import os
import re
import json
import argparse
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
    'any': 'any',
    'object': 'game_object',
    'position': 'vec3',
    'location': 'vec3',
    'byte': 'number',
    'key': 'number',
    'keycode': 'number',
    'quest': 'table',
    'quest_id': 'number',
    'item_id': 'number',
    'gameobjects': 'game_object[]',
    'userdata': 'userdata',
    'int64': 'number',
}

def map_wiki_type_to_lua(wiki_type):
    """Map wiki type to Lua type with support for arrays and unions."""
    if not wiki_type:
        return 'any'
    
    wiki_type = wiki_type.strip().lower()

    # Handle table of [Type] patterns
    table_bracket_match = re.match(r'table of \[([^\]]+)\]', wiki_type)
    if table_bracket_match:
        base_type = table_bracket_match.group(1).strip()
        lua_base = TYPE_MAP.get(base_type, base_type)
        return f"{lua_base}[]"
    
    # Handle array types (Table of X)
    if 'table of' in wiki_type:
        base_type = wiki_type.replace('table of', '').strip()
        lua_base = TYPE_MAP.get(base_type, base_type)
        return f"{lua_base}[]"
    
    # Handle union types (X or Y)
    if ' or ' in wiki_type:
        parts = [part.strip() for part in wiki_type.split(' or ')]
        lua_parts = []
        for part in parts:
            lua_part = TYPE_MAP.get(part, part)
            lua_parts.append(lua_part)
        return '|'.join(lua_parts)
    
    # Handle optional types (X?)
    if wiki_type.endswith('?'):
        base_type = wiki_type[:-1].strip()
        lua_base = TYPE_MAP.get(base_type, base_type)
        return f"{lua_base}|nil"
    
    # Direct mapping
    return TYPE_MAP.get(wiki_type, wiki_type)

def run_command(cmd):
    """Run a shell command and return output."""
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    return result.returncode == 0, result.stdout, result.stderr

def update_submodule():
    """Update the temp_wiki submodule."""
    ok, out, err = run_command("git submodule update --init --remote temp_wiki")
    if not ok:
        print("Failed to update submodule temp_wiki")
        if err:
            print(err)
    return ok

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
            func_name, params_str, return_type = match.groups()
            # Parse params into list
            if params_str.strip():
                params = [p.strip() for p in params_str.split(',')]
            else:
                params = []
            return func_name, params, return_type
    return None, None, None


def extract_item_data_sections(content):
    """Extract only the Item Data section from Game-Object.md when a dedicated Item-Data.md is absent."""
    sections = []
    markers = ["## Item Data Structure", "## Item Data and Affixes Documentation", "## Item Data"]
    start_idx = -1
    for marker in markers:
        start_idx = content.find(marker)
        if start_idx != -1:
            break
    if start_idx == -1:
        return content

    end_idx = content.find("\n## ", start_idx + 4)
    if end_idx == -1:
        end_idx = len(content)

    sections.append(content[start_idx:end_idx])
    return "\n".join(sections)


def trim_game_object_section(content):
    """Drop embedded item_data/affix sections when processing Game-Object.md for game_object annotations."""
    markers = [content.find("### Buff"), content.find("## Item Data")]
    markers = [m for m in markers if m != -1]
    if not markers:
        return content
    stop_idx = min(markers)
    return content[:stop_idx]

def generate_lua_annotation(func_name, params, return_type, description=""):
    """Generate Lua Emmy annotation."""
    # params is now a list of param names
    params_str = ', '.join(params) if params else ''
    
    lua_return = map_wiki_type_to_lua(return_type)

    annotation = ""
    # Add @param for each parameter with better type inference
    for param in params:
        param_type = infer_param_type(param, func_name)
        annotation += f"---@param {param} {param_type}\n"
    
    annotation += f"---@return {lua_return}\n"
    if description:
        annotation += f"---@description {description}\n"
    
    # Generate proper example
    if '.' in func_name:
        class_name = func_name.split('.')[0]
        method_name = func_name.split('.')[1]
        if params:
            param_vars = []
            for i, param in enumerate(params):
                param_vars.append(f"param{i+1}")
            param_str = ', '.join(param_vars)
            annotation += f"---@example local result = {class_name}.{method_name}({param_str})\n"
        else:
            annotation += f"---@example local result = {class_name}.{method_name}()\n"
    else:
        if params:
            param_vars = []
            for i, param in enumerate(params):
                param_vars.append(f"param{i+1}")
            param_str = ', '.join(param_vars)
            annotation += f"---@example local result = {func_name}({param_str})\n"
        else:
            annotation += f"---@example local result = {func_name}()\n"
    
    annotation += f"---@since 1.0.0\n"
    annotation += f"function {func_name}({params_str})\nend\n"

    return annotation

def infer_param_type(param_name, func_name):
    """Infer parameter type based on name and context."""
    param_lower = param_name.lower()
    
    # Common type mappings
    if 'id' in param_lower and ('item' in param_lower or 'object' in param_lower):
        return 'number'
    elif 'id' in param_lower:
        return 'number'
    elif 'name' in param_lower:
        return 'string'
    elif 'pos' in param_lower or 'position' in param_lower or 'location' in param_lower:
        return 'vec3'
    elif 'count' in param_lower or 'index' in param_lower or 'amount' in param_lower:
        return 'number'
    elif 'obj' in param_lower or 'object' in param_lower or 'target' in param_lower:
        return 'game_object'
    elif 'enabled' in param_lower or 'active' in param_lower or 'visible' in param_lower:
        return 'boolean'
    elif 'color' in param_lower:
        return 'color'
    elif 'spell' in param_lower:
        return 'spell_data'
    elif 'exclude' in param_lower:
        return 'boolean'
    elif 'range' in param_lower or 'radius' in param_lower or 'distance' in param_lower:
        return 'number'
    else:
        # Default to any for unknown parameters
        return 'any'

def generate_updated_lua(existing_content, functions, lua_file):
    """Generate updated Lua content with new annotations."""
    class_name = lua_file.split('.')[0] if '.' in lua_file else lua_file
    
    lines = existing_content.split('\n')
    new_lines = []
    i = 0
    
    while i < len(lines):
        line = lines[i]
        
        # Check if this is a function definition
        if line.startswith('function ') and '(' in line:
            func_name_match = re.search(r'function\s+([^\(\s]+)', line)
            if func_name_match:
                current_func_name = func_name_match.group(1)
                
                # Find the corresponding function from wiki
                wiki_func = None
                for func_name, params, return_type, desc in functions:
                    # Match by method name only (after last dot or colon)
                    current_method = current_func_name.split('.')[-1] if '.' in current_func_name else current_func_name
                    wiki_method = func_name
                    if wiki_method == current_method:
                        wiki_func = (func_name, params, return_type, desc)
                        break
                
                if wiki_func:
                    func_name, params, return_type, desc = wiki_func
                    
                    # Look backwards for existing annotations
                    annotations_start = i
                    j = i - 1
                    existing_annotations = []
                    while j >= 0 and (lines[j].startswith('---@') or lines[j].strip() == ''):
                        if lines[j].startswith('---@'):
                            existing_annotations.insert(0, lines[j])
                        j -= 1
                    annotations_start = j + 1
                    
                    # Generate complete annotation block
                    annotation_lines = generate_lua_annotation(current_func_name, params, return_type, desc).split('\n')
                    
                    # Replace existing annotations with complete ones
                    new_lines = new_lines[:annotations_start] + annotation_lines + [line]
                    
                    # Skip the original function line and any existing annotations we already processed
                    while i < len(lines) and not (lines[i].startswith('function ') and '(' in lines[i]):
                        i += 1
                    i += 1  # Skip the function line we just processed
                    continue
        
        new_lines.append(line)
        i += 1
    
    # Add any new functions that don't exist yet
    for func_name, params, return_type, desc in functions:
        full_func_name = f"{class_name}:{func_name}" if class_name != "global" else func_name
        func_pattern = f"function {full_func_name}("
        if not any(func_pattern in line for line in new_lines):
            # Add the function
            annotation = generate_lua_annotation(full_func_name, params, return_type, desc)
            new_lines.append("")
            new_lines.extend(annotation.split('\n'))
    
    return '\n'.join(new_lines)

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
        # Item data currently lives inside Game-Object.md; keep a mapping entry for automation.
        "Item-Data.md": "item_data.lua",
    }

def update_library_file(wiki_file, lua_file, dry_run=False):
    """Update a single library file from its wiki file.

    When dry_run is True, report intended changes without writing files.
    """
    wiki_path = f"temp_wiki/{wiki_file}"
    use_item_section = False
    if not os.path.exists(wiki_path) and wiki_file == "Item-Data.md":
        fallback_path = "temp_wiki/Game-Object.md"
        if os.path.exists(fallback_path):
            wiki_path = fallback_path
            use_item_section = True
    lua_path = f"library/{lua_file}"

    if not os.path.exists(wiki_path):
        print(f"Wiki file {wiki_path} not found")
        return False

    if not os.path.exists(lua_path):
        print(f"Library file {lua_path} not found")
        return False

    with open(wiki_path, 'r', encoding='utf-8') as f:
        content = f.read()

    if use_item_section:
        content = extract_item_data_sections(content)
    elif wiki_file == "Game-Object.md":
        content = trim_game_object_section(content)

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
                while j < len(lines) and not (lines[j].startswith('`') and '()' in lines[j]) and j < i + 20:  # Safety limit
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
        i += 1

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
        if dry_run:
            print(f"DRY RUN: {lua_file} would be updated ({len(functions)} functions)")
            return True
        with open(lua_path, 'w', encoding='utf-8') as f:
            f.write(updated_content)
        print(f"Updated {lua_file} with {len(functions)} functions")
        return True
    else:
        print(f"No changes needed for {lua_file}")
        return True

def update_all_annotations(dry_run=False):
    """Update all library files from wiki files."""
    try:
        mapping = get_wiki_file_mapping()
        updated_count = 0
        missing_wiki = []

        for wiki_file, lua_file in mapping.items():
            wiki_path = f"temp_wiki/{wiki_file}"
            if not os.path.exists(wiki_path) and wiki_file != "Item-Data.md":
                print(f"SKIP: Missing wiki source {wiki_path}")
                missing_wiki.append(wiki_file)
                continue
            if update_library_file(wiki_file, lua_file, dry_run=dry_run):
                updated_count += 1

        print(f"Updated {updated_count} library files")
        if missing_wiki:
            print("Missing wiki pages (not updated): " + ", ".join(missing_wiki))
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

        if wiki_file == "Item-Data.md" and not os.path.exists(wiki_path):
            wiki_path = "temp_wiki/Game-Object.md" if os.path.exists("temp_wiki/Game-Object.md") else wiki_path

        if not os.path.exists(wiki_path) or not os.path.exists(lua_path):
            continue

        # Extract functions from wiki
        with open(wiki_path, 'r', encoding='utf-8') as f:
            content = f.read()

        if wiki_file == "Item-Data.md" and "Game-Object.md" in wiki_path:
            content = extract_item_data_sections(content)
        elif wiki_file == "Game-Object.md":
            content = trim_game_object_section(content)

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

def parse_args():
    parser = argparse.ArgumentParser(description="Update Lua annotations from wiki pages.")
    parser.add_argument("--dry-run", action="store_true", help="Compute updates without writing files or bumping version.")
    parser.add_argument("--skip-submodule", action="store_true", help="Do not update the temp_wiki submodule.")
    parser.add_argument("--skip-version-bump", action="store_true", help="Do not bump version after updates.")
    return parser.parse_args()


def main():
    print("QQTLuaLS Annotation Update Tool")
    print("=" * 40)

    args = parse_args()
    current_version = get_version()
    print(f"Current version: {current_version}")

    submodule_ok = True
    if args.skip_submodule:
        print("Skipping submodule update (--skip-submodule)")
    else:
        submodule_ok = update_submodule()

    if not submodule_ok:
        print("Submodule update failed; continuing with existing wiki content.")

    updated = update_all_annotations(dry_run=args.dry_run)

    if updated and not args.dry_run and not args.skip_version_bump:
        new_version = bump_version(current_version)
        update_version_files(new_version)
        print(f"Version bumped to {new_version}")
    elif args.dry_run:
        print("Dry run completed; no files were written and version was not bumped.")
    elif args.skip_version_bump:
        print("Updates applied; version bump skipped by flag.")
    else:
        print("No annotation updates detected; version unchanged.")

    check_missing_functions()
    print("Update process completed. Please review and test changes.")


if __name__ == "__main__":
    main()