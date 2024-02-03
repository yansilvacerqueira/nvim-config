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
}
 
 use("theprimeagen/harpoon")
end)
