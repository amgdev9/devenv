vim.api.nvim_create_user_command("LLMConnect", function()
  require("llm").setup({
    backend = "openai",
    url = "http://localhost:8012",
    model = "qwen-1.5b",
    tokens_to_clear = {
        "<|endoftext|>",
        "<|fim_pad|>",
        "<|file_separator|>"
    },
    context_window = 4096,
    request_body = {
      temperature = 0.2,
      top_p = 0.95,
      max_tokens = 64,
    },
    fim = {
      enabled = true,
      prefix = "<|fim_prefix|>",
      middle = "<|fim_middle|>",
      suffix = "<|fim_suffix|>",
    },
    debounce_ms = 150,
    accept_keymap = "<Tab>",
    dismiss_keymap = "<S-Tab>",
    enable_suggestions_on_startup = true,
    enable_suggestions_on_files = "*"
  })

  vim.notify("Connected to local LLM configuration", vim.log.levels.INFO)
end, {
  desc = "Connect to local llama.cpp server",
})

vim.api.nvim_create_user_command("LLMDisconnect", function()
  local client = vim.lsp.get_clients({ name = "llm-ls" })[1]

  if not client then
    vim.notify("LLM is not connected", vim.log.levels.WARN)
    return
  end

  vim.lsp.stop_client(client.id)
  vim.notify("LLM disconnected", vim.log.levels.INFO)
end, {
  desc = "Disconnect from local LLM",
})
