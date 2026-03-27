---@class amber.groups.syntax
local M = {}

---Generate syntax highlighting groups
---@param colors table Color palette
---@param config AmberConfig Configuration
---@return table highlights Highlight group definitions  
function M.get(colors, config)
    local styles = config.styles
    
    return {
        -- Comments
        Comment = vim.tbl_extend("force", { fg = colors.base16.base04 }, styles.comments or {}),
        
        -- Constants
        Constant = vim.tbl_extend("force", { fg = colors.base16.base08, bold = true, italic = true }, styles.variables or {}),
        Boolean = { fg = colors.base16.base09 },
        Character = { fg = colors.base16.base08 },
        Number = { fg = colors.base16.base0B },
        Float = { fg = colors.base16.base0B },
        String = { fg = colors.base16.base05 },
        
        -- Identifiers
        Identifier = vim.tbl_extend("force", { fg = colors.base16.base08, sp = "none" }, styles.variables or {}),
        Variable = vim.tbl_extend("force", { fg = colors.base16.base05 }, styles.variables or {}),
        Function = vim.tbl_extend("force", { fg = colors.base16.base0D }, styles.functions or {}),
        
        -- Statements
        Statement = { fg = colors.base16.base08 },
        Conditional = { fg = colors.base16.base0E },
        Repeat = { fg = colors.base16.base0A },
        Label = { fg = colors.base16.base0A },
        Operator = { fg = colors.base16.base06, sp = "none" },
        Keyword = vim.tbl_extend("force", { fg = colors.base16.base0E }, styles.keywords or {}),
        Exception = { fg = colors.base16.base08 },
        
        -- PreProcessor
        PreProc = { fg = colors.base16.base0A },
        Include = { fg = colors.base16.base0D },
        Define = { fg = colors.base16.base0E, sp = "none" },
        Macro = { fg = colors.base16.base08 },
        PreCondit = { fg = colors.base16.base0A },
        
        -- Types
        Type = { fg = colors.base16.base0A, sp = "none" },
        StorageClass = { fg = colors.base16.base0A },
        Structure = { fg = colors.base16.base0E },
        Typedef = { fg = colors.base16.base0A },
        
        -- Special
        Special = { fg = colors.base16.base0B },
        SpecialChar = { fg = colors.base16.base0F },
        Tag = { fg = colors.base16.base0A },
        Delimiter = { fg = colors.base16.base0F },
        SpecialComment = { fg = colors.base16.base0C },
        Debug = { fg = colors.base16.base08 },
        
        -- Underlined and styling
        Underlined = { underline = true },
        Ignore = { fg = colors.base16.base00 },
        Error = { fg = colors.base16.base08 },
        Todo = { fg = colors.base16.base0A, bg = colors.base16.base01 },
        
        -- Additional semantic elements
        Bold = { bold = true },
        Italic = { italic = true },
        TooLong = { fg = colors.base16.base08 },
        
        -- Added/Removed/Changed (for diffs)
        Added = { fg = colors.yellow },
        Removed = { fg = colors.baby_pink },
        Changed = { fg = colors.purple },
    }
end

return M