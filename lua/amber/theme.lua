---@class amber.theme
local M = {}

---Apply highlight group to Neovim
---@param name string Highlight group name
---@param opts table Highlight options
local function highlight(name, opts)
    vim.api.nvim_set_hl(0, name, opts)
end

---Apply all highlight groups from a table
---@param groups table Table of highlight groups
local function apply_highlights(groups)
    for name, opts in pairs(groups) do
        highlight(name, opts)
    end
end

---Load and apply the complete theme
---@param config AmberConfig Configuration options
function M.load(config)
    -- Reset colors
    if vim.g.colors_name then
        vim.cmd("highlight clear")
    end
    
    vim.opt.termguicolors = true
    vim.g.colors_name = "amber"
    
    -- Set up protection against colorscheme reversion
    M.setup_protection(config)
    
    -- Get colors and apply user color overrides
    local colors_module = require("amber.colors")
    local colors = colors_module.generate_palette()
    colors.base16 = colors_module.base16
    
    if config.on_colors then
        config.on_colors(colors)
    end
    
    -- Collect all highlight groups
    local all_highlights = {}
    
    -- Base highlights (core UI)
    local base_groups = require("amber.groups.base").get(colors, config)
    all_highlights = vim.tbl_extend("force", all_highlights, base_groups)
    
    -- Syntax highlights
    local syntax_groups = require("amber.groups.syntax").get(colors, config)
    all_highlights = vim.tbl_extend("force", all_highlights, syntax_groups)
    
    -- Plugin integrations
    if config.integrations.treesitter then
        local treesitter_groups = require("amber.groups.integrations.treesitter").get(colors, config)
        all_highlights = vim.tbl_extend("force", all_highlights, treesitter_groups)
    end
    
    if config.integrations.lazy then
        local lazy_groups = require("amber.groups.integrations.lazy").get(colors, config)
        all_highlights = vim.tbl_extend("force", all_highlights, lazy_groups)
    end
    
    if config.integrations.blink_cmp then
        local blink_groups = require("amber.groups.integrations.blink").get(colors, config)
        all_highlights = vim.tbl_extend("force", all_highlights, blink_groups)
    end
    
    if config.integrations.snacks then
        local snacks_groups = require("amber.groups.integrations.snacks").get(colors, config)
        all_highlights = vim.tbl_extend("force", all_highlights, snacks_groups)
    end
    
    if config.integrations.which_key then
        local which_key_groups = require("amber.groups.integrations.which_key").get(colors, config)
        all_highlights = vim.tbl_extend("force", all_highlights, which_key_groups)
    end
    
    if config.integrations.nvim_tree then
        local nvim_tree_groups = require("amber.groups.integrations.nvim_tree").get(colors, config)
        all_highlights = vim.tbl_extend("force", all_highlights, nvim_tree_groups)
    end
    
    if config.integrations.fzf then
        local fzf_groups = require("amber.groups.integrations.fzf").get(colors, config)
        all_highlights = vim.tbl_extend("force", all_highlights, fzf_groups)
    end
    
    if config.integrations.gitsigns then
        local gitsigns_groups = require("amber.groups.integrations.gitsigns").get(colors, config)
        all_highlights = vim.tbl_extend("force", all_highlights, gitsigns_groups)
    end
    
    -- Apply user highlight overrides
    if config.on_highlights then
        config.on_highlights(all_highlights, colors)
    end
    
    -- Apply all highlights
    apply_highlights(all_highlights)
    
    -- Set terminal colors if enabled
    if config.terminal_colors then
        local terminal_colors = colors_module.generate_terminal_colors()
        for name, color in pairs(terminal_colors) do
            vim.g[name] = color
        end
    end
end

---Setup protection against colorscheme reversion
---@param config AmberConfig Configuration options
function M.setup_protection(config)
    -- Skip protection if disabled in config (default to true if not specified)
    if config.protect_colorscheme == false then
        return
    end
    
    -- Create autocmd group for amber colorscheme protection
    local amber_group = vim.api.nvim_create_augroup("AmberColorschemeProtection", { clear = true })
    
    -- Protect against other colorschemes being loaded when amber should be active
    vim.api.nvim_create_autocmd("ColorScheme", {
        group = amber_group,
        callback = function(args)
            -- If another colorscheme was loaded but we want amber, restore it
            if args.match ~= "amber" and vim.g.amber_colorscheme_active then
                vim.schedule(function()
                    -- Reload amber colorscheme
                    require("amber.theme").load(config)
                end)
            elseif args.match == "amber" then
                -- Mark amber as active when it's loaded
                vim.g.amber_colorscheme_active = true
            else
                -- Another colorscheme was intentionally loaded
                vim.g.amber_colorscheme_active = false
            end
        end,
    })
    
    -- Mark amber as currently active
    vim.g.amber_colorscheme_active = true
    
    -- Optional: Protect against highlight clearing on buffer events
    -- This addresses potential issues with plugins that clear highlights on buffer writes
    vim.api.nvim_create_autocmd({"BufWrite", "BufEnter"}, {
        group = amber_group,
        callback = function()
            -- Only restore if amber should be active and colors_name doesn't match
            if vim.g.amber_colorscheme_active and vim.g.colors_name ~= "amber" then
                vim.schedule(function()
                    require("amber.theme").load(config)
                end)
            end
        end,
    })
end

---Disable colorscheme protection
function M.disable_protection()
    vim.g.amber_colorscheme_active = false
    local success = pcall(vim.api.nvim_del_augroup_by_name, "AmberColorschemeProtection")
    if not success then
        -- Silently ignore if group doesn't exist
    end
end

return M