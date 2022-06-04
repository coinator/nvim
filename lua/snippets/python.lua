local ls = require'luasnip'

local s = ls.snippet
local sn = ls.snippet_node
local c = ls.choice_node
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local f = ls.function_node

local fmt = require('luasnip.extras.fmt').fmt


local ts_util = require'nvim-treesitter.textobjects.shared'


function split(inputstr, sep)
   if sep == nil then
      sep = "%s"
   end
   local tab={}
   for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
      table.insert(tab, str)
   end
   return tab
end

function split_snippet_nodes(args)
  local params = t("")
  args = args:gsub("^self, ", "")
  args = args:gsub("^self$", "")
  if #args > 0 then
    -- Strip self for methods, no regxep in lua
    params = {t({"Arguments:", ""})}
    for n, s in pairs(split(args, ',')) do
      s = s:gsub("%s+", "")
      params[#params + 1] = t("\t\t" .. s .. ": ")
      params[#params + 1] = i(n)
      params[#params + 1] = t({"", "" })
    end
  end
  return params
end

function check_if_class_and_vars(args, parent)
  local line = tonumber(parent["env"]["TM_LINE_NUMBER"])

  local _, textobject = ts_util.textobject_at_point(
    "@class.outer",
    {line -1, 1},
    nil,
    { lookahead = false, lookbehind = true }
  )
  if textobject ~= nil then
      return {t("self"), c(1, {
	{t(", "), i(1)},
	{t(""), t("")}
       })}
  end
  return {t(""), i(1)}
end

local function_snippet = s("def", fmt(
     [[
def {}({}):
    """
    {}

    {}
    Returns:
        {}
    """
    {}
    ]],
    {i(1, "function"), 
        d(2, function(args, parent)
	  return sn(nil,
	    check_if_class_and_vars(args, parent)
	    )
	  end,
	  {1}),
        i(3, "Doc"),
    	d(4, function(args)
			-- the returned snippetNode doesn't need a position; it's inserted
			-- "inside" the dynamicNode.
			return sn(nil, -- jump-indices are local to each snippetNode, so restart at 1.
			  split_snippet_nodes(args[1][1])

			)
		end,
	{2}),
   i(5, "Args"), i(6)}))

local new_header_snippet = s("hea", {
        t("####"),
        i(1, "header"),
        -- order is 2,1, not 1,2!!
        f(function(args, snip)
            --here
	  return string.rep("#", 80 - #args[1][1])
        end, {1} ),
	t({"", ""}),
        i(2)})

local snippets = {
  function_snippet,
  new_header_snippet
  }

return snippets
