local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
    return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
    open_on_setup = true,
    open_on_setup_file = true,
    view = {
        side = "left",
        width = 30,
    },
    filters = {
        custom = {
            ".git",
            ".gitignore",
            "node_modules",
            "package-lock.json",
        }
    }
})

