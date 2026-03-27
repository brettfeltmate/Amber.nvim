-- Amber colorscheme entry point
vim.cmd("hi clear")

if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end

vim.opt.termguicolors = true
vim.g.colors_name = "amber"

-- Load the amber colorscheme
require("amber").load()

-- Add a simple autocmd to restore the colorscheme name if it gets reset
-- This addresses the specific issue where buffer operations reset colors_name
local augroup = vim.api.nvim_create_augroup("AmberColorscheme", { clear = true })
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile", "BufEnter"}, {
    group = augroup,
    callback = function()
        if vim.g.colors_name ~= "amber" then
            vim.g.colors_name = "amber"
        end
    end,
})