set termguicolors

" also need to apt install fonts-powerline
let g:airline_powerline_fonts = 1

let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        hi Normal guibg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_tranparent = 0
    endif
endfunction
"nnoremap <C-t> :call Toggle_transparent()<CR>

colorscheme gruvbox
call Toggle_transparent()
