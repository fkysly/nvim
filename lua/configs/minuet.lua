-- Ghost-text completion via xAI Grok. Key is read from env, never from disk.
local base = vim.env.GROK_MODELS_BASE_URL or "https://api.x.ai/v1"
base = base:gsub("/$", "")

require("minuet").setup {
  provider = "openai_compatible",
  request_timeout = 3,
  throttle = 1500,
  debounce = 600,
  n_completions = 1,
  context_window = 8000,
  notify = "error",
  provider_options = {
    openai_compatible = {
      name = "xAI",
      api_key = "XAI_API_KEY",
      end_point = base .. "/chat/completions",
      model = "grok-build-0.1",
      stream = true,
      optional = {
        max_tokens = 96,
        reasoning_effort = "none",
      },
    },
  },
  virtualtext = {
    auto_trigger_ft = { "python", "lua", "toml", "yaml", "json", "bash" },
    show_on_completion_menu = false,
    keymap = {
      accept = "<M-l>",
      accept_line = "<M-j>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<M-e>",
    },
  },
}
