local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippets = {
	s("lua", {
		-- Simple static text.
		t({ "lua << EOF", "" }),
		i(0),
		t({ "", "EOF" }),
	}),
}

return snippets
