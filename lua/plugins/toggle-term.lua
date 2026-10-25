return
{
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = "ToggleTerm",
  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = [[<c-\>]],
      direction = "horizontal",
      shade_terminals = true,
      start_in_insert = true,
      persist_size = true,
    })
  end
}
