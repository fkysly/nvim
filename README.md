**NvChad starter config** for LLM training / agent work.

Based on [NvChad/starter](https://github.com/NvChad/starter). Extra language support is Python (pyright + ruff) plus treesitter for toml/yaml/json/markdown/bash.

## New machine

Needs Neovim 0.12+ (`nvim-treesitter` `main` branch).

```bash
git clone git@github.com:fkysly/nvim.git ~/.config/nvim
nvim
```

First launch installs plugins via lazy.nvim. Then:

```
:TSInstallAll
```

If Python LSP is missing: `:MasonInstall pyright ruff` or install `ruff` / `pyright` on PATH.

Grok ghost-text completion reads `XAI_API_KEY` (optional `GROK_MODELS_BASE_URL`). In insert mode: `Option-l` accept, `Option-j` one line, `Option-]` / `Option-[` cycle, `Option-e` dismiss.

Upstream starter: `git remote add upstream https://github.com/NvChad/starter.git`

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's. It made a lot of things easier!
