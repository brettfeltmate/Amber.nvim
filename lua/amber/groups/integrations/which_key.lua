---@class amber.groups.integrations.which_key
local M = {}

---Generate WhichKey highlight groups
---@param colors table Color palette
---@param config AmberConfig Configuration
---@return table highlights Highlight group definitions
function M.get(colors, config)
    return {
        WhichKey = { fg = colors.base16.base0A },
        WhichKeySeparator = { link = "WinSeparator" },
        WhichKeyDesc = { fg = colors.base16.base0B },
        WhichKeyGroup = { fg = colors.base16.base07 },
        WhichKeyValue = { fg = colors.base16.base0A },
        WhichKeyBorder = { link = "FloatBorder" },
        WhichKeyTitle = { fg = colors.base16.base07 },
    }
end

return M