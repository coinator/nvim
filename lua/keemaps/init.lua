set = vim.keymap.set

set({ "n", "v", "o" }, ":", ";")
set({ "n", "v", "o" }, ";", ":")
set({ "n", "v", "o" }, "q;", "q:")

set("n", "<leader>o", "o<Esc>")
set("n", "<leader>O", "O<Esc>")

set("n", "<C-h>", "<C-w>h")
set("n", "<C-j>", "<C-w>j")
set("n", "<C-k>", "<C-w>k")
set("n", "<C-l>", "<C-w>l")

set("i", "<C-^>", "<Esc><C-w>^")

-- avoid inoremap <C-k>, in order to add umlauts
set("t", "gt", "<C-\\><C-N>gt")
set("t", "<C-^>", "<C-\\><C-N><C-^>")

set("n", "<leader>n", ":noh<CR>")

set("n", "<leader>gs", ":Git <CR> G")

-- Send line, file and selection (ipython focused)
set("n", "<leader>cc", ":TREPLSendLine<CR>")
set("n", "<leader>ca", ":TREPLSendFile<CR>")
set("v", "<leader>cc", ":TREPLSendSelection<CR>")

set("n", "<leader>gg", "<CMD>ZenMode<CR>")

set("n", "yx", ":s/x/y/g<CR>")

set("n", "<BS>", "<C-^>")

require("keemaps.telescope-maps")
