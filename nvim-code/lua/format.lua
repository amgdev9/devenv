local conform = require("conform")

local custom_files = vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/custom", [[v:val =~ '\.lua$']])
local all_formatters = {}

for _, file in ipairs(custom_files) do
  local mod = require("custom." .. file:gsub("%.lua$", ""))
  if mod.get_formatters_by_ft then
    local formatters = mod.get_formatters_by_ft()
    for ft, list in pairs(formatters) do
      if not all_formatters[ft] then
        all_formatters[ft] = {}
      end
      vim.list_extend(all_formatters[ft], list)
    end
  end
end

conform.setup({
    formatters_by_ft = all_formatters 
})

function FormatCode()
    conform.format({ 
        async = true,
        lsp_format = "fallback"
    })
end

vim.api.nvim_set_keymap('n', '<leader>i', ':lua FormatCode()<CR>', { noremap = true, silent = true })

