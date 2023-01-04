augroup nonEmptyNonWiki
	autocmd!
	autocmd BufRead,BufNewFile **/vimwiki/*.wiki let b:wiki=1
	autocmd BufRead,BufNewFile * call EnableVimwikiNewWindow()
	function! EnableVimwikiNewWindow()
		if !exists("b:wiki")
			let b:indexWiki = bufexists('vimwiki/index.wiki')
			if !b:indexWiki
				nnoremap <buffer> defaultVimwikiWindow :silent !gnome-terminal -- nvim -c 'VimwikiIndex'<CR>
				nmap <silent> <leader>ww defaultVimwikiWindow
			endif
		endif
	endfunction
augroup end
