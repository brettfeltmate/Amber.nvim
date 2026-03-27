---@class amber.groups.integrations.fzf
local M = {}

---Generate FzfLua highlight groups
---@param colors table Color palette
---@param config AmberConfig Configuration
---@return table highlights Highlight group definitions
function M.get(colors, config)
    local util = require("amber.util")
    
    return {
        FzfLuaFzfMatch = { 
            bg = colors.base16.base04, 
            fg = util.shade(colors.base16.base09, 20), 
            bold = true, 
            italic = true 
        },
        FzfLuaFzfMarker = { 
            bg = colors.base16.base04, 
            fg = util.shade(colors.base16.base09, 20), 
            bold = true, 
            italic = true 
        },
        FzfLuaSearch = { 
            bg = colors.base16.base04, 
            fg = util.shade(colors.base16.base09, 20), 
            bold = true, 
            italic = true 
        },
        FzfLuaBorder = { link = "FloatBorder" },
    }
end

return M