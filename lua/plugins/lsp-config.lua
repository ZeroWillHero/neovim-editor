return{
	{
    		"mason-org/mason.nvim",
    		opts = {},
		config = function()
			require("mason").setup()
		end
	},

	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup ({
    				ensure_installed = { "lua_ls", "ts_ls" }
		})
		end
	},

  -- plugin for the nvim-lspconig

	{
		"neovim/nvim-lspconfig",
	},

  {
  "ms-jpq/coq_nvim",
  branch = "coq",
  init = function()
    vim.g.coq_settings = { auto_start = true }
  end,
  },
  {
    "ms-jpq/coq.artifacts",
     branch = "artifacts",
  },

}
