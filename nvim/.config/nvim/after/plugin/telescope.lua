local builtin = require('telescope.builtin')

require('telescope').setup {
	defaults = {
		file_sorter = require('telescope.sorters').get_fzy_sorter,
		prompt_prefix = ' > ',
		color_devicons = false,

		file_previewer   = require('telescope.previewers').cat.view,
		grep_previewer   = require('telescope.previewers').vimgrep.new,
		qflist_previewer = require('telescope.previewers').qflist.new,
	},
	extensions = {
		fzy = {
			fuzzy = true,
			override_generic_sorter = false,
			override_file_sorter = true,
			case_mode = "smart_case"
		}
	}
}

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fr', builtin.resume, {})
vim.keymap.set('n', '<leader>ps', function() 
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
