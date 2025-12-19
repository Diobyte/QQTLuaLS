---@meta

---@see https://github.com/qqtnn/qqt_diablo/wiki/Console

---@class console

local console = {}

---@param ... any
---@return nil
---@description The `console.print` function is utilized for standard console output. It efficiently handles various data types such as integers, strings, and floating-point numbers. This function is ideal for simple debugging or displaying information. **Example:** Output: `123 hello 3222 322.0`
---@example console.print(123, "hello", 3222, 322.0)
---@since 1.0.0
function console.print(...) end

---@param delay number
---@param interval number
---@param ... any
---@return nil
---@description `console.print_full` offers controlled printing capabilities with specified delay and interval parameters. It is particularly useful for tracking values over time, without cluttering the console with rapid outputs.
---@example console.print_full(1.0, 0.5, "value:", my_var)
---@since 1.0.0
function console.print_full(delay, interval, ...) end

return console
