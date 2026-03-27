---@class amber.groups.integrations.treesitter
local M = {}

---Generate TreeSitter highlight groups
---@param colors table Color palette
---@param config AmberConfig Configuration
---@return table highlights Highlight group definitions
function M.get(colors, config)
    local util = require("amber.util")
    
    return {
        -- Variables
        ["@variable"] = { fg = colors.base16.base08 },
        ["@variable.r"] = { fg = util.mix(colors.base16.base08, "#DDDDDD", 25) },
        ["@variable.member.r"] = { fg = util.shade(colors.base16.base08, -3) },
        ["@variable.builtin"] = { fg = util.shade(colors.base16.base0F, 10) },
        ["@variable.parameter"] = { fg = colors.base16.base08 },
        ["@variable.parameter.r"] = { fg = colors.base16.base06 },
        ["@variable.member"] = { fg = colors.base16.base08 },
        ["@variable.member.key"] = { fg = colors.base16.base08 },
        
        -- Modules
        ["@module"] = { fg = colors.base16.base08 },
        
        -- Constants
        ["@constant"] = { fg = colors.base16.base06, bold = true, italic = true },
        ["@constant.builtin"] = { fg = colors.base16.base06 },
        ["@constant.macro"] = { fg = colors.base16.base08 },
        
        -- Strings and characters
        ["@string"] = { fg = colors.base16.base05, italic = true },
        ["@string.regex"] = { fg = colors.base16.base06, bold = true },
        ["@string.escape"] = { fg = colors.base16.base06, bold = true },
        ["@string.csv"] = { fg = colors.base16.base04 },
        ["@character"] = { fg = colors.base16.base08 },
        
        -- Numbers
        ["@number"] = { fg = colors.base16.base0B },
        ["@number.float"] = { fg = colors.base16.base0B },
        
        -- Annotations and attributes
        ["@annotation"] = { fg = colors.base16.base0F },
        ["@attribute"] = { fg = colors.base16.base0A },
        ["@error"] = { fg = colors.base16.base08 },
        
        -- Keywords
        ["@keyword.exception"] = { fg = colors.base16.base08 },
        ["@keyword"] = { fg = colors.base16.base0B },
        ["@keyword.function"] = { fg = colors.base16.base0B },
        ["@keyword.function.r"] = { fg = colors.base16.base0B },
        ["@keyword.return"] = { fg = colors.base16.base0B },
        ["@keyword.operator"] = { fg = colors.base16.base0B },
        ["@keyword.import"] = { link = "Include" },
        ["@keyword.conditional"] = { fg = colors.base16.base0B },
        ["@keyword.conditional.ternary"] = { fg = colors.base16.base0B },
        ["@keyword.repeat"] = { fg = colors.base16.base0B },
        ["@keyword.storage"] = { fg = colors.base16.base0B },
        ["@keyword.directive.define"] = { fg = colors.base16.base0B },
        ["@keyword.directive"] = { fg = colors.base16.base0B },
        
        -- Functions
        ["@function"] = { fg = colors.base16.base0D },
        ["@function.builtin"] = { fg = colors.base16.base0D },
        ["@function.macro"] = { fg = colors.base16.base08 },
        ["@function.call"] = { fg = colors.base16.base0D },
        ["@function.method"] = { fg = colors.base16.base0D },
        ["@function.method.call"] = { fg = colors.base16.base0D },
        ["@constructor"] = { fg = colors.base16.base09 },
        ["@constructor.lua"] = { fg = colors.base16.base0F },
        
        -- Operators and punctuation
        ["@operator"] = { fg = colors.base16.base06 },
        ["@operator.r"] = { fg = colors.base16.base06 },
        ["@reference"] = { fg = colors.base16.base05 },
        ["@punctuation.bracket"] = { fg = colors.base16.base06, bold = true },
        ["@punctuation.delimiter"] = { fg = colors.base16.base06, bold = true },
        ["@punctuation.special.python"] = { fg = colors.base16.base06, bold = true },
        ["@symbol"] = { fg = colors.base16.base0B },
        
        -- Tags (HTML/XML)
        ["@tag"] = { fg = colors.base16.base06 },
        ["@tag.attribute"] = { fg = colors.base16.base08 },
        ["@tag.delimiter"] = { fg = colors.base16.base06 },
        
        -- Text and markup
        ["@text"] = { fg = colors.base16.base05 },
        ["@text.emphasis"] = { fg = colors.base16.base09 },
        ["@text.strike"] = { fg = colors.base16.base0F, strikethrough = true },
        ["@type.builtin"] = { fg = colors.base16.base06 },
        ["@definition"] = { sp = colors.base16.base04, underline = true },
        ["@scope"] = { bold = true },
        ["@property"] = { fg = colors.base16.base08 },
        
        -- Markup (Markdown, etc.)
        ["@markup.heading"] = { fg = colors.base16.base0D },
        ["@markup.heading.1.markdown"] = { fg = colors.base16.base0F },
        ["@markup.heading.2.markdown"] = { fg = util.shade(colors.base16.base0F, 10) },
        ["@markup.heading.3.markdown"] = { fg = colors.base16.base06 },
        ["@markup.heading.4.markdown"] = { fg = util.shade(colors.base16.base06, 10) },
        ["@markup.heading.5.markdown"] = { fg = util.shade(colors.base16.base0E, -20) },
        ["@markup.heading.6.markdown"] = { fg = util.shade(colors.base16.base0E, -10) },
        ["@markup.raw"] = { fg = colors.base16.base09 },
        ["@markup.link"] = { fg = colors.base16.base08 },
        ["@markup.link.url"] = { fg = colors.base16.base09, underline = true },
        ["@markup.link.label"] = { fg = colors.base16.base0C },
        ["@markup.list.markdown"] = { fg = colors.base16.base07 },
        ["@markup.strong"] = { bold = true },
        ["@markup.underline"] = { underline = true },
        ["@markup.italic"] = { italic = true },
        ["@markup.strikethrough"] = { strikethrough = true },
        ["@markup.quote"] = { bg = colors.black2 },
        
        -- Comments (treesitter specific)
        ["@comment"] = { fg = colors.base16.base04 },
        ["@comment.todo"] = { fg = colors.grey, bg = colors.white },
        ["@comment.warning"] = { fg = colors.black2, bg = colors.base16.base09 },
        ["@comment.note"] = { fg = colors.black, bg = colors.blue },
        ["@comment.danger"] = { fg = colors.black2, bg = colors.red },
        
        -- Diff
        ["@diff.plus"] = { fg = colors.green },
        ["@diff.minus"] = { fg = colors.red },
        ["@diff.delta"] = { fg = colors.light_grey },
    }
end

return M