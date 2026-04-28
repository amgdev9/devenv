require("package-manager")
require("remaps")

require("lazy").setup({
  -- Common 
  { "nvim-mini/mini.icons" },
  { "nvim-telescope/telescope.nvim" },
  { "nvim-lualine/lualine.nvim" },
  { "nvim-treesitter/nvim-treesitter" },
  { "rktjmp/lush.nvim" },
  { "rockyzhang24/arctic.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "stevearc/oil.nvim" },

  -- Coding
  { "Exafunction/windsurf.nvim" },
  { "stevearc/conform.nvim" },
  { "ThePrimeagen/harpoon", branch = "harpoon2" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "nvim-mini/mini.diff" },
  { "neovim/nvim-lspconfig" },
})

-- Common config
require("config")
require("color-scheme")
require("finder")
require("status-bar")
require("treesitter")
require("file-explorer")

-- Coding config
require("git-gutter")
require("ai")
require("format")
require("autocomplete")
require("lsp")
require("harpoon-config")
