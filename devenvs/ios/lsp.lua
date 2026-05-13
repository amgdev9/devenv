local M = {}

function M.setup_lsp(capabilities)
  vim.lsp.config("sourcekit", { capabilities = capabilities })
  vim.lsp.enable("sourcekit")
end

function M.get_formatters_by_ft()
  return {}
end

return M

