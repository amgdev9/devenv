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
    enable_suggestions_on_startup = false,
    enable_suggestions_on_files = "*"
})

