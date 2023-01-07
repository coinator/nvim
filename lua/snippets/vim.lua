local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node

local snippets = {
	s("lua", {
		-- Simple static text.
		t({ "lua << EOF", "" }),
		i(0),
		t({ "", "EOF" }),
	}),
}

return snippets
