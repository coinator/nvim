setlocal wrap spell

nnoremap j gj
nnoremap k gk

augroup latexStuff
  autocmd!
  autocmd BufNewFile,BufRead *.tex set syntax=on
  command CoverLetterTemplate :0r~/.config/nvim/cover.tex
augroup end
