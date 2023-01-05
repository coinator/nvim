augroup nonEmptyNonWiki
	autocmd!
	autocmd BufNew **/vimwiki/*.wiki let b:wiki=1
	autocmd BufNew * call EnableVimwikiNewWindow()
	function! EnableVimwikiNewWindow()
		if !exists("b")
			let b:indexWiki = bufexists('vimwiki/index.wiki')
			if !b:indexWiki
				nnoremap <buffer> defaultVimwikiWindow :silent !gnome-terminal -- nvim -c 'VimwikiIndex'<CR>
				nmap <silent> <leader>ww defaultVimwikiWindow
			endif
		endif
	endfunction
augroup end
