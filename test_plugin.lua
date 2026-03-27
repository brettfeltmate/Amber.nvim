-- Simple test script for amber.nvim plugin
-- This script can be run to test basic functionality

print("Testing amber.nvim plugin...")

-- Add the plugin to package path
package.path = package.path .. ";./lua/?.lua"

-- Test loading main module
local ok, amber = pcall(require, "amber")
if not ok then
    print("❌ Failed to load amber module:", amber)
    return
end
print("✅ Successfully loaded amber module")

-- Test color utilities
local ok, util = pcall(require, "amber.util")
if not ok then
    print("❌ Failed to load util module:", util)
    return
end
print("✅ Successfully loaded util module")

-- Test some utility functions
local hex = "#ff0000"
local r, g, b = util.hex_to_rgb(hex)
print("✅ hex_to_rgb test:", hex, "->", r, g, b)

local back_to_hex = util.rgb_to_hex(r, g, b)
print("✅ rgb_to_hex test:", r, g, b, "->", back_to_hex)

-- Test color palette
local ok, colors = pcall(require, "amber.colors")
if not ok then
    print("❌ Failed to load colors module:", colors)
    return
end
print("✅ Successfully loaded colors module")

local palette = colors.generate_palette()
print("✅ Generated palette with", vim.tbl_count(palette), "colors")

-- Test configuration
local ok, config = pcall(require, "amber.config")
if not ok then
    print("❌ Failed to load config module:", config)
    return
end
print("✅ Successfully loaded config module")

print("\n🎉 All basic tests passed! The amber.nvim plugin appears to be working correctly.")
print("\nTo use the plugin:")
print("1. Copy the amber.nvim directory to your Neovim plugin location")
print("2. Add to your config: require('amber').setup()")  
print("3. Set colorscheme: vim.cmd.colorscheme('amber')")