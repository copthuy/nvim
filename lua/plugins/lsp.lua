return {
	-- LSP config
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local servers = {
				"bashls", -- Bash
				"powershell_es", -- PowerShell
				"clangd", -- C/C++
				"phpactor", -- PHP
				"html", -- HTML
				"ts_ls", -- JavaScript/TypeScript
				"cssls", -- CSS
				"lemminx", -- XML
				"jsonls", -- JSON
				"emmet_ls", -- Emmet
			}
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = servers,
			})

			local lspconfig = require("lspconfig")
			for _, server in ipairs(servers) do
				lspconfig[server].setup({})
			end

			-- Go to definition
			lspconfig.ts_ls.setup({
				on_attach = function(client, bufnr)
					-- Set up your key mappings for go to definition, etc.
					vim.api.nvim_buf_set_keymap(
						bufnr,
						"n",
						"gd",
						"<Cmd>lua vim.lsp.buf.definition()<CR>",
						{ noremap = true, silent = true }
					)
				end,
			})

			-- Emmet config
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			lspconfig.emmet_ls.setup({
				-- on_attach = on_attach,
				capabilities = capabilities,
				filetypes = {
					"css",
					"html",
					"php",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
				},
				init_options = {
					html = {
						options = {
							-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
							["bem.enabled"] = true,
						},
					},
				},
			})
		end,
	},

	-- Autocompletion engine
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				completion = {
					autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
					keyword_length = 1,
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-e>"] = cmp.mapping.abort(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},
}
