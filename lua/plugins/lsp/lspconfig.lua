-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

local map = vim.keymap
local opts = { noremap=true, silent=true }
map.set('n', '<Leader>e', vim.diagnostic.open_float, opts)
map.set('n', '[d', vim.diagnostic.goto_prev, opts)
map.set('n', ']d', vim.diagnostic.goto_next, opts)
map.set('n', '<Leader>q', vim.diagnostic.setloclist, opts)

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    map.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    map.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    map.set('n', 'K', vim.lsp.buf.hover, bufopts)
    map.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    map.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    map.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    map.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    map.set('n', '<Leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    map.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
    map.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
    map.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
    map.set('n', 'gr', vim.lsp.buf.references, bufopts)
    map.set('n', '<Leader>f', vim.lsp.buf.formatting, bufopts)
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure html server
lspconfig["html"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- configure typescript server with plugin
lspconfig["tsserver"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"},
    root_dir = function() return vim.loop.cwd() end,
})

-- configure css server
lspconfig["cssls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- configure php server
lspconfig["intelephense"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = function() return vim.loop.cwd() end,
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "html", "php", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
})

require('fidget').setup()
