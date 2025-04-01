local opt = vim.opt

-- backup and swap files
opt.backup = false
opt.undofile = false
opt.swapfile = false
opt.writebackup = false

-- file format
opt.fileformat = "unix"

-- backspace
opt.backspace = "indent,eol,start"

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- split windows
opt.splitright = true
opt.splitbelow = true

-- cursor line
opt.cursorline = true

-- turn on termguicolors
opt.termguicolors = true
opt.background = "light"
opt.signcolumn = "yes"

-- command box height
opt.cmdheight = 2

-- right ruler
opt.colorcolumn = "80"

-- allow modified buffers to be hidden
opt.hidden = true

-- command line menu
opt.wildmenu = true
opt.wildmode = "longest:full,full"

-- completion
opt.completeopt = "longest,menuone,noselect"

-- Set background to light
opt.background = 'light'

-- Define custom colors based on Everforest Light Medium theme
vim.cmd([[highlight Normal guifg=#5c6a72 guibg=#fdf6e3]])
vim.cmd([[highlight Comment guifg=#a6b0a0 gui=italic]])
vim.cmd([[highlight String guifg=#35a77c]])
vim.cmd([[highlight Function guifg=#f85552]])
vim.cmd([[highlight Keyword guifg=#3a94c5]])
vim.cmd([[highlight Type guifg=#8da101]])
vim.cmd([[highlight Constant guifg=#df69ba]])
vim.cmd([[highlight Statement guifg=#8da101]])
vim.cmd([[highlight StatusLine guifg=#4c4f69 guibg=#eae4d2]])
vim.cmd([[highlight StatusLineNC guifg=#859289 guibg=#eae4d2]])

-- Open netrw by default when starting Neovim
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    command = "Lexplore"
})

-- Keep netrw on the left side
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25

