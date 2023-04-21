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

	-- LSP stuff
  -- https://github.com/williamboman/mason.nvim#setup
	use {
		"williamboman/mason.nvim",
		run = ":MasonUpdate" -- :MasonUpdate updates registry contents
	}
end)
