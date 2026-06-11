vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)
vim.keymap.set("i", "jk", "<esc>")

vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

vim.keymap.set("n", "<leader>cp", function()
    vim.fn.setreg("*", vim.fn.expand("%:p"))
end, { desc = "Copy current file full path to clipboard" })

vim.keymap.set("n", "<leader>cn", function()
    vim.fn.setreg("*", vim.fn.expand("%:t"))
end, { desc = "Copy current file name to clipboard" })

vim.keymap.set("n", "<leader>t", function()
    vim.fn.setreg("*", vim.cmd("below term"))
end, { desc = "Open below terminal" })

vim.keymap.set("n", "Y", "y$", { desc = "Yank to the end of line" })

vim.keymap.set("v", "<leader>cb", '"+y', { desc = "Copy visual selection to system clipboard" })
vim.keymap.set("n", "cp", "viwP")

vim.keymap.set("i", "{", "{}<Esc>ha")
vim.keymap.set("i", "(", "()<Esc>ha")
vim.keymap.set("i", "[", "[]<Esc>ha")
vim.keymap.set("i", '"', '""<Esc>ha')
vim.keymap.set("i", "'", "''<Esc>ha")
vim.keymap.set("i", "`", "``<Esc>ha")

-- Remove the built-in snippet jump mapping that defaults to <Tab>
-- vim.keymap.del('i', '<Tab>')

-- vim.keymap.set('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '<leader>br', ":exe ':silent !open -a /Applications/Google\\ Chrome.app %'<CR>", { silent = true })

-- Force Tab to do native indentation/spaces directly in Neovim, wiping out plugin listeners
vim.keymap.set('i', '<Tab>', '<Tab>', { noremap = true, silent = true, desc = "Native Tab Indent" })
vim.keymap.set('i', '<S-Tab>', '<S-Tab>', { noremap = true, silent = true, desc = "Native Shift-Tab" })
