-- Leader is space
vim.g.mapleader = " "

-- Spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- :Wq, Xa, etc. remaps
vim.cmd("command! Wq wq")
vim.cmd("command! W w")
vim.cmd("command! Q q")
vim.cmd("command! X x")
vim.cmd("command! Xa xa")

-- Highlight on yank
vim.cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = false}")

-- Navigate with ctrl+{h|j|k|l}
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })

-- Open file explorer
vim.api.nvim_set_keymap("n", "<leader>fe", ":Ex<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fr", ":vspl<CR><Esc>:Ex<CR>", { noremap = true })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fd", builtin.git_files, {})

-- Format
vim.api.nvim_set_keymap("n", "<leader>p", ":Neoformat<CR>", { noremap = true })

-- IncRename
vim.keymap.set("n", "<leader>rn", ":IncRename ")

-- Harpoon
vim.keymap.set("n", "<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { silent = true })
vim.keymap.set("n", "<leader>hc", ":lua require('harpoon.mark').add_file()<CR>", { silent = true })

-- No header
vim.cmd("let g:netrw_banner = 0")

-- Yank into system clipboard
vim.opt.clipboard = "unnamedplus"

-- apply netrw keybindings
vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 'n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(0, 'n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(0, 'n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(0, 'n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
    end
})
