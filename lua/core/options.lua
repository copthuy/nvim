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
