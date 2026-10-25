local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.showmode = false
opt.termguicolors = true
opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeoutlen = 300
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.ignorecase = true
opt.smartcase = true
opt.completeopt = "menuone,noselect"

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true

opt.fillchars = { eob = " " }

local pyenv_python = vim.fn.expand("~/.config/nvim/pyenv/bin/python")
if vim.fn.executable(pyenv_python) == 1 then
  vim.g.python3_host_prog = pyenv_python
end
