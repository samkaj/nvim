--* samkaj's nvim config *--
require("plugins")
require("settings")

-- apply netrw keybindings
vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = netrw_keybindings
})

