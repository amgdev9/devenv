-- Common config
require("package-manager")
require("config")
require("remaps")
require("color-scheme")
require("finder")
require("status-bar")
require("treesitter")

require("lazy").setup({
  -- Common 
  { "nvim-mini/mini.icons" },
  { "nvim-telescope/telescope.nvim" },
  { "nvim-lualine/lualine.nvim" },
  { "nvim-treesitter/nvim-treesitter" },
  { "rktjmp/lush.nvim" },
  { "rockyzhang24/arctic.nvim" },
  { "nvim-lua/plenary.nvim" },

  -- Coding
  { "Exafunction/windsurf.nvim" },
  { "stevearc/oil.nvim" },
  { "stevearc/conform.nvim" },
  { "ThePrimeagen/harpoon", branch = "harpoon2" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "nvim-mini/mini.diff" },
  { "neovim/nvim-lspconfig" },
})

-- Coding config
require("file-explorer")
require("git-gutter")
require("ai")
require("format")
require("autocomplete")
require("lsp")
require("harpoon-config")
