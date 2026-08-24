vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader><leader>", "<C-^>", {})

vim.keymap.set("i", "jk", "<Esc>", {})

-- copy line into the clipboard
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y", {})

-- copy the whole file into the clipboard
vim.keymap.set("n", "<leader>Y", 'gg"+yG', {})

vim.keymap.set("", "<M-s>", ":split<CR>", {silent = true})
vim.keymap.set("", "<M-v>", ":vsplit<CR>", {silent = true})
vim.keymap.set("", "<M-y>", "<C-w><", {silent = true})
vim.keymap.set("", "<M-u>", "<C-w>-", {silent = true})
vim.keymap.set("", "<M-i>", "<C-w>+", {silent = true})
vim.keymap.set("", "<M-o>", "<C-w>>", {silent = true})

vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})

vim.keymap.set("n", "<C-u>", "<C-u>zz", {})
vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "n", "nzz", {})

vim.keymap.set("n", "<leader>w", ":w<CR>", {})
