return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        "███╗   ██╗██╗   ██╗██╗███╗   ███╗",
        "████╗  ██║██║   ██║██║████╗ ████║",
        "██╔██╗ ██║██║   ██║██║██╔████╔██║",
        "██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
        "      Modern, fast, and focused      ",
      }

      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file", "<cmd>Telescope find_files<CR>"),
        dashboard.button("g", "  Live grep", "<cmd>Telescope live_grep<CR>"),
        dashboard.button("e", "  File explorer", "<cmd>Neotree toggle<CR>"),
        dashboard.button("t", "  Terminal", "<cmd>ToggleTerm<CR>"),
        dashboard.button("u", "󰚰  Update plugins", "<cmd>Lazy update<CR>"),
        dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
      }

      dashboard.section.footer.val = "Tip: use <Space>ff to find files quickly"
      dashboard.opts.opts.noautocmd = true

      alpha.setup(dashboard.opts)
    end,
  },
}
