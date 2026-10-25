local group = vim.api.nvim_create_augroup("user_config", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = group,
  callback = function(args)
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc })
    end

    map("n", "K", vim.lsp.buf.hover, "LSP Hover")
    map("n", "gd", vim.lsp.buf.definition, "LSP Definition")
    map("n", "gD", vim.lsp.buf.declaration, "LSP Declaration")
    map("n", "gi", vim.lsp.buf.implementation, "LSP Implementation")
    map("n", "gr", vim.lsp.buf.references, "LSP References")
    map("n", "<leader>rn", vim.lsp.buf.rename, "LSP Rename")
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP Code action")
  end,
})
