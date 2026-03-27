---@class amber.config
local M = {}

---@class AmberConfig
---@field variant? string Theme variant (currently only "amber")
---@field transparent? boolean Enable transparent background
---@field terminal_colors? boolean Set terminal colors
---@field protect_colorscheme? boolean Protect against colorscheme reversion
---@field styles? AmberStyles Style configuration
---@field integrations? AmberIntegrations Plugin integration settings
---@field on_colors? fun(colors: table): nil Callback to modify colors
---@field on_highlights? fun(highlights: table, colors: table): nil Callback to modify highlights
---@field cache? boolean Enable theme caching

---@class AmberStyles
---@field comments? table Comment styles
---@field keywords? table Keyword styles  
---@field functions? table Function styles
---@field variables? table Variable styles
---@field sidebars? "dark"|"transparent"|"normal" Sidebar background style
---@field floats? "dark"|"transparent"|"normal" Floating window background style

---@class AmberIntegrations
---@field lazy? boolean Enable lazy.nvim integration
---@field telescope? boolean Enable telescope.nvim integration
---@field blink_cmp? boolean Enable blink.cmp integration
---@field snacks? boolean Enable snacks.nvim integration
---@field nvim_tree? boolean Enable nvim-tree integration
---@field treesitter? boolean Enable treesitter integration
---@field lsp? boolean Enable LSP integration
---@field neo_tree? boolean Enable neo-tree integration
---@field which_key? boolean Enable which-key integration
---@field gitsigns? boolean Enable gitsigns integration
---@field fzf? boolean Enable fzf-lua integration

---Default configuration
---@type AmberConfig
M.defaults = {
    variant = "amber",
    transparent = false,
    terminal_colors = true,
    protect_colorscheme = true,
    
    styles = {
        comments = { italic = true, bold = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
    },
    
    integrations = {
        -- Core integrations (from your current theme)
        lazy = true,
        telescope = true,
        blink_cmp = true,
        snacks = true,
        nvim_tree = true,
        treesitter = true,
        lsp = true,
        neo_tree = true,
        which_key = true,
        gitsigns = true,
        fzf = true,
    },
    
    on_colors = function(colors) end,
    on_highlights = function(highlights, colors) end,
    
    cache = true,
}

---Current configuration (starts as defaults)
---@type AmberConfig
M.options = vim.tbl_deep_extend("force", {}, M.defaults)

---Setup function to configure the theme
---@param user_config? AmberConfig User configuration
---@return AmberConfig config Final configuration
function M.setup(user_config)
    M.options = vim.tbl_deep_extend("force", {}, M.defaults, user_config or {})
    return M.options
end

---Get current configuration
---@return AmberConfig config Current configuration
function M.get()
    return M.options
end

return M