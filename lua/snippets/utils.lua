local queries = require("nvim-treesitter.query")
local ts_utils = require("nvim-treesitter.ts_utils")

local M = {}

function M.textobject_at_point(query_string, pos)
	local bufnr = vim.api.nvim_get_current_buf()

	local row, col = unpack(pos)
	row = row - 1

	local matches = queries.get_capture_matches_recursively(bufnr, query_string, "textobjects")

	local match_length
	local smallest_range
	local earliest_start

	for _, m in pairs(matches) do
		if m.node and ts_utils.is_in_node_range(m.node, row, col) then
			local length = ts_utils.node_length(m.node)
			if not match_length or length < match_length then
				smallest_range = m
				match_length = length
			end
			-- for nodes with same length take the one with earliest start
			if match_length and length == smallest_range then
				local start = m.start
				if start then
					local _, _, start_byte = m.start.node:start()
					if not earliest_start or start_byte < earliest_start then
						smallest_range = m
						match_length = length
						earliest_start = start_byte
					end
				end
			end
		end
	end

	if smallest_range then
		return { smallest_range.node:range() }, smallest_range.node
	end
end

function M.check_for_node(pos)
	local fun_row, col = unpack(pos)

	local parser = vim.treesitter.get_parser()
	local tree = parser:parse()[1]

	local query = vim.treesitter.parse_query("python", "(decorator) @decorator")
	for _, node in query:iter_captures(tree:root(), 0) do
		local row1, _ = node:range() -- range of the capture
		if fun_row - 1 == row1 then
			return true, vim.treesitter.get_node_text(node, 0)
		end
	end
	return false, nil
end

function M.split(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local tab = {}
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		table.insert(tab, str)
	end
	return tab
end

return M
