---@class amber.groups.integrations.nvim_tree
local M = {}

---Generate NvimTree highlight groups
---@param colors table Color palette
---@param config AmberConfig Configuration
---@return table highlights Highlight group definitions
function M.get(colors, config)
    return {
        NvimTreeEmptyFolderName = { fg = colors.folder_bg },
        NvimTreeEndOfBuffer = { fg = colors.darker_black },
        NvimTreeFolderIcon = { fg = colors.folder_bg },
        NvimTreeFolderName = { fg = colors.folder_bg },
        NvimTreeFolderArrowOpen = { fg = colors.folder_bg },
        NvimTreeFolderArrowClosed = { fg = colors.grey_fg },
        NvimTreeGitDirty = { fg = colors.red },
        NvimTreeOpenedFolderName = { fg = colors.folder_bg },
        NvimTreeGitIgnored = { fg = colors.light_grey },
        NvimTreeWinSeparator = { fg = colors.lightbg, bg = colors.menu_bg },
        NvimTreeWindowPicker = { fg = colors.red, bg = colors.black2 },
        NvimTreeCursorLine = { bg = colors.black },
        NvimTreeGitNew = { fg = colors.yellow },
        NvimTreeGitDeleted = { fg = colors.red },
        NvimTreeSpecialFile = { fg = colors.yellow, bold = true },
        NvimTreeRootFolder = { fg = colors.red, bold = true },
    }
end

return M