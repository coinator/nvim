vim.opt.termguicolors = true
vim.cmd("colorscheme onedark")

-- the vertical bar is used to highlight the space
vim.opt.fillchars = vim.opt.fillchars + "vert: "
-- vim.opt.showtabline = false

vim.g.is_transparent = 0

function Toggle_transparent()
	if vim.g.is_transparent == 0 then
		vim.cmd("hi Normal guibg=NONE")
		vim.g.is_transparent = 1
	else
		vim.opt.background = "dark"
		vim.g.is_transparent = 0
	end
end

Toggle_transparent()
require("notify").setup({
	background_colour = "#000000",
})
