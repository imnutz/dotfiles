local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })

vim.keymap.set("n", "<leader>gg", function()
  lazygit:toggle()
end, { desc = "LazyGit" })
