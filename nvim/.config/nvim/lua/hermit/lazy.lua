-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local plugins = {
  -- Packer can manage itself
  'nvim-tree/nvim-web-devicons',
  'echasnovski/mini.icons',

  {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.2',
      -- or                            , branch = '0.1.x',
      dependencies = { { 'nvim-lua/plenary.nvim' } }
  },

  { 'nvim-treesitter/nvim-treesitter', branch = 'master', lazy = false, build = ':TSUpdate' },
  'ThePrimeagen/harpoon',
  'mbbill/undotree',
  'tpope/vim-fugitive',
  {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      dependencies = {
          -- LSP Support
          { 'neovim/nvim-lspconfig' },             -- Required
          { 'williamboman/mason.nvim' },           -- Optional
          { 'williamboman/mason-lspconfig.nvim' }, -- Optional

          -- Autocompletion
          { 'hrsh7th/nvim-cmp' },     -- Required
          { 'hrsh7th/cmp-nvim-lsp' }, -- Required
          { 'hrsh7th/cmp-buffer' },   -- Required
          { 'L3MON4D3/LuaSnip' },     -- Required
      }
  },
  'tpope/vim-vinegar',
  'morhetz/gruvbox',
  { "akinsho/toggleterm.nvim",         version = "*",     config = true },
  {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
  },

  'lukas-reineke/indent-blankline.nvim',
  'numToStr/Comment.nvim',
  {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
      },
      keys = {
          {
              "<leader>?",
              function()
                  require("which-key").show({ global = false })
              end,
              desc = "Buffer Local Keymaps (which-key)",
          },
      },
  },
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = 'default' },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = false } },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  }
}

require("lazy").setup(plugins)
