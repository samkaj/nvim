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
    - `<leader>ha` to add the current buffer to the Harpoon window
    - `<leader>hc` to remove the current buffer from the Harpoon window

- Git integration with Fugitive
    - `:gs` to see the git status
    - `:gc` to commit changes (e.g., `:gc -m "commit message"`)
    - `:gu` to unstage changes
    - `:ga` to stage changes (e.g., `:ga -p` to stage hunks or `:ga .` to stage all changes)
    - `:gf` to stage the current file

- LSP management with Mason
    - `:Mason` to open Mason, navigate from there

- Language support with Treesitter
    - Syntax highlighting with `:TSInstall <language>`
    - Rename symbols with `<leader>rn`
    - *WIP, have not used it much yet*

- Autocompletion with nvim-comp
    - Intellisense-like autocompletion
    - `<C-Space>` to trigger suggestions

- Formatting with Neoformat
    - `<leader>p` to format the current buffer

- Statusline with Lualine
