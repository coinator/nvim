local ls = require'luasnip'

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node


-- args is a table, where 1 is the text in Placeholder 1, 2 the text in
-- placeholder 2,...
local function copy(args)
	return args[1]
end

local snippets = {
    -- trigger is `fn`, second argument to snippet-constructor are the nodes to insert into the buffer on expansion.
    s("fn", {
      -- Simple static text.
      t("//Parameters: "),
      -- function, first parameter is the function, second the Placeholders
      -- whose text it gets as input.
      f(copy, 2),
      t({ "", "function " }),
      -- Placeholder/Insert.
      i(1),
      t("("),
      -- Placeholder with initial text.
      i(2, "int foo"),
      -- Linebreak
      t({ ") {", "\t" }),
      -- Last Placeholder, exit Point of the snippet.
      i(0),
      t({ "", "}" }),
    }),

    s("trig", {
      t"text: ", i(1), t{"", "copy: "},
      d(2, function(args)
        -- the returned snippetNode doesn't need a position; it's inserted
        -- "inside" the dynamicNode.
        return sn(nil, {
          -- jump-indices are local to each snippetNode, so restart at 1.
          i(1, args[1])
        })
      end,
      {1})
    })

  }

return snippets
