# Contributing to QQTLuaLS

Thank you for your interest in contributing to the QQT Diablo Lua Language Server plugin! This guide outlines how to contribute effectively.

## Getting Started

1. Fork the repository and clone it locally.
2. Initialize submodules: `git submodule update --init --recursive`
3. Install the plugin in your development environment using the installation script.

## Updating from Wiki Changes

When the upstream wiki (https://github.com/qqtnn/qqt_diablo.wiki.git) is updated:

1. Update the submodule: `git submodule update --remote temp_wiki`
2. Review changed markdown files in `temp_wiki/` for new API additions/modifications.
3. Update corresponding Lua files in `library/`:
   - Add new functions/classes with proper EmmyLua annotations.
   - Update parameter types and return values.
   - Add examples and cross-references.
   - Include @since tags for new features.
   - Mark obsolete methods with @deprecated.
4. Run tests: `lua test_annotations.lua`
5. Update version in `plugin.json` based on wiki commit hash.
6. Commit changes with descriptive messages.

## Annotation Guidelines

- Use concrete types where possible (e.g., `number` instead of `any`).
- Add @alias for common types like `---@alias spell_id number`.
- Include @example for complex methods.
- Add cross-references: "See also: related_function()".
- Handle optional parameters: `---@param[opt] param type`.
- For variable returns, use unions: `---@return string|nil`.

## Testing

- Ensure all annotations parse without errors in Lua LS.
- Test IntelliSense in sample scripts.
- Run the validation script to check against upstream wiki.

## Pull Request Process

1. Create a feature branch from `main`.
2. Make your changes following the guidelines above.
3. Test thoroughly.
4. Submit a PR with a clear description of changes.
5. Wait for review and address feedback.

## Code of Conduct

Be respectful and constructive in all interactions. Focus on improving the plugin for the community.
