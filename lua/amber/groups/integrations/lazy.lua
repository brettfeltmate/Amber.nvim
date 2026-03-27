---@class amber.groups.integrations.lazy
local M = {}

---Generate Lazy.nvim highlight groups
---@param colors table Color palette
---@param config AmberConfig Configuration
---@return table highlights Highlight group definitions
function M.get(colors, config)
    local util = require("amber.util")
    
    return {
        -- Headers and titles
        LazyH1 = {
            bg = util.shade(colors.base16.base06, -40),
            fg = colors.green,
            bold = true,
        },
        LazyH2 = { fg = colors.white, bold = true, italic = true, underline = false },
        
        -- Buttons
        LazyButton = {
            bg = util.shade(colors.base16.base06, -40),
            fg = colors.dark_purple,
        },
        LazyButtonActive = {
            bg = util.shade(colors.base16.base06, -40),
            fg = colors.green,
            bold = true,
        },
        
        -- Content elements
        LazyReasonPlugin = { fg = colors.red },
        LazyValue = { fg = colors.teal },
        LazyDir = { fg = colors.base16.base05 },
        LazyUrl = { fg = colors.base16.base05 },
        LazyCommit = { fg = colors.green },
        LazyNoCond = { fg = colors.red },
        LazySpecial = { fg = colors.base16.base0B },
        LazyReasonFt = { fg = colors.purple },
        LazyOperator = { fg = colors.white },
        LazyReasonKeys = { fg = colors.teal },
        LazyTaskOutput = { fg = colors.white },
        LazyCommitIssue = { fg = colors.pink },
        LazyReasonEvent = { fg = colors.yellow },
        LazyReasonStart = { fg = colors.white },
        LazyReasonRuntime = { fg = colors.nord_blue },
        LazyReasonCmd = { fg = colors.sun },
        LazyReasonSource = { fg = colors.cyan },
        LazyReasonImport = { fg = colors.white },
        LazyProgressDone = { fg = colors.green },
    }
end

return M