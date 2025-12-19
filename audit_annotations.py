# Annotation Consistency Audit Script
# This script checks and fixes annotation consistency across library files
# Run with: python audit_annotations.py

import os
import re
from pathlib import Path

def check_function_annotations(file_path):
    """Check annotations for a single function."""
    issues = []

    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Find all function definitions
    functions = []
    lines = content.split('\n')
    i = 0
    while i < len(lines):
        line = lines[i]
        if line.startswith('function ') and line.endswith(' end'):
            # Found a function, look backwards for annotations
            func_start = i
            annotations = []
            j = i - 1
            while j >= 0 and (lines[j].startswith('---@') or lines[j].strip() == ''):
                if lines[j].startswith('---@'):
                    annotations.insert(0, lines[j])
                j -= 1

            func_name = line.replace('function ', '').replace(' end', '').strip()
            functions.append((func_name, annotations, func_start))

        i += 1

    # Check each function for required annotations
    for func_name, annotations, line_num in functions:
        has_return = any('@return' in ann for ann in annotations)
        has_description = any('@description' in ann for ann in annotations)
        has_example = any('@example' in ann for ann in annotations)
        has_since = any('@since' in ann for ann in annotations)

        if not has_return:
            issues.append(f"Line {line_num + 1}: {func_name} missing @return")
        if not has_description:
            issues.append(f"Line {line_num + 1}: {func_name} missing @description")
        if not has_example:
            issues.append(f"Line {line_num + 1}: {func_name} missing @example")
        if not has_since:
            issues.append(f"Line {line_num + 1}: {func_name} missing @since")

    return issues

def audit_all_files():
    """Audit all library files."""
    library_dir = Path('library')
    total_issues = 0

    for lua_file in library_dir.glob('*.lua'):
        if lua_file.name == 'vec2_temp.lua':  # Skip temp file
            continue

        print(f"\nAuditing {lua_file.name}...")
        issues = check_function_annotations(lua_file)
        if issues:
            print(f"Found {len(issues)} issues:")
            for issue in issues:
                print(f"  {issue}")
            total_issues += len(issues)
        else:
            print("No issues found.")

    print(f"\nTotal issues across all files: {total_issues}")
    return total_issues == 0

def fix_missing_annotations(file_path):
    """Attempt to fix missing annotations with basic defaults."""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    lines = content.split('\n')
    new_lines = []
    i = 0

    while i < len(lines):
        line = lines[i]
        new_lines.append(line)

        # If this is a function definition
        if line.startswith('function ') and line.endswith(' end'):
            func_name = line.replace('function ', '').replace(' end', '').strip()

            # Look for existing annotations
            j = len(new_lines) - 2  # Check the line before
            has_return = False
            has_description = False
            has_example = False
            has_since = False

            while j >= 0 and (lines[j].startswith('---@') if j < len(lines) else False):
                ann_line = lines[j]
                if '@return' in ann_line:
                    has_return = True
                elif '@description' in ann_line:
                    has_description = True
                elif '@example' in ann_line:
                    has_example = True
                elif '@since' in ann_line:
                    has_since = True
                j -= 1

            # Add missing annotations
            insert_lines = []
            if not has_since:
                insert_lines.append(f"---@since 1.0.0")
            if not has_example:
                # Generate a basic example
                if ':' in func_name:
                    # Method call
                    obj_name = func_name.split(':')[0]
                    insert_lines.append(f"---@example local result = {obj_name}:{func_name.split(':')[1]}")
                else:
                    # Global function
                    insert_lines.append(f"---@example local result = {func_name}()")
            if not has_description:
                insert_lines.append(f"---@description TODO: Add description for {func_name}")
            if not has_return:
                insert_lines.append(f"---@return any")

            # Insert in reverse order (since we're inserting before the function)
            for insert_line in reversed(insert_lines):
                new_lines.insert(-1, insert_line)  # Insert before the function line

        i += 1

    # Write back
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write('\n'.join(new_lines))

if __name__ == "__main__":
    print("QQTLuaLS Annotation Consistency Audit")
    print("=" * 50)

    if audit_all_files():
        print("\nAll files pass consistency check!")
    else:
        print("\nRunning auto-fix for missing annotations...")
        library_dir = Path('library')

        for lua_file in library_dir.glob('*.lua'):
            if lua_file.name == 'vec2_temp.lua':
                continue
            print(f"Fixing {lua_file.name}...")
            fix_missing_annotations(lua_file)

        print("\nRe-auditing after fixes...")
        audit_all_files()