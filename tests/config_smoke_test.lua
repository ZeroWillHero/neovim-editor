local root = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h:h")
vim.opt.rtp:prepend(root)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local function assert_true(cond, message)
  if not cond then
    error(message)
  end
end

local function assert_eq(actual, expected, message)
  if actual ~= expected then
    error(string.format("%s (expected: %s, actual: %s)", message, vim.inspect(expected), vim.inspect(actual)))
  end
end

local function has_map(mode, lhs)
  local map = vim.fn.maparg(lhs, mode, false, true)
  return type(map) == "table" and next(map) ~= nil
end

package.loaded["config.options"] = nil
package.loaded["config.keymaps"] = nil
package.loaded["config.autocmds"] = nil

require("config.options")
require("config.keymaps")
require("config.autocmds")

assert_eq(vim.opt.number:get(), true, "number should be enabled")
assert_eq(vim.opt.relativenumber:get(), true, "relative number should be enabled")
assert_eq(vim.opt.expandtab:get(), true, "expandtab should be enabled")
assert_eq(vim.opt.tabstop:get(), 2, "tabstop should be 2")
assert_eq(vim.opt.shiftwidth:get(), 2, "shiftwidth should be 2")
assert_eq(vim.opt.smartindent:get(), true, "smartindent should be enabled")

assert_true(has_map("n", "<C-h>"), "window left map should exist")
assert_true(has_map("n", "<C-l>"), "window right map should exist")
assert_true(has_map("n", "<C-n>"), "neo-tree map should exist")
assert_true(has_map("n", "<leader>ff"), "telescope find files map should exist")
assert_true(has_map("n", "<leader>w"), "save map should exist")
assert_true(has_map("n", "<leader>hh"), "home dashboard map should exist")

local user_autocmds = vim.api.nvim_get_autocmds({ group = "user_config" })
assert_true(#user_autocmds >= 2, "user_config augroup should have autocmds")

local has_yank = false
local has_lsp_attach = false
for _, autocmd in ipairs(user_autocmds) do
  if autocmd.event == "TextYankPost" then
    has_yank = true
  elseif autocmd.event == "LspAttach" then
    has_lsp_attach = true
  end
end

assert_true(has_yank, "TextYankPost autocmd should exist")
assert_true(has_lsp_attach, "LspAttach autocmd should exist")

local plugin_modules = {
  "plugins.lsp-config",
  "plugins.lualine",
  "plugins.neotree",
  "plugins.telescope",
  "plugins.toggle-term",
  "plugins.treesitter",
  "plugins.vscode-color-theme",
  "plugins.gitsigns",
  "plugins.which-key",
  "plugins.dashboard",
}

for _, module_name in ipairs(plugin_modules) do
  local ok, spec = pcall(require, module_name)
  assert_true(ok, "plugin module should load: " .. module_name)
  assert_true(type(spec) == "table", "plugin module should return a table: " .. module_name)
  assert_true(next(spec) ~= nil, "plugin module should not be empty: " .. module_name)
end

print("config_smoke_test: OK")
