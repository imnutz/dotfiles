local builtin = require('telescope.builtin')

require('telescope').setup {
	defaults = {
		prompt_prefix = ' > ',
		color_devicons = false,

		file_previewer   = require('telescope.previewers').cat.view,
		grep_previewer   = require('telescope.previewers').vimgrep.new,
		qflist_previewer = require('telescope.previewers').qflist.new,
	},
}

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fr', builtin.resume, {})
vim.keymap.set('n', '<leader>ps', function() 
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
