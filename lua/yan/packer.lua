vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  use {
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
	-- or                            , branch = '0.1.x',
	requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { "catppuccin/nvim", as = "catppuccin", config = function()
		vim.cmd('colorscheme catppuccin-latte')
  	end
  }

  use ({
  "stevearc/conform.nvim", 
  event = {"BufRead", "BufNewFile"},
  config = function()
    local conform = require('conform')  
    conform.setup({
      formatters_by_ft = {
        javascript = {"prettier"},
        typescript = {"prettier"},
        typescriptreact = {"prettier"},
        javascriptreact = {"prettier"},
        json = {"prettier"},
        html = {"prettier"},
        css = {"prettier"},
        scss = {"prettier"},

},
  format_on_save = {
  lsp_fallback = true,
  async = false,
  timeout_ms = 500,
},
    })

    vim.keymap.set({"n", "v"}, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, {desc = "Format code"})
  end,
})

  use({
    "mfussenegger/nvim-lint",
    event = {"BufRead", "BufNewFile"},
    config = function()
      local lint = require('lint')

      lint.linters_by_ft = {
        javascript = {"eslint_d"},
        typescript = {"eslint_d"},
        typescriptreact = {"eslint_d"},
        javascriptreact = {"eslint_d"},
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", {clear = true})



      vim.keymap.set("n", "<leader>l", function()
        lint.try_lint()
      end, {desc = "Lint code"})
    end,
  })

 use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

 use {
	 "williamboman/mason.nvim",
	 "williamboman/mason-lspconfig.nvim",	
	 "neovim/nvim-lspconfig",
	 "hrsh7th/nvim-cmp",
	 "hrsh7th/cmp-nvim-lsp",
	 "hrsh7th/cmp-buffer",
	 "hrsh7th/cmp-path",
	 "hrsh7th/cmp-cmdline",
	 'L3MON4D3/LuaSnip',
	 'saadparwaiz1/cmp_luasnip',
	 "rafamadriz/friendly-snippets",
}

 use("theprimeagen/harpoon")
end)
