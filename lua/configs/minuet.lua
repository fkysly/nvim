-- Ghost-text completion via xAI Grok. Key is read from env, never from disk.
local base = vim.env.GROK_MODELS_BASE_URL or "https://api.x.ai/v1"
base = base:gsub("/$", "")

local auto_ft = { "python", "lua", "toml", "yaml", "json", "bash" }

require("minuet").setup {
  provider = "openai_compatible",
  request_timeout = 3,
  throttle = 1500,
  debounce = 400,
  n_completions = 1,
  context_window = 8000,
  notify = "warn",
  provider_options = {
    openai_compatible = {
      name = "xAI",
      api_key = function()
        return vim.env.XAI_API_KEY or vim.env.SUB2API_API_KEY or ""
      end,
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
    auto_trigger_ft = auto_ft,
    -- Keep ghost text visible while nvim-cmp is open (pyright pops up a lot).
    show_on_completion_menu = true,
    keymap = {
      accept = "<M-l>",
      accept_line = "<M-j>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<M-e>",
    },
  },
}

-- Minuet only sets auto-trigger on FileType; enable the already-open buffer too.
local function enable_auto_trigger()
  if vim.tbl_contains(auto_ft, vim.bo.filetype) then
    vim.b.minuet_virtual_text_auto_trigger = true
  end
end

enable_auto_trigger()
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
  callback = enable_auto_trigger,
})

if not vim.env.XAI_API_KEY and not vim.env.SUB2API_API_KEY then
  vim.notify("minuet: XAI_API_KEY is not set in this Neovim process; Grok completion will not run", vim.log.levels.WARN)
end
