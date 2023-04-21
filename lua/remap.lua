local api = vim.api
local builtin = require("telescope.builtin")
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fe", function()
  vim.cmd("vsplit")
  vim.cmd("Ex")
end)
vim.keymap.set("n", "<leader>ff", builtin.find_files, {}) -- Search for file
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {}) -- Search for token 
-- Use main window and secondary stack
function open_from_ex()
  local num_win = #vim.fn.getwininfo()
  if vim.fn.mode() == "c" then
  elseif num_win == 1 then
    vim.cmd("vsplit")
    vim.cmd("wincmd l")
  elseif num_win > 2 then
    vim.cmd("wincmd L")
    vim.cmd("split")
    vim.cmd("wincmd k")
  end
end

api.nvim_create_autocmd(
  "WinEnter",
  { 
    callback = function()
      if vim.fn.mode() ~= "c" then -- check if not in Ex mode
        open_from_ex()
      end
    end,
  }
)



-- Open file in main window
vim.keymap.set("n", "<leader>ol", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local filetype = vim.bo.filetype

  vim.cmd("tabnew | leftabove vsplit")
  vim.fn.setbufvar(bufnr, "&filetype", filetype)
  vim.cmd("wincmd p")
  vim.cmd("tabn")
end)

-- Close active file
-- Format on save
