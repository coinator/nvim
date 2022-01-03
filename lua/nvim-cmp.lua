-- Setup nvim-cmp.
local cmp = require'cmp'

local source = require'cmp_latex_symbols'

local ts_utils = require("nvim-treesitter.ts_utils")
local items = require("cmp_latex_symbols/items")
source.is_available = function()
  if vim.bo.filetype == 'tex' then
    return true
  elseif vim.bo.filetype == 'python' then
    --local node = ts_utils.get_node_at_cursor()
    return true
  end
  return false
end

source.complete = function(self, request, callback)
  if not vim.regex(self.get_keyword_pattern() .. "$"):match_str(request.context.cursor_before_line) then
    return callback()
  end
  if not self.items then
    self.items = items
  end
  local node = ts_utils.get_node_at_cursor()
  if (node:type() == 'string') then 
    callback(self.items)
  end
end
---Register custom source to nvim-cmp.
require('cmp').register_source('custom_latex_symbols', source)

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	mapping = {
		['<C-f>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
	},
	sources = {
		{ name = 'nvim_lsp' },

		{ name = 'ultisnips' },

		{ name = 'nvim_lua' },
		{ name = 'custom_latex_symbols' },
	}
})
