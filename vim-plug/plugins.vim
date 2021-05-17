call plug#begin('~/.vim/plugged')
 
 
Plug 'folke/zen-mode.nvim'
Plug 'kassio/neoterm'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'lervag/vimtex'
Plug 'lilydjwg/colorizer'
Plug 'liuchengxu/vim-which-key'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'vim-test/vim-test'
Plug 'vimwiki/vimwiki'

" Aesthetic
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()
