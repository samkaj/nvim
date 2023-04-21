local api = vim.api
local builtin = require("telescope.builtin")
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fe", function()
  vim.cmd("vsplit")
  vim.cmd("Ex")
end)
vim.keymap.set("n", "<leader>ff", builtin.find_files, {}) -- Search for file
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {}) -- Search for token 

-- Open file in main window


-- Open file in right stack
vim.keymap.set("n", "<leader>v", function()
  builtin.find_files({layout_strategy = "vertical"}, {
    function()
      print("opening new file")
    end
  })
end)

-- Close active file
-- Format on save
