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
	 config = function()
		require("mason").setup()
	 end
}
 
 use("theprimeagen/harpoon")
end)
