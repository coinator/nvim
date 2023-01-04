vim.cmd("source" .. vim.fn.expand("$HOME/.config/nvim/vim-plug/plugins.vim"))
vim.cmd("source" .. vim.fn.expand("$HOME/.config/nvim/general/settings.vim"))
vim.cmd("source" .. vim.fn.expand("$HOME/.config/nvim/general/augroups.vim"))
vim.cmd("source" .. vim.fn.expand("$HOME/.config/nvim/general/keys.vim"))
vim.cmd("source" .. vim.fn.expand("$HOME/.config/nvim/general/vimtex-settings.vim"))
vim.cmd("source" .. vim.fn.expand("$HOME/.config/nvim/general/theme.vim"))
-- source $HOME/.config/nvim/general/lazy-mode.vim

require("lua-snip/init")
--  debug-ui

require("mason").setup()