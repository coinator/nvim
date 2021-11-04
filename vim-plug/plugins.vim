call plug#begin('~/.vim/plugged')
 
Plug 'airblade/vim-gitgutter'
Plug 'ambv/black'
Plug 'folke/zen-mode.nvim'
Plug 'folke/which-key.nvim'
Plug 'kassio/neoterm'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'lervag/vimtex'
Plug 'lilydjwg/colorizer'
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-dap'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'rcarriga/nvim-dap-ui'
Plug 'vim-test/vim-test'
Plug 'vimwiki/vimwiki'

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'kdheepak/cmp-latex-symbols'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Aesthetic
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()
