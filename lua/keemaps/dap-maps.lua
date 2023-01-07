local dap = require("dap")
local set = vim.keymap.set

set("n", "<leader>d", function()
	dap.continue()
end)

set("n", "<leader>s ", function()
	dap.step_over()
end)

set("n", "<leader>si ", function()
	dap.step_into()
end)

set("n", "<leader>so ", function()
	dap.step_out()
end)

set("n", "<leader>b", function()
	dap.toggle_breakpoint()
end)

set("n", "<leader>B", function()
	dap.set_breakpoint(vim.fn.input('Breakpoint condition:", "'))
end)

set("n", "<leader>lp", function()
	dap.set_breakpoint(nil, nil, vim.fn.input('Log point message:", "'))
end)
set("n", "<leader>ro", function()
	dap.repl.open()
end)

set("n", "<leader>rl", function()
	dap.run_last()
end)
