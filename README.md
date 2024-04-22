# Neovim configuration

My personal neovim configuration.

## Requirements

- [Neovim (duh)](https://neovim.io/)
- A [Nerd Font](https://www.nerdfonts.com/)
- [Ripgrep](https://github.com/BurntSushi/ripgrep)

## Features

- Lazy for plugins
- Fuzzy finding with Telescope:
  - `<leader>ff` to find files
  - `<leader>fg` to grep symbols
- Buffer handling with Harpoon
  - `<leader>hh` to toggle the Harpoon window
  - `<leader>hc` to add the current buffer to the Harpoon window
- Git integration with Fugitive
- Language support with Treesitter
  - Syntax highlighting with `:TSInstall <language>`
  - Rename symbols with `<leader>rn`
  - _WIP, have not used it much yet_
- Autocompletion with nvim-comp
  - Intellisense-like autocompletion
  - `<C-Space>` to trigger suggestions
- Formatting with Neoformat
  - `<leader>p` to format the current buffer
- Statusline with Lualine
