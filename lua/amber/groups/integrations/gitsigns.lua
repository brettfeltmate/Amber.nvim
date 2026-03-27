---@class amber.groups.integrations.gitsigns
local M = {}

---Generate GitSigns highlight groups
---@param colors table Color palette
---@param config AmberConfig Configuration
---@return table highlights Highlight group definitions
function M.get(colors, config)
    local util = require("amber.util")
    
    return {
        -- VGit gutter sign highlights
        GitSignsAdd = { fg = colors.green, bg = "NONE" },
        GitSignsDelete = { fg = colors.red, bg = "NONE" },
        GitSignsChange = { fg = colors.yellow, bg = "NONE" },
        
        -- VGit line-level diff highlights
        GitSignsAddLn = { fg = colors.green, bg = util.shade(colors.green, -35) },
        GitSignsDeleteLn = { fg = colors.red, bg = util.shade(colors.red, -35) },
        
        -- VGit word-level diff highlights
        GitWordAdd = { fg = colors.green, bg = util.shade(colors.green, -35), bold = true },
        GitWordDelete = { fg = colors.red, bg = util.shade(colors.red, -35), bold = true },
        
        -- VGit conflict resolution highlights
        GitConflictCurrentMark = { fg = colors.green, bg = util.shade(colors.green, -35) },
        GitConflictCurrent = { fg = colors.green, bg = util.shade(colors.green, -35) },
        GitConflictIncomingMark = { fg = colors.blue, bg = util.shade(colors.blue, -35) },
        GitConflictIncoming = { fg = colors.blue, bg = util.shade(colors.blue, -35) },
        GitConflictAncestorMark = { fg = colors.purple, bg = util.shade(colors.purple, -35) },
        GitConflictAncestor = { fg = colors.purple, bg = util.shade(colors.purple, -35) },
        GitConflictMiddle = { fg = colors.base16.base04, bg = colors.one_bg2 },
        
        -- VGit UI highlights
        GitBackground = { fg = colors.base16.base05, bg = colors.base16.base03 },
        GitAppBar = { fg = colors.base16.base05, bg = util.shade(colors.base16.base04, -10) },
        GitHeader = { fg = colors.base16.base08, bg = util.shade(colors.base16.base04, -10) },
        GitFooter = { fg = colors.base16.base04, bg = util.shade(colors.base16.base04, -10) },
    }
end

return M