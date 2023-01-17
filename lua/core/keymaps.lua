-- set leader key to space
vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- clear search highlights
map("n", "<CR>", ":nohl<CR>")

-- tab & shift tab
map("n", "<Tab>",   ">>_")
map("n", "<S-Tab>", "<<_")
map("i", "<S-Tab>", "<C-D>")
map("v", "<Tab>",   ">gv")
map("v", "<S-Tab>", "<gv")

-- move lines
map("n", "<M-Up>",      ":<C-u>silent! move-2<CR>==")
map("n", "<M-Down>",    ":<C-u>silent! move+<CR>==")
map("x", "<M-Up>",      ":<C-u>silent! '<,'>move-2<CR>gv=gv")
map("x", "<M-Down>",    ":<C-u>silent! '<,'>move'>+<CR>gv=gv")

-- windows save like
map("n", "<C-s>", ":w<CR>")
map("i", "<C-s>", "<Esc>:w<CR>")
map("v", "<C-s>", "<Esc>:w<CR>")

-- windows force quit
map("n", "<M-3>", ":wqa!<CR>")
map("i", "<M-3>", "<Esc>:wqa!<CR>")
map("v", "<M-3>", "<Esc>:wqa!<CR>")
map("n", "<M-4>", ":qa!<CR>")
map("i", "<M-4>", "<Esc>:qa!<CR>")
map("v", "<M-4>", "<Esc>:qa!<CR>")

-- toogle wrap
map("n", "<M-z>", ":set nowrap!<CR>")
map("i", "<M-z>", ":set nowrap!<CR>")

-- switching between windows
map("n", "<C-Left>", "<C-w>h")
map("n", "<C-Right>", "<C-w>l")
map("n", "<C-Up>", "<C-w>k")
map("n", "<C-Down>", "<C-w>j")

-- remove trailing spaces
map("n", "<Leader>t", ":%s/\\s\\+$//e<Bar>:%s/\\r/\\r/ge<Bar>:%s/\\%u00a0/ /ge<CR>:echo 'Invalid chars fixed!'<CR>")
map("n", "<Leader>d", ":%s#\#\\r#g<CR>:echo '^M chars removed'<CR>")

-- plugin key map
map("n", "<F3>", ":NvimTreeToggle<CR>")

-- telescope
map("n", "<Leader>ff", ":Telescope find_files<CR>") -- find files within current working directory, respects .gitignore
map("n", "<Leader>fs", ":Telescope live_grep<CR>") -- find string in current working directory as you type
map("n", "<Leader>fc", ":Telescope grep_string<CR>") -- find string under cursor in current working directory
map("n", "<Leader>fb", ":Telescope buffers<CR>") -- list open buffers in current neovim instance
map("n", "<Leader>fh", ":Telescope help_tags<CR>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
map("n", "<Leader>gc", ":Telescope git_commits<CR>") -- list all git commits (use <CR> to checkout) ["gc" for git commits]
map("n", "<Leader>gfc", ":Telescope git_bcommits<CR>") -- list git commits for current file/buffer (use <CR> to checkout) ["gfc" for git file commits]
map("n", "<Leader>gb", ":Telescope git_branches<CR>") -- list git branches (use <CR> to checkout) ["gb" for git branch]
map("n", "<Leader>gs", ":Telescope git_status<CR>") -- list current changes per file with diff preview ["gs" for git status]
