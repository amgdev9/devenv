-- Common config
require("package-manager")
require("config")
require("remaps")
require("treesitter")
require("color-scheme")
require("finder")
require("status-bar")

require("lazy").setup({
  -- Common 
  { "nvim-mini/mini.icons" },
  { "nvim-telescope/telescope.nvim" },
  { "nvim-lualine/lualine.nvim" },
  { "nvim-treesitter/nvim-treesitter" },
  { "rktjmp/lush.nvim" },
  { "rockyzhang24/arctic.nvim" },
  { "nvim-lua/plenary.nvim" },

  -- Debugger
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui" },
  { "nvim-neotest/nvim-nio" },
})

-- Debugger config
require("debugger")
require("adapters")
require("configs")
