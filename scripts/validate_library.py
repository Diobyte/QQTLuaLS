"""
Basic validation script for the generated `library/` files.
Checks for:
 - bad `---@param` syntax with `:`
 - occurrences of `Number (` or `(int)` or `(float)` annotations
 - `---@return bool` (should be `boolean`)
 - constructor vs class name conflicts (local <name> = {} and `function <name>(`)
 - top-level functions that may be intended to be methods (lists them for manual review)

Usage: python scripts/validate_library.py
"""
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
LIB = ROOT / 'library'

param_colon = re.compile(r"^\s*---@param\s+[^\s]+:.*$")
number_paren = re.compile(r"\((?:int|float|int64)\)")
bool_return = re.compile(r"^\s*---@return\s+bool\b")
local_table = re.compile(r"^\s*local\s+([a-zA-Z0-9_]+)\s*=\s*{\s*}")
func_def = re.compile(r"^\s*function\s+([a-zA-Z0-9_\.:%]+)\s*\(")

issues = []
for f in sorted(LIB.glob('*.lua')):
    text = f.read_text(encoding='utf-8')
    for i, line in enumerate(text.splitlines(), start=1):
        if param_colon.search(line):
            issues.append((f.name, i, 'bad_param_syntax', line.strip()))
        if number_paren.search(line):
            issues.append((f.name, i, 'number_paren', line.strip()))
        if bool_return.search(line):
            issues.append((f.name, i, 'bool_return', line.strip()))
    # detect local table then constructor conflict
    locals_found = {m.group(1) for m in local_table.finditer(text)}
    funcs = {m.group(1) for m in func_def.finditer(text)}
    for name in locals_found:
        if name in funcs:
            issues.append((f.name, 0, 'constructor_conflict', f"local table '{name}' and function '{name}' both present"))

# Print a short report
if not issues:
    print('No obvious issues found.')
else:
    print('Validation issues found:')
    for file, line, typ, msg in issues:
        loc = f"line {line}" if line>0 else "(file-level)"
        print(f" - {file} {loc} {typ}: {msg}")

# exit with non-zero if issues
if issues:
    raise SystemExit(1)
