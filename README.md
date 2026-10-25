# Modern Neovim Configuration

This config is organized for scale with clear modules and modern plugin defaults.

## Structure

- `init.lua` - entrypoint
- `lua/config/options.lua` - core editor options
- `lua/config/keymaps.lua` - custom keymaps
- `lua/config/autocmds.lua` - autocmds and LSP attach mappings
- `lua/config/lazy.lua` - lazy.nvim bootstrap/setup
- `lua/plugins/*.lua` - plugin specs grouped by feature

## Requirements

1. Neovim `>= 0.10` (recommended latest stable)
2. `git`
3. `make` (optional, for telescope fzf native)
4. `ripgrep` (recommended for Telescope live grep)

## First-time setup

1. Start Neovim: `nvim`
2. Plugins auto-install through `lazy.nvim`
3. Mason auto-installs and auto-updates language servers/tools on startup
4. Startup opens a modern dashboard home page with quick actions

Installed language servers:
- `lua_ls`, `ts_ls`, `pyright`, `jsonls`, `bashls`, `marksman`

Installed tools:
- `stylua`, `prettier`, `eslint_d`, `shellcheck`, `shfmt`, `markdownlint`

## Custom keybindings

Leader key: `<Space>`

| Key | Mode | Action |
|---|---|---|
| `<C-h>` `<C-j>` `<C-k>` `<C-l>` | Normal | Move between window splits |
| `<leader>w` | Normal | Save file |
| `<leader>q` | Normal | Quit window |
| `<leader>e` or `<C-n>` | Normal | Toggle Neo-tree explorer |
| `<leader>ff` | Normal | Telescope find files |
| `<leader>fg` | Normal | Telescope live grep |
| `<leader>fb` | Normal | Telescope buffers |
| `<leader>fh` | Normal | Telescope help tags |
| `<leader>hh` | Normal | Open home dashboard |
| `<C-\\>` | Normal/Terminal | Toggle terminal (ToggleTerm) |
| `K` | Normal (LSP buffer) | Hover docs |
| `gd` | Normal (LSP buffer) | Go to definition |
| `gD` | Normal (LSP buffer) | Go to declaration |
| `gi` | Normal (LSP buffer) | Go to implementation |
| `gr` | Normal (LSP buffer) | Find references |
| `<leader>rn` | Normal (LSP buffer) | Rename symbol |
| `<leader>ca` | Normal/Visual (LSP buffer) | Code actions |

## Completion shortcuts (nvim-cmp)

| Key | Action |
|---|---|
| `<C-Space>` | Trigger completion |
| `<CR>` | Confirm selection |
| `<Tab>` / `<S-Tab>` | Next/previous completion item or snippet jump |
| `<C-e>` | Abort completion |

## Important default Neovim shortcuts (unchanged)

| Key | Action |
|---|---|
| `h j k l` | Move cursor |
| `w b e` | Move by words |
| `0 ^ $` | Line navigation |
| `gg` / `G` | Top / bottom of file |
| `dd` / `yy` / `p` | Delete line / yank line / paste |
| `u` / `<C-r>` | Undo / redo |
| `/` / `?` / `n` / `N` | Search and jump next/prev |
| `:%s/old/new/g` | Replace in file |
| `:w` / `:q` / `:wq` | Save / quit / save+quit |
| `<C-w>v` / `<C-w>s` | Vertical / horizontal split |
| `<C-w>w` | Switch split |
| `:help {topic}` | Open help |

## Keeping tools up to date

- `lazy.nvim` checks plugin updates automatically.
- `mason-tool-installer` runs on startup and keeps configured tools updated.
- Manual updates:
  - `:Lazy update`
  - `:MasonUpdate`
  - `:TSUpdate`

## Test the configuration

Run the smoke test file in headless mode:

```bash
nvim --headless -u NONE '+lua dofile("tests/config_smoke_test.lua")' '+qa'
```
