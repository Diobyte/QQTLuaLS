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
        if line.startswith('function ') and '(' in line:
            # Found a function definition, look for the corresponding end
            func_start = i
            func_name = line.replace('function ', '').strip()
            
            # Look for the end of this function
            j = i + 1
            brace_count = 0
            while j < len(lines):
                if 'function ' in lines[j] and '(' in lines[j]:
                    brace_count += 1
                elif lines[j].strip() == 'end':
                    if brace_count == 0:
                        # This end matches our function
                        func_end = j
                        break
                    else:
                        brace_count -= 1
                j += 1
            
            # Look backwards from function start for annotations
            annotations = []
            k = func_start - 1
            while k >= 0 and (lines[k].startswith('---@') or lines[k].strip() == ''):
                if lines[k].startswith('---@'):
                    annotations.insert(0, lines[k])
                k -= 1
            
            functions.append((func_name, annotations, func_start))
            i = j  # Skip to after this function
        i += 1

    # Check each function for required annotations
    for func_name, annotations, line_num in functions:
        has_return = any('@return' in ann for ann in annotations)
        has_description = any('@description' in ann for ann in annotations)
        has_example = any('@example' in ann for ann in annotations)
        has_since = any('@since' in ann for ann in annotations)
        has_todo = any('TODO' in ann for ann in annotations)

        if not has_return:
            issues.append(f"Line {line_num + 1}: {func_name} missing @return")
        if not has_description:
            issues.append(f"Line {line_num + 1}: {func_name} missing @description")
        if not has_example:
            issues.append(f"Line {line_num + 1}: {func_name} missing @example")
        if not has_since:
            issues.append(f"Line {line_num + 1}: {func_name} missing @since")
        if has_todo:
            issues.append(f"Line {line_num + 1}: {func_name} annotation contains TODO placeholder")

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

        # If this is a function definition
        if line.startswith('function ') and '(' in line:
            func_name = line.replace('function ', '').strip()
            
            # Find the end of this function
            func_end = i + 1
            while func_end < len(lines) and not (lines[func_end].strip() == 'end'):
                func_end += 1
            
            if func_end >= len(lines):
                # Function doesn't have a proper end, skip it
                new_lines.append(line)
                i += 1
                continue
            
            # Look backwards for existing annotations
            annotations_start = i
            j = i - 1
            existing_annotations = []
            while j >= 0 and (lines[j].startswith('---@') or lines[j].strip() == ''):
                if lines[j].startswith('---@'):
                    existing_annotations.insert(0, lines[j])
                j -= 1
            annotations_start = j + 1

            # Check what annotations exist
            has_return = any('@return' in ann for ann in existing_annotations)
            has_description = any('@description' in ann for ann in existing_annotations)
            has_example = any('@example' in ann for ann in existing_annotations)
            has_since = any('@since' in ann for ann in existing_annotations)

            # Add missing annotations before the function
            insert_lines = []
            if not has_since:
                insert_lines.append(f"---@since 1.0.0")
            if not has_example:
                # Generate a proper example based on function signature
                if '.' in func_name:
                    # Method call
                    class_name = func_name.split('.')[0]
                    method_name = func_name.split('.')[1]
                    if '(' in method_name:
                        # Extract parameters from function name
                        param_part = method_name.split('(')[1].split(')')[0]
                        method_name = method_name.split('(')[0]
                        if param_part.strip():
                            params = [p.strip() for p in param_part.split(',')]
                            param_str = ', '.join([f"param{i+1}" for i in range(len(params))])
                            insert_lines.append(f"---@example local result = {class_name}.{method_name}({param_str})")
                        else:
                            insert_lines.append(f"---@example local result = {class_name}.{method_name}()")
                    else:
                        insert_lines.append(f"---@example local result = {class_name}.{method_name}()")
                else:
                    # Global function
                    if '(' in func_name:
                        # Extract parameters from function name
                        param_part = func_name.split('(')[1].split(')')[0]
                        func_base = func_name.split('(')[0]
                        if param_part.strip():
                            params = [p.strip() for p in param_part.split(',')]
                            param_str = ', '.join([f"param{i+1}" for i in range(len(params))])
                            insert_lines.append(f"---@example local result = {func_base}({param_str})")
                        else:
                            insert_lines.append(f"---@example local result = {func_base}()")
                    else:
                        insert_lines.append(f"---@example local result = {func_name}()")
            if not has_description:
                insert_lines.append(f"---@description TODO: Add description for {func_name}")
            if not has_return:
                insert_lines.append(f"---@return any")

            # Insert the annotations before the function
            for insert_line in reversed(insert_lines):
                new_lines.insert(annotations_start, insert_line)

            # Add the function line and everything until end
            for k in range(i, func_end + 1):
                new_lines.append(lines[k])
            i = func_end + 1
            continue
        else:
            new_lines.append(line)

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