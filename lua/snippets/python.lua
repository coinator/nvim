local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local c = ls.choice_node
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local f = ls.function_node

local fmt = require("luasnip.extras.fmt").fmt

-- local utils = require'nvim-treesitter.textobjects.shared'
local utils = require("snippets.utils")

local function split_snippet_nodes(args)
	local params = t("")
	args = args:gsub("^self, ", "")
	args = args:gsub("^self$", "")
	args = args:gsub("^cls, ", "")
	args = args:gsub("^cls$", "")
	if #args > 0 then
		-- Strip self for methods, no regxep in lua
		params = { t({ "Arguments:", "" }) }
		for n, splits in pairs(utils.split(args, ",")) do
			splits = splits:gsub("%s+", "")
			params[#params + 1] = t("\t\t" .. splits .. ": ")
			params[#params + 1] = i(n)
			params[#params + 1] = t({ "", "" })
		end
	end
	return params
end

local function check_if_class_and_vars(args, parent)
	local self_or_cls = "self"
	local line = tonumber(parent["env"]["TM_LINE_NUMBER"])

	local classobject = utils.textobject_at_point("@class.outer", { line - 1, 1 })
	local decorator, decorator_name = utils.check_for_node({ line - 1, 1 })

	if decorator then
		if decorator_name == "@classmethod" then
			self_or_cls = "cls"
		end
	end
	if classobject ~= nil and decorator_name ~= "@staticmethod" then
		return { t(self_or_cls), c(1, {
			{ t(", "), i(1) },
			{ t(""), t("") },
		}) }
	end
	return { t(""), i(1) }
end

local function_snippet = s(
	"def",
	fmt(
		[[
def {}({}){}:
    """
    {}

    {}
    Returns:
        {}
    """
    {}
		]],
		{
			i(1, "function"),
			d(2, function(args, parent)
				return sn(nil, check_if_class_and_vars(args, parent))
			end, { 1 }),
			c(3, {
				{ t(" -> "), i(1) },
				{ t("") },
			}),
			i(4, "Doc"),
			d(5, function(args)
				-- the returned snippetNode doesn't need a position; it's inserted
				-- "inside" the dynamicNode.
				return sn(
					nil, -- jump-indices are local to each snippetNode, so restart at 1.
					split_snippet_nodes(args[1][1])
				)
			end, { 2 }),
			i(6, "Args"),
			i(7),
		}
	)
)

local new_header_snippet = s("hea", {
	t("####"),
	i(1, "header"),
	-- order is 2,1, not 1,2!!
	f(function(args, snip)
		--here
		return string.rep("#", 80 - #args[1][1])
	end, { 1 }),
	t({ "", "" }),
	i(2),
})

local snippets = {
	function_snippet,
	new_header_snippet,
}

return snippets
