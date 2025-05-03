return {
	-- Explorer tree view
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})

			-- Auto-open on startup
			vim.api.nvim_create_autocmd("VimEnter", {
				callback = function()
					require("nvim-tree.api").tree.open()
				end,
			})

			-- Optional keymap
			vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
		end,
	},

	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional for icons
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto", -- or use "everforest" if supported
					section_separators = "",
					component_separators = "",
				},
			})
		end,
	},

	-- Theme
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			-- Set options before applying theme
			vim.g.everforest_background = "medium" -- options: 'soft', 'medium', 'hard'
			vim.g.everforest_enable_italic = 1
			vim.g.everforest_disable_italic_comment = 0
			vim.g.everforest_transparent_background = 1

			vim.cmd("colorscheme everforest")
		end,
	},
}
