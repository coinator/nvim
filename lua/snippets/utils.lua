local queries = require("nvim-treesitter.query")
local ts_utils = require("nvim-treesitter.ts_utils")

M = {}

function M.textobject_at_point(query_string, pos)
	bufnr = vim.api.nvim_get_current_buf()

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

return M
