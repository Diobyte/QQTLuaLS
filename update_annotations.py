# Auto-update script for QQTLuaLS annotations
# This script helps synchronize annotations with wiki changes
# Run with: python update_annotations.py

import os
import re
import subprocess

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

def parse_markdown_function(line):
    """Parse a function signature from markdown."""
    # Example: `get_player_position()` -> [`vec3`](...)
    match = re.search(r'`(\w+)\(([^)]*)\)`\s*->\s*`?([^`\s]+)`?', line)
    if match:
        func_name, params, return_type = match.groups()
        return func_name, params, return_type
    return None, None, None

def generate_lua_annotation(func_name, params, return_type, description=""):
    """Generate Lua Emmy annotation."""
    # Convert types
    type_map = {
        'vec3': 'vec3',
        'game_object': 'game_object',
        'number': 'number',
        'boolean': 'boolean',
        'string': 'string',
        'table': 'table'
    }
    lua_return = type_map.get(return_type, return_type)

    annotation = f"---@return {lua_return}\n"
    if description:
        annotation += f"---@description {description}\n"
    annotation += f"function {func_name}({params})\nend\n"

    return annotation

def update_global_lua():
    """Update global.lua with new functions from Global-Functions.md."""
    wiki_file = "temp_wiki/Global-Functions.md"
    lua_file = "library/global.lua"

    if not os.path.exists(wiki_file):
        print(f"Wiki file {wiki_file} not found")
        return

    with open(wiki_file, 'r') as f:
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

    # Generate new annotations
    new_content = ""
    for func_name, params, return_type, desc in functions:
        new_content += generate_lua_annotation(func_name, params, return_type, desc) + "\n"

    # This is a simplified example - in practice, you'd need more sophisticated parsing
    # and merging with existing annotations
    print(f"Found {len(functions)} functions to potentially update")
    print("Manual review required for actual updates")

if __name__ == "__main__":
    if update_submodule():
        update_global_lua()
        print("Update process completed. Please review and test changes.")