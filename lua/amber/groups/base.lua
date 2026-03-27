---@class amber.groups.base
local M = {}

---Generate base/core Neovim highlight groups
---@param colors table Color palette
---@param config AmberConfig Configuration
---@return table highlights Highlight group definitions
function M.get(colors, config)
    local util = require("amber.util")
    
    -- Handle transparency
    local bg = config.transparent and "NONE" or colors.bg
    local sidebar_bg = config.styles.sidebars == "transparent" and "NONE" 
        or config.styles.sidebars == "dark" and colors.one_bg
        or colors.bg
    local float_bg = config.styles.floats == "transparent" and "NONE"
        or config.styles.floats == "dark" and colors.one_bg
        or colors.bg
    
    return {
        -- Editor UI
        Normal = { fg = colors.fg, bg = bg },
        NormalFloat = { bg = float_bg },
        FloatBorder = { fg = colors.base16.base03, bg = colors.one_bg },
        FloatTitle = { fg = colors.white, bg = colors.black2 },
        
        -- Cursor and selection
        Cursor = { fg = colors.bg, bg = colors.fg, bold = true },
        CursorLine = { bg = util.shade(colors.base16.base06, -30) },
        CursorColumn = { link = "CursorLine" },
        CursorLineNr = { fg = colors.base16.base05 },
        
        -- Visual selection
        Visual = {
            bg = util.shade(colors.nord_blue, -30),
            fg = colors.orange,
            italic = true,
            bold = true,
        },
        VisualNOS = { fg = colors.base16.base09 },
        
        -- Search
        Search = { fg = colors.bg, bg = colors.base16.base06 },
        IncSearch = {
            bg = colors.orange,
            fg = colors.bg,
            bold = true,
            italic = true,
        },
        CurSearch = { fg = util.shade(colors.base16.base06, 10), bg = colors.base16.base03, bold = true },
        Substitute = { fg = colors.base16.base01, bg = colors.base16.base07, bold = true, sp = "none" },
        
        -- Line numbers and columns
        LineNr = { fg = colors.base16.base04 },
        SignColumn = { fg = colors.base16.base03, sp = "NONE" },
        ColorColumn = { bg = colors.black2 },
        FoldColumn = { bg = "none" },
        Folded = { fg = colors.light_grey, bg = util.shade(colors.one_bg3, 2) },
        
        -- Windows and separators  
        WinSeparator = { fg = colors.line },
        WinBar = { bg = util.shade(colors.base16.base03, -18) },
        WinBarNC = { bg = util.shade(colors.base16.base03, -18) },
        
        -- Popup menu
        Pmenu = { bg = colors.pmenu_bg, fg = colors.base16.base04 },
        PmenuSbar = { bg = colors.pmenu_bg },
        PmenuSel = { 
            bg = util.shade(colors.base16.base06, -30), 
            fg = util.shade(colors.orange, 20), 
            bold = true 
        },
        PmenuThumb = { bg = colors.grey },
        
        -- Messages and status
        ModeMsg = { fg = colors.base16.base0B },
        MoreMsg = { fg = colors.base16.base0B },
        Question = { fg = colors.base16.base0D },
        
        -- Errors and warnings
        Error = { fg = colors.red, bg = colors.statusline_bg },
        ErrorMsg = { fg = colors.red, bg = colors.statusline_bg },
        WarningMsg = { fg = colors.base16.base08 },
        
        -- Special elements
        Directory = { fg = colors.base16.base0D },
        Title = { 
            fg = util.shade(colors.white, 5), 
            bg = colors.one_bg3, 
            bold = true, 
            sp = "none" 
        },
        Conceal = { bg = "NONE" },
        NonText = { fg = colors.base16.base0B },
        SpecialKey = { fg = colors.base16.base03 },
        
        -- Diff
        DiffAdd = { fg = colors.green },
        DiffChange = { fg = colors.yellow },  
        DiffDelete = { fg = colors.red },
        DiffText = { fg = colors.blue, bold = true },
        
        -- Spell checking
        SpellBad = { undercurl = true, sp = colors.base16.base08 },
        SpellLocal = { undercurl = true, sp = colors.base16.base0C },
        SpellCap = { undercurl = true, sp = colors.base16.base0D },
        SpellRare = { undercurl = true, sp = colors.base16.base0E },
        
        -- Tabs and status line
        TabLine = { bg = sidebar_bg, fg = colors.grey_fg },
        TabLineFill = { bg = sidebar_bg },
        TabLineSel = { bg = colors.bg, fg = colors.fg },
        StatusLine = { bg = colors.statusline_bg, fg = colors.fg },
        StatusLineNC = { bg = colors.one_bg, fg = colors.grey_fg },
        
        -- Quickfix
        QuickFixLine = { bg = colors.base16.base04, bold = true },
        QuickFixText = { bg = colors.one_bg2 },
        
        -- Wild menu
        WildMenu = { fg = colors.base16.base08, bg = colors.base16.base0A },
        
        -- Health check
        healthSuccess = { bg = colors.green, fg = colors.black },
    }
end

return M