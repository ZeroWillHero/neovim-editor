require("config.lazy")
vim.g.python3_host_prog = vim.fn.expand("~/.config/nvim/pyenv/bin/python")
-- configurations 
-- keymappings
vim.keymap.set("n", "<C-h>", "<C-w>h") -- go left (Neo-tree)
vim.keymap.set("n", "<C-l>", "<C-w>l") -- go right (editor)
  -- keymaps for the labguage server 
vim.keymap.set('n','K', vim.lsp.buf.hover, {})
vim.keymap.set('n','gd',vim.lsp.buf.definition,{})
vim.keymap.set({'n','v'}, '<leader>ca' ,vim.lsp.buf.code_action,{})

-- common configs
vim.opt.relativenumber = true
vim.lsp.config("lua_ls",{})
vim.lsp.enable("lua_ls")

-- indentation settings 
vim.opt.tabstop = 2        -- how many spaces a tab shows as
vim.opt.shiftwidth = 2     -- spaces used for auto-indent
vim.opt.expandtab = true   -- convert tabs to spaces
vim.opt.smartindent = true -- smart auto indentation

-- Theme data 
vim.cmd.colorscheme "vscode"
vim.o.background = 'dark'
vim.opt.fillchars = { eob = " " }

-- LSP setups 
vim.lsp.enable("ts_ls")

-- setup and use auto completion with the LSP 
local coq = require("coq")

vim.lsp.config("ts_ls", {
  capabilities = coq.lsp_ensure_capabilities(),
})
