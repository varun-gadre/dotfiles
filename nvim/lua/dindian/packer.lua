vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use 'simrat39/rust-tools.nvim'
  use 'hrsh7th/nvim-cmp' 
  use 'hrsh7th/vim-vsnip'
  use 'rust-lang/rust.vim'
   -- LSP completion source:
  use 'hrsh7th/cmp-nvim-lsp'
  use 'HerringtonDarkholme/yats.vim'
   -- Useful completion sources:
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-path'                              
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-vsnip'
  use 'nvim-treesitter/nvim-treesitter'
  use 'mfussenegger/nvim-dap'
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use "junegunn/fzf"
  use "junegunn/fzf.vim" --fuzzy find search
  use 'kyazdani42/nvim-web-devicons'
  use 'folke/trouble.nvim'
  use {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
  },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
end)

