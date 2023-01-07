local o = vim.opt
local g = vim.g
local api = vim.api

o.compatible = false
o.hidden = true

-- These are defaults now
-- filetype plugin on
-- filetype plugin indent on

g.mapleader = " "
g.maplocalleader = " "

o.number = true
o.relativenumber = true

-- doesn't do anything
o.numberwidth = 1

g.python_host_prog = vim.fn.expand("$HOME/.config/nvim/venv2/bin/python")
g.python3_host_prog = vim.fn.expand("$HOME/.config/nvim/venv/bin/python3")

o.wrap = false
--g.nrformats = vim.g.nrformats + "alpha"

-- case insensitive search and completion
-- for strict case search append \C
o.ignorecase = true

-- watch result of subs, etc as you type
o.inccommand = "nosplit"

o.foldmethod = "indent"
o.foldnestmax = 10
o.foldenable = false
o.foldlevel = 2

g.neoterm_autoscroll = 1
g.neoterm_default_mod = "vertical"

-- When editing a file, always jump to the last known cursor position.
-- Don't do it when the position is invalid, when inside an event handler
-- (happens when dropping a file on gvim) and for a commit message (it's
-- likely a different one than last time).
api.nvim_create_autocmd("BufReadPost", {
	command = [[if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  exe "normal! g`\""
  endif]],
})
