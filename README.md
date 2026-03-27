# 🟤 Amber.nvim

A warm, elegant Neovim colorscheme inspired by amber gemstone hues. Built as a modern, standalone plugin with comprehensive plugin integrations and extensive customization options.

## ✨ Features

- **🎨 Beautiful Amber Palette**: Carefully crafted warm colors based on amber tones
- **🔧 Highly Configurable**: Extensive customization options for colors, styles, and transparency
- **🔌 Rich Plugin Support**: Built-in support for popular plugins like Lazy, Telescope, Blink, TreeSitter, and more
- **⚡ Performance Optimized**: Self-contained color utilities with no external dependencies
- **🎯 Modern Architecture**: Clean, modular codebase following best practices
- **🖥️ Terminal Integration**: Full terminal color support for `:terminal`
- **🚀 Plugin Manager Friendly**: Works with all major plugin managers

## 📦 Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim) (Recommended)

```lua
{
    "your-username/amber.nvim",
    priority = 1000,
    config = function()
        require("amber").setup({
            -- your configuration here
        })
        vim.cmd.colorscheme("amber")
    end
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
    "your-username/amber.nvim",
    config = function()
        require("amber").setup()
        vim.cmd.colorscheme("amber")
    end
}
```

### Manual Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/amber.nvim ~/.local/share/nvim/site/pack/plugins/start/amber.nvim
   ```

2. Add to your `init.lua`:
   ```lua
   require("amber").setup()
   vim.cmd.colorscheme("amber")
   ```

## 🚀 Usage

### Basic Usage

```lua
-- Simple setup with defaults
require("amber").setup()
vim.cmd.colorscheme("amber")
```

### Advanced Configuration

```lua
require("amber").setup({
    -- Style options
    variant = "amber",          -- Currently only "amber", more variants coming
    transparent = false,        -- Enable transparent background
    terminal_colors = true,     -- Set terminal colors for :terminal
    
    -- Style customization
    styles = {
        comments = { italic = true, bold = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",      -- "dark", "transparent", "normal"  
        floats = "dark",        -- "dark", "transparent", "normal"
    },
    
    -- Plugin integrations
    integrations = {
        lazy = true,            -- Lazy.nvim
        telescope = true,       -- Telescope.nvim
        blink_cmp = true,       -- Blink.cmp
        snacks = true,          -- Snacks.nvim
        nvim_tree = true,       -- NvimTree
        treesitter = true,      -- TreeSitter
        lsp = true,             -- LSP
        which_key = true,       -- WhichKey
        gitsigns = true,        -- GitSigns
        fzf = true,             -- FzfLua
    },
    
    -- Custom color overrides
    on_colors = function(colors)
        colors.red = "#ff6b6b"  -- Override red color
    end,
    
    -- Custom highlight overrides
    on_highlights = function(highlights, colors)
        highlights.Comment = { fg = colors.green, italic = true }
    end,
})
```

## 🎨 Color Palette

Amber.nvim uses a carefully curated 16-color base palette extended with computed UI colors:

### Base16 Colors
- **Background**: Deep charcoal with warm undertones
- **Foreground**: Soft amber-tinted whites  
- **Accent Colors**: Warm ambers, burnt oranges, deep purples
- **Syntax Colors**: Muted earth tones with amber highlights

### Extended Palette
The theme automatically generates an extended palette of 30+ colors using color mixing and shading algorithms, ensuring consistent visual harmony throughout your editor.

## 🔌 Plugin Support

Amber.nvim includes built-in support for:

- **Plugin Managers**: Lazy.nvim, Packer.nvim
- **Completion**: Blink.cmp, nvim-cmp
- **File Trees**: NvimTree, Neo-tree
- **Fuzzy Finders**: Telescope, FzfLua  
- **Git**: GitSigns, Fugitive
- **UI Enhancement**: Snacks.nvim, WhichKey
- **Syntax**: TreeSitter, LSP
- **Terminal**: Full terminal color support

## 🛠️ Customization

### Accessing Colors

```lua
local colors = require("amber").colors()
print(colors.red)     -- Get red color
print(colors.bg)      -- Get background color
```

### Color Utilities

```lua
local util = require("amber").util()
local lighter_red = util.lighten("#ff0000", 20)  -- Lighten by 20%
local mixed_color = util.mix("#ff0000", "#00ff00", 50)  -- Mix red and green 50/50
```

### Custom Highlights

```lua
require("amber").setup({
    on_highlights = function(highlights, colors)
        -- Customize specific highlight groups
        highlights.Function = { fg = colors.yellow, bold = true }
        highlights.String = { fg = colors.green, italic = true }
    end,
})
```

## 🎯 Roadmap

- [ ] **Light Variant**: Amber Light theme
- [ ] **Warm Variant**: Extra warm amber tones  
- [ ] **External Tools**: Kitty, Alacritty, Tmux themes
- [ ] **More Integrations**: Additional plugin support
- [ ] **Performance**: Compilation and caching system

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by the warm, organic beauty of amber gemstones
- Built using modern colorscheme architecture patterns
- Thanks to the Neovim community for the amazing plugin ecosystem