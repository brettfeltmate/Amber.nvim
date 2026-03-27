---@class amber.colors
local M = {}

local util = require("amber.util")

-- Base16 color palette (from your original theme)
M.base16 = {
    base00 = "#100e10", -- Default Background
    base01 = "#100f12", -- Lighter Background (Used for status bars, line number and folding marks)
    base02 = "#17151a", -- Selection Background
    base03 = "#161111", -- Comments, Invisibles, Line Highlighting
    base04 = "#5f514a", -- Dark Foreground (Used for status bars)
    base05 = "#788070", -- Default Foreground, Caret, Delimiters, Operators
    base06 = "#775056", -- Light Foreground (Not often used)
    base07 = "#7b8875", -- Light Background (Not often used)
    base08 = "#989183", -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
    base09 = "#a38da7", -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
    base0A = "#a7787e", -- Classes, Markup Bold, Search Text Background
    base0B = "#8f909c", -- Strings, Inherited Class, Markup Code, Diff Inserted
    base0C = "#a57370", -- Support, Regular Expressions, Escape Characters, Markup Quotes
    base0D = "#b49398", -- Functions, Methods, Attribute IDs, Headings
    base0E = "#aca398", -- Keywords, Storage, Selector, Markup Italic, Diff Changed
    base0F = "#9b7c91", -- Deprecated, Opening/Closing Embedded Language Tags
}

-- Extended UI palette (computed from base16 using utilities)
function M.generate_palette()
    local base16 = M.base16
    
    return {
        -- Core colors
        bg = base16.base00,
        fg = base16.base05,
        
        -- Extended palette (from your original base30)
        white = base16.base08,
        black = base16.base00,
        darker_black = base16.base01,
        black2 = util.shade(base16.base02, -2),
        one_bg = base16.base01,
        one_bg2 = base16.base02,
        one_bg3 = base16.base03,
        grey = base16.base02,
        grey_fg = base16.base04,
        grey_fg2 = base16.base04,
        light_grey = util.mix(base16.base02, base16.base05, 30),
        red = base16.base0C,
        baby_pink = util.shade(base16.base0A, 15),
        pink = util.shade(base16.base0A, 5),
        line = base16.base06,
        green = base16.base07,
        vibrant_green = util.shade(base16.base07, 10),
        nord_blue = base16.base09,
        blue = util.mix(base16.base09, base16.base0D, 65),
        seablue = util.mix(base16.base09, base16.base0D, 45),
        yellow = util.shade(base16.base0E, 10),
        sun = util.mix(base16.base0E, base16.base0A, 65),
        purple = base16.base0F,
        dark_purple = util.mix(base16.base0F, base16.base02, 20),
        teal = util.mix(base16.base0D, base16.base09, 65),
        cyan = util.mix(base16.base09, base16.base0D, 65),
        orange = util.mix(base16.base0C, base16.base0E, 40),
        
        -- UI specific colors
        statusline_bg = base16.base02,
        lightbg = base16.base05,
        pmenu_bg = base16.base03,
        folder_bg = base16.base02,
    }
end

-- Generate terminal colors for use with :terminal
function M.generate_terminal_colors()
    local palette = M.generate_palette()
    
    return {
        terminal_color_0 = palette.black,
        terminal_color_1 = palette.red,
        terminal_color_2 = palette.green,
        terminal_color_3 = palette.yellow,
        terminal_color_4 = palette.blue,
        terminal_color_5 = palette.purple,
        terminal_color_6 = palette.cyan,
        terminal_color_7 = palette.white,
        terminal_color_8 = palette.grey,
        terminal_color_9 = palette.red,
        terminal_color_10 = palette.green,
        terminal_color_11 = palette.yellow,
        terminal_color_12 = palette.blue,
        terminal_color_13 = palette.purple,
        terminal_color_14 = palette.cyan,
        terminal_color_15 = palette.white,
    }
end

return M