"""
Generator: convert markdown docs from qqt_diablo.wiki into Lua annotation stubs
Produces: library/*.lua files with `---@meta` and function/class stubs for LuaLS

Usage: python scripts/generate_library.py
"""
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
WIKI = ROOT / 'temp_wiki'
LIB = ROOT / 'library'
LIB.mkdir(exist_ok=True)

# patterns
fn_pattern = re.compile(r"`([a-zA-Z0-9_:.]+)\(([^`]*)\)`")
param_line = re.compile(r"-\s*`([a-zA-Z0-9_]+)`:.*")
returns_line_arrow = re.compile(r"->\s*`([^`]+)`")
returns_line_bullet = re.compile(r"-\s*Returns:\s*`([^`]+)`")


def sanitize_module_name(md_name):
    s = md_name.lower().replace(' ', '_').replace('-', '_')
    s = s.replace('.md', '')
    # map some names to preferred file names
    s = s.replace('global_functions', 'global')
    s = s.replace('game_object', 'game_object')
    s = s.replace('vector_3', 'vec3')
    s = s.replace('vector_2', 'vec2')
    return s + '.lua'


def write_stub(module_file, entities):
    lines = ["---@meta", ""]
    for ent in entities:
        if ent['type'] == 'class':
            lines.append(f"---@class {ent['name']}")
            for field in ent.get('fields', []):
                lines.append(f"---@field {field['name']} {field['type']}")
            lines.append(f"local {ent['name']} = {{}}")
            lines.append("")
            for fn in ent.get('functions', []):
                for p in fn['params']:
                    lines.append(f"---@param {p} any")
                ret = fn.get('returns', 'any')
                if ret:
                    lines.append(f"---@return {ret}")
                name = fn['name']
                lines.append(f"function {ent['name']}:{name}({', '.join(fn['params'])}) end")
                lines.append("")
        elif ent['type'] == 'global_func':
            for fn in ent['functions']:
                for p in fn['params']:
                    lines.append(f"---@param {p} any")
                ret = fn.get('returns', 'any')
                if ret:
                    lines.append(f"---@return {ret}")
                lines.append(f"function {fn['name']}({', '.join(fn['params'])}) end")
                lines.append("")
        elif ent['type'] == 'table':
            lines.append(f"---@class {ent['name']}")
            lines.append(f"{ent['name']} = {{}}")
            lines.append("")
            for fn in ent.get('functions', []):
                for p in fn['params']:
                    lines.append(f"---@param {p} any")
                ret = fn.get('returns', 'any')
                if ret:
                    lines.append(f"---@return {ret}")
                lines.append(f"function {ent['name']}.{fn['name']}({', '.join(fn['params'])}) end")
                lines.append("")
    module_file.write_text('\n'.join(lines))


for md in WIKI.glob('*.md'):
    text = md.read_text(encoding='utf-8')
    matches = fn_pattern.findall(text)
    entities = {}
    # attempt to find class headings
    # naive: if 'class' in first 200 chars -> class file
    file_name = sanitize_module_name(md.name)
    module_path = LIB / file_name

    if not matches:
        # create empty file with header
        module_path.write_text("---@meta\n\n-- Generated stubs from wiki: {}\n".format(md.name))
        continue

    table_funcs = {}
    global_funcs = []
    class_name = None

    for m in matches:
        sig_name, sig_params = m
        params = [p.strip() for p in sig_params.split(',') if p.strip()]
        # try to find return type near the match
        # get the section substring
        idx = text.find('`' + sig_name + '(' + sig_params + ')`')
        snippet = text[idx: idx + 200]
        ret = None
        a = returns_line_arrow.search(snippet)
        b = returns_line_bullet.search(text[max(0, idx-200): idx+200])
        if a:
            ret = a.group(1)
        elif b:
            ret = b.group(1)
        # detect table.method or table.method: if contains '.' or ':'
        if '.' in sig_name or ':' in sig_name:
            parts = re.split('[.:]', sig_name)
            table = parts[0]
            fname = parts[1]
            table_key = table
            table_funcs.setdefault(table_key, []).append({'name': fname, 'params': params, 'returns': ret})
        else:
            global_funcs.append({'name': sig_name.split('(')[0], 'params': params, 'returns': ret})

    entities_list = []
    if table_funcs:
        for table, funcs in table_funcs.items():
            entities_list.append({'type':'table','name':table,'functions':funcs})
    if global_funcs:
        entities_list.append({'type':'global_func','functions':global_funcs})

    write_stub(module_path, entities_list)

print('Generation complete. Files written to library/ ({} files)'.format(len(list(LIB.iterdir()))))
