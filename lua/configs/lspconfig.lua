require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "ruff" }
vim.lsp.enable(servers)

-- Auto-import in completion (PyCharm-like: pick `os` then import is inserted).
vim.lsp.config("pyright", {
  settings = {
    python = {
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
    },
  },
})

-- Ruff keeps lint/format; pyright owns hover and completion (including auto-import).
vim.lsp.config("ruff", {
  on_attach = function(client, _)
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.completionProvider = false
  end,
})

-- read :h vim.lsp.config for changing options of lsp servers
