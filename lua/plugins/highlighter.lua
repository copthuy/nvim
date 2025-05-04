return {
	-- Hightlighter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate", -- Auto-update parsers after install
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"powershell",
					"c",
					"cpp",
					"python",
					"php",
					"javascript",
					"typescript",
					"html",
					"css",
					"tsx",
					"lua",
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
}
