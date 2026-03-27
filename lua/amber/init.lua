---@class amber
local M = {}

---Setup the Amber colorscheme
---@param user_config? AmberConfig User configuration options
---@return AmberConfig config The final configuration used
function M.setup(user_config)
    local config_module = require("amber.config")
    return config_module.setup(user_config)
end

---Load the Amber colorscheme
---@param opts? table Load options (currently unused, for future variants)
function M.load(opts)
    opts = opts or {}
    
    -- Get current configuration
    local config = require("amber.config").get()
    
    -- Load and apply theme
    require("amber.theme").load(config)
end

---Get the current color palette
---@return table colors Color palette
function M.colors()
    local colors_module = require("amber.colors")
    local colors = colors_module.generate_palette()
    colors.base16 = colors_module.base16
    return colors
end

---Get color utilities
---@return table utils Color utility functions
function M.util()
    return require("amber.util")
end

return M