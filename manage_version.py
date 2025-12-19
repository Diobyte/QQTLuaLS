# Version management script for QQTLuaLS
# This script centralizes version management across all files
# Run with: python manage_version.py [new_version]

import json
import os
import re
import sys

def get_current_version():
    """Get current version from config.json."""
    try:
        with open('config.json', 'r') as f:
            config = json.load(f)
            return config.get('version', '1.0.0')
    except:
        return '1.0.0'

def update_config_version(new_version):
    """Update version in config.json."""
    try:
        with open('config.json', 'r') as f:
            config = json.load(f)
        config['version'] = new_version
        with open('config.json', 'w') as f:
            json.dump(config, f, indent=2)
        print(f"Updated config.json to version {new_version}")
        return True
    except Exception as e:
        print(f"Error updating config.json: {e}")
        return False

def update_plugin_version(new_version):
    """Update version in plugin.json."""
    try:
        with open('plugin.json', 'r') as f:
            plugin = json.load(f)
        plugin['version'] = new_version
        with open('plugin.json', 'w') as f:
            json.dump(plugin, f, indent=2)
        print(f"Updated plugin.json to version {new_version}")
        return True
    except Exception as e:
        print(f"Error updating plugin.json: {e}")
        return False

def update_readme_version(new_version):
    """Update version in README.md."""
    try:
        with open('README.md', 'r', encoding='utf-8') as f:
            content = f.read()

        # Update the version line (accepts numeric or placeholder tokens such as --current)
        pattern = r'(\*\*Version )(?:[\w\.\-]+)(\** - Enhanced.*)'
        replacement = r'\g<1>' + new_version + r'\g<2>'
        new_content, count = re.subn(pattern, replacement, content)

        # If no replacement happened, append a note for visibility
        if count == 0:
            print("Warning: README version header not updated; pattern not found.")
            new_content = content

        with open('README.md', 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"Updated README.md to version {new_version}")
        return True
    except Exception as e:
        print(f"Error updating README.md: {e}")
        return False

def bump_version(version, bump_type='patch'):
    """Bump version number."""
    major, minor, patch = map(int, version.split('.'))

    if bump_type == 'major':
        major += 1
        minor = 0
        patch = 0
    elif bump_type == 'minor':
        minor += 1
        patch = 0
    else:  # patch
        patch += 1

    return f"{major}.{minor}.{patch}"

def main():
    if len(sys.argv) < 2:
        print("Usage: python manage_version.py <new_version> | bump [major|minor|patch]")
        print(f"Current version: {get_current_version()}")
        return

    current_version = get_current_version()

    if sys.argv[1] == 'bump':
        bump_type = sys.argv[2] if len(sys.argv) > 2 else 'patch'
        new_version = bump_version(current_version, bump_type)
        print(f"Bumping {bump_type} version: {current_version} -> {new_version}")
    else:
        new_version = sys.argv[1]

    # Update all files
    success = True
    success &= update_config_version(new_version)
    success &= update_plugin_version(new_version)
    success &= update_readme_version(new_version)

    if success:
        print(f"Successfully updated all version references to {new_version}")
    else:
        print("Some updates failed. Please check the errors above.")

if __name__ == "__main__":
    main()