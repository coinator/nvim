local dap = require("dap")
dap.adapters.python = {
	type = "executable",
	command = "/home/m/.config/nvim/venv/bin/python",
	args = { "-m", "debugpy.adapter" },
}
dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",

		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

		program = "${file}", -- This configuration will launch the current file if used.
		console = "integratedTerminal",
		pythonPath = function()
			-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
			-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
			-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.

			local venv = vim.fn.getenv("VIRTUAL_ENV")
			if venv ~= vim.NIL then
				return venv .. "/bin/python"
			else
				return "/usr/bin/python3"
			end
		end,
	},
}
