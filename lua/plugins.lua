local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    -- bootstrap lazy.nvim
    -- stylua: ignore
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- Define the plugins
local plugins = {
	-- nvim-cmp
	{
		"hrsh7th/nvim-cmp",
		event = "VeryLazy",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip-integ",
			"hrsh7th/vim-vsnip",
		},
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Copilot
	{
		"github/copilot.vim",
	},

	-- Fashion
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
	},
	{
		"rebelot/kanagawa.nvim",
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
	},

	-- Git stuff
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
	},

	-- Formatter
	{
		"sbdchd/neoformat",
		cmd = { "Neoformat" },
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		event = "BufRead",
	},

	-- Complete parentheses
	{
		"windwp/nvim-autopairs",
	},
	{
		"smjonas/inc-rename.nvim",
	},
	{
		"ThePrimeagen/harpoon",
	},

	-- Indent highlighting
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
}

-- Load the plugins
local lazy_opts = {
	ui = {
		border = "rounded",
		title = "lazy.nvim",
		title_pos = "center",
	},
}

require("lazy").setup(plugins, lazy_opts)

require("gitsigns").setup()
require("inc_rename").setup()
require("nvim-autopairs").setup()
require("ibl").setup()
require("configs.kanagawa")
require("configs.lsp")
require("configs.lualine")
require("configs.nvim-cmp")
require("configs.telescope")
