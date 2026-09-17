require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- PyCharm Alt+Enter equivalent: add import for the word under cursor.
map("n", "<leader>i", function()
  vim.lsp.buf.code_action {
    apply = true,
    filter = function(action)
      local title = action.title or ""
      return title:lower():find("import", 1, true) ~= nil
    end,
  }
end, { desc = "LSP add import" })
