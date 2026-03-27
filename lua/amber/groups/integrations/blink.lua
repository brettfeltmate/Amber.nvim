---@class amber.groups.integrations.blink
local M = {}

---Generate Blink.cmp highlight groups
---@param colors table Color palette
---@param config AmberConfig Configuration
---@return table highlights Highlight group definitions
function M.get(colors, config)
    return {
        BlinkCmpMenu = { bg = colors.black2 },
        BlinkCmpMenuBorder = { bg = colors.black2, fg = colors.base16.base07 },
        BlinkCmpDoc = { bg = colors.black2 },
        BlinkCmpDocBorder = { bg = colors.black2, fg = colors.base16.base07 },
        BlinkCmpGhostText = { fg = colors.base16.base04 },
        BlinkCmpSignatureHelp = { bg = colors.black2 },
        BlinkCmpSignatureHelpBorder = { bg = "none", fg = colors.base16.base07 },
        BlinkCmpSignatureHelpActiveParameter = { fg = colors.base16.base07, bold = true },
    }
end

return M