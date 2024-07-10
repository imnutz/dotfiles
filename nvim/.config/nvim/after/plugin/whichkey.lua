require("which-key").register({
  ["<leader>f"] = {
    name = "+file",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    n = { "<cmd>enew<cr>", "New File" },
    b = { "<cmd>Telescope buffers<cr>", "Current Buffers"},
    h = { "<cmd>Telescope search_history<cr>", "Search history"}
  }
})
