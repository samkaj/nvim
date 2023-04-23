vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer 
  use 'wbthomason/packer.nvim'
  -- Telescope fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Complete brackets and stuff
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end
  }

  -- GitHub colors
  use { 'projekt0n/github-nvim-theme', tag = 'v0.0.7',
  config = function()
    require('github-theme').setup({
      transparent = true
    })
  end
  }

-- Git stuff
use "tpope/vim-fugitive"

-- LSP stuff
use {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig"
}

-- Auto completions
use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
use 'natebosch/vim-lsc'
use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
use 'L3MON4D3/LuaSnip' -- Snippets plugin

-- Formatters
use 'sbdchd/neoformat'
end)