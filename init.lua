vim.cmd("source" .. vim.fn.expand("$HOME/.config/nvim/vim-plug/plugins.vim"))
require("settings")
vim.cmd("source" .. vim.fn.expand("$HOME/.config/nvim/general/augroups.vim"))
vim.cmd("source" .. vim.fn.expand("$HOME/.config/nvim/general/keys.vim"))
vim.cmd("source" .. vim.fn.expand("$HOME/.config/nvim/general/vimtex-settings.vim"))
require("theme")
-- source $HOME/.config/nvim/general/lazy-mode.vim

-- require("lua-snip/init")
--  debug-ui

require("mason").setup()
