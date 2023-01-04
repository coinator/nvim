vim.cmd("source" .. vim.fn.expand("$HOME/.config/nvim/vim-plug/plugins.vim"))
require("settings")
vim.cmd("source" .. vim.fn.expand("$HOME/.config/nvim/general/vimtex-settings.vim"))
require("theme")
require("keemaps")

require("lua-snip/init")

-- require("mason").setup()
--  debug-ui
-- source $HOME/.config/nvim/general/lazy-mode.vim
