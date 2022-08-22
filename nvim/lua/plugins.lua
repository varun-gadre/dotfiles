return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'williamboman/mason.nvim'    
    use 'williamboman/mason-lspconfig.nvim' 
    use "EdenEast/nightfox.nvim"

    use 'neovim/nvim-lspconfig' 
    use 'simrat39/rust-tools.nvim'
    -- Completion framework:
    use 'hrsh7th/nvim-cmp' 

    -- LSP completion source:
    use 'hrsh7th/cmp-nvim-lsp'
    use 'w0rp/ale'

    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'                             
    use 'hrsh7th/cmp-path'                              
    use 'hrsh7th/cmp-buffer'                            
    use 'hrsh7th/vim-vsnip'
    
    use 'nvim-treesitter/nvim-treesitter'

  end)
