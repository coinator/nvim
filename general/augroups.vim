augroup term
	autocmd!
	autocmd TermOpen * setlocal nonumber norelativenumber
augroup end

augroup tex
	autocmd!
	autocmd BufRead,BufNewFile *.tex setlocal wrap spell
augroup end

augroup python
	autocmd!
	autocmd FileType python set foldmethod=indent foldnestmax=2
augroup end

augroup vwiki
	autocmd!
	autocmd FileType vimwiki set tabstop=2
augroup end
