return {
	-- Pretifier
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"shfmt", -- Bash
					"clang-format", -- C, C++
					"php-cs-fixer", -- PHP
					"prettier", -- JS, TS, HTML, CSS, JSON
					"xmlformatter", -- XML
					"stylua", -- Lua
				},
				auto_update = true,
				run_on_start = true,
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"<leader>f",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				bash = { "shfmt" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				php = { "php_cs_fixer" },
				html = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				xml = { "xmlformat" },
				lua = { "stylua" },
			},
			-- Set default options
			default_format_opts = {
				lsp_format = "fallback",
			},
			-- Set up format-on-save
			format_on_save = { timeout_ms = 500 },
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}
