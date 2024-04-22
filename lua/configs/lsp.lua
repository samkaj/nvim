local fn = vim.fn
local api = vim.api
local keymap = vim.keymap
local lsp = vim.lsp
local diagnostic = vim.diagnostic

executable = function(cmd)
	return fn.executable(cmd) == 1
end

api.nvim_create_autocmd("CursorHold", {
	buffer = bufnr,
	callback = function()
		local float_opts = {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			border = "rounded",
			source = "always",
			prefix = " ",
		}

		if not vim.b.diagnostics_pos then
			vim.b.diagnostics_pos = { nil, nil }
		end

		local cursor_pos = api.nvim_win_get_cursor(0)
		if
			(cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
			and #diagnostic.get() > 0
		then
			diagnostic.open_float(nil, float_opts)
		end

		vim.b.diagnostics_pos = cursor_pos
	end,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

if executable("clangd") then
	lspconfig.clangd.setup({
		on_attach = custom_attach,
		capabilities = capabilities,
		filetypes = { "c", "cpp", "cc", "h", "hpp" },
		flags = {
			debounce_text_changes = 500,
		},
	})
end

if executable("rust-analyzer") then
	lspconfig.rust_analyzer.setup({
		on_attach = custom_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 500,
		},
	})
end

if executable("pyright") then
	lspconfig.pyright.setup({
		on_attach = custom_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 500,
		},
	})
end

if executable("lua-language-server") then
	lspconfig.lua_ls.setup({
		on_attach = custom_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 500,
		},
	})
end

if executable("jdtls") then
	lspconfig.jdtls.setup({
		on_attach = custom_attach,
		capabilities = capabilities,
		filetypes = { "java" },
		flags = {
			debounce_text_changes = 500,
		},
	})
end
