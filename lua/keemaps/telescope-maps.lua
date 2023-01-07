local set = vim.keymap.set
local builtin = require("telescope.builtin")

set("n", "<C-p>", function()
	builtin.find_files({
		find_command = { "ag", "--hidden", "--ignore=venv", "--ignore=.git", "-g", "" },
	})
end)

set("n", "<leader>tt", function()
	builtin.live_grep()
end)

set("n", "<leader>ls", function()
	builtin.buffers()
end)

set("n", "<leader>rw", function()
	builtin.grep_string()
end)
