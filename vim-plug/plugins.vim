call plug#begin('~/.vim/plugged')


Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'lervag/vimtex'
Plug 'lilydjwg/colorizer'
Plug 'liuchengxu/vim-which-key'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'puremourning/vimspector'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'

" Themes 
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'


" TODO: Annoying legacy issue
"Plug 'SkyLeach/pudb.vim'

call plug#end()
