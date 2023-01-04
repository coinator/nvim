setlocal wrap spell

nnoremap j gj
nnoremap k gk

augroup latexStuff
  autocmd!
  autocmd BufNewFile,BufRead *.tex set syntax=on
  command CoverLetterTemplate :0r~/.config/nvim/cover.tex
augroup end

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_quickfix_mode=2
set conceallevel=2
let g:tex_conceal='abdmg'
let g:vimtex_complete_close_braces=1
let g:vimtex_compiler_latexmk = {
      \ 'build_dir' : '',
      \ 'callback' : 1,
      \ 'continuous' : 1,
      \ 'executable' : 'latexmk',
      \ 'hooks' : [],
      \ 'options' : [
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \   '-shell-escape',
      \   '-f',
      \ ],
      \}
