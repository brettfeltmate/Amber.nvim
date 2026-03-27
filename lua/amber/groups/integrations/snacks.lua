---@class amber.groups.integrations.snacks
local M = {}

---Generate Snacks.nvim highlight groups
---@param colors table Color palette
---@param config AmberConfig Configuration
---@return table highlights Highlight group definitions
function M.get(colors, config)
    local util = require("amber.util")
    
    return {
        SnacksIndent = { fg = colors.base16.base04 },
        SnacksIndentScope = { fg = colors.line },
        SnacksDashboardKey = { fg = colors.base16.base04, bold = true },
        SnacksDashboardHeader = { fg = util.shade(colors.base16.base04, 10) },
        SnacksDashboardDir = { fg = util.shade(colors.base16.base04, -10) },
    }
end

return M