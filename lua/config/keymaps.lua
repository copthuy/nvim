-- set leader key to space
vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- clear search highlights
map("n", "<CR>", ":nohl<CR>")

-- tab & shift tab
map("n", "<Tab>", ">>_")
map("n", "<S-Tab>", "<<_")
map("i", "<S-Tab>", "<C-D>")
map("v", "<Tab>", ">gv")
map("v", "<S-Tab>", "<gv")

-- move lines
map("n", "<M-Up>", ":<C-u>silent! move-2<CR>==")
map("n", "<M-Down>", ":<C-u>silent! move+<CR>==")
map("x", "<M-Up>", ":<C-u>silent! '<,'>move-2<CR>gv=gv")
map("x", "<M-Down>", ":<C-u>silent! '<,'>move'>+<CR>gv=gv")

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

-- Open Lazy with <Leader>l
map("n", "<Leader>l", ":Lazy<CR>")

-- Open Mason with <Leader>m
map("n", "<Leader>m", ":Mason<CR>")

-- TreeView
map("n", "<leader>e", ":NvimTreeToggle<CR>")
