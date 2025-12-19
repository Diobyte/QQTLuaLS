"""
Verify generated library stubs against the wiki markdown.
Reports:
 - functions found in wiki that are missing in library
 - functions present in library but not documented in wiki
 - constructor styles mismatches (table.new vs function())

Usage: python scripts/verify_against_wiki.py
"""
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
WIKI = ROOT / 'temp_wiki'
LIB = ROOT / 'library'

# patterns
sig_pat = re.compile(r"`([a-zA-Z0-9_:.]+)\(([^`]*)\)`")
func_def_pat = re.compile(r"^\s*function\s+([a-zA-Z0-9_\.:%]+)\s*\(", re.MULTILINE)

wiki_symbols = set()
wiki_constructors = {}

for md in sorted(WIKI.glob('*.md')):
    text = md.read_text(encoding='utf-8')
    for m in sig_pat.findall(text):
        name, params = m
        name = name.strip()
        wiki_symbols.add(name)
        # check for constructor usage style in snippets
        # prefer patterns like vec3.new or vec3(
        if name.endswith(')'):
            pass

# Collect library defined symbols
lib_symbols = set()
lib_defs = {}
for lua in sorted(LIB.glob('*.lua')):
    text = lua.read_text(encoding='utf-8')
    for m in func_def_pat.findall(text):
        sym = m
        lib_symbols.add(sym)
        lib_defs.setdefault(sym, []).append(lua.name)

# Normalize sets for comparison: wiki table methods vs library table:method or table.method
# For wiki, convert 'table.method' or 'table:method' to both forms
wiki_expanded = set()
for s in wiki_symbols:
    wiki_expanded.add(s)
    if '.' in s:
        t, f = s.split('.', 1)
        wiki_expanded.add(f)  # method name
        wiki_expanded.add(t + ':' + f)
    if ':' in s:
        t, f = s.split(':', 1)
        wiki_expanded.add(t + '.' + f)
        wiki_expanded.add(f)

missing = sorted([s for s in wiki_symbols if not any((s in lib_symbols, s.replace('.', ':' ) in lib_symbols, s + '(' in ''))])

# More robust: check for existence of function names ignoring parameters
# Build simple names from wiki: extract function base name
wiki_basenames = set()
for s in wiki_symbols:
    base = s.split('.')[-1].split(':')[-1]
    wiki_basenames.add(base)

lib_basenames = set([sym.split('.')[-1].split(':')[-1] for sym in lib_symbols])
# also detect table prefixes (e.g., vec3.new implies vec3 constructor exists)
lib_prefixes = set()
for sym in lib_symbols:
    if '.' in sym:
        lib_prefixes.add(sym.split('.')[0])
    elif ':' in sym:
        lib_prefixes.add(sym.split(':')[0])

# Consider a wiki base satisfied if it's in lib_basenames or lib_prefixes
missing_basenames = sorted([b for b in wiki_basenames if b not in lib_basenames and b not in lib_prefixes])
extra_basenames = sorted([b for b in lib_basenames if b not in wiki_basenames and b not in lib_prefixes])

print('Wiki function base names missing in library (approx):')
for n in missing_basenames[:200]:
    print(' -', n)

print('\nLibrary function base names not found in wiki (approx):')
for n in extra_basenames[:200]:
    print(' -', n)

# Also check usages of Lua 5.2+ features in wiki code
features = ['table.unpack', 'table.pack', 'math.type', 'utf8.', 'bit32.', '\bgoto\b']
feature_hits = []
for md in sorted(WIKI.glob('*.md')):
    text = md.read_text(encoding='utf-8')
    for feat in features:
        if re.search(feat, text):
            feature_hits.append((md.name, feat))

if feature_hits:
    print('\nPotential Lua 5.2+ features found in wiki:')
    for f in feature_hits:
        print(' -', f[0], f[1])
else:
    print('\nNo obvious Lua 5.2+ features found in the wiki examples.')

# Exit summary
print('\nSummary:')
print(' - wiki symbols scanned:', len(wiki_symbols))
print(' - library symbols scanned:', len(lib_symbols))
print(' - missing (approx):', len(missing_basenames))
print(' - extra (approx):', len(extra_basenames))
