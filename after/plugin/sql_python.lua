local query = vim.treesitter.parse_query(
	"python",
	[[ (
      (string) @string 
      (#match? @string "select|SELECT")
      ) @expression
  ]]
)

local Job = require("plenary.job")

local format_dat_sql = function(bufnr)
	if not bufnr then
		bufnr = vim.api.nvim_get_current_buf()
	end

	local parser = vim.treesitter.get_parser(bufnr, "python", {})
	local tree = parser:parse()[1]

	-- Finds sql-format-via-python somewhere in your nvim config path
	local bin = vim.api.nvim_get_runtime_file("format-sql.py", false)[1]

	local changes = {}
	for id, node, metadata in query:iter_captures(tree:root(), bufnr, 0, -1) do
		local text = vim.treesitter.get_node_text(node, bufnr)
		local split = vim.split(text, "\n")
		--local result = table.concat(vim.list_slice(split, 1, #split - 1), "\n")

		local j = Job:new({
			command = "/home/m/.config/nvim/venv/bin/python",
			args = { bin },
			writer = { text },
		})

		local range = { node:range() }

		local formatted = j:sync()
		local rep = string.rep(" ", range[2])
		for idx, line in ipairs(formatted) do
			if idx > 1 then
				formatted[idx] = rep .. line
			else
				formatted[idx] = line
			end
		end

		table.insert(
			changes,
			1,
			{ start_row = range[1], start_col = range[2], end_row = range[3], end_col = range[4], formatted = formatted }
		)
	end

	for _, change in ipairs(changes) do
		vim.api.nvim_buf_set_text(
			bufnr,
			change.start_row,
			change.start_col,
			change.end_row,
			change.end_col,
			change.formatted
		)
	end
end

vim.api.nvim_create_user_command("SqlMagic", function()
	format_dat_sql()
end, {})
