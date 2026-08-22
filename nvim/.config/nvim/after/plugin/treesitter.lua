require('nvim-treesitter').install({ "c", "lua", "vim", "javascript", "typescript", "ruby", "vimdoc", "query" })

-- start treesitter highlighting for any buffer that has a parser installed;
-- vim.treesitter.start() is a no-op (errors, hence pcall) when there is none.
vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})
