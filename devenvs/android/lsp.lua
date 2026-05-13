local M = {}

function M.setup_lsp(capabilities)
  vim.lsp.config("kotlin_lsp", { capabilities = capabilities })
  vim.lsp.enable("kotlin_lsp")
end

function M.get_formatters_by_ft()
  return {}
end

return M

