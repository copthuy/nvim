return {
	-- Auto pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},

	-- Hightlighter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate", -- Auto-update parsers after install
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"vim",
					"bash",
					"python",
					"javascript",
					"html",
					"css",
					"php",
					"typescript",
					"tsx",
					"c",
					"cpp",
				},
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				-- Optional:
				auto_install = true,
			})
		end,
	},

	-- Pretifier
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier", -- JS, TS, HTML, CSS, JSON
					"stylua", -- Lua
					"clang-format", -- C, C++
					"php-cs-fixer", -- PHP
					"xmlformatter", -- XML
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
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				php = { "php_cs_fixer" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				json = { "prettier" },
				xml = { "xmlformat" },
			},
			-- Set default options
			default_format_opts = {
				lsp_format = "fallback",
			},
			-- Set up format-on-save
			format_on_save = { timeout_ms = 500 },
			-- Customize formatters
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
			},
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}
