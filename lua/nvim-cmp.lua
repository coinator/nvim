-- Setup nvim-cmp.
local cmp = require'cmp'

local source = require'cmp_latex_symbols'
local ts_utils = require'nvim-treesitter.ts_utils'
local items = require("cmp_latex_symbols/items")

function source:is_available()
  return (vim.bo.filetype == 'tex' or vim.bo.filetype == 'python')
end

function source:complete(request, callback)
  local node = ts_utils.get_node_at_cursor()
  if not vim.regex(self.get_keyword_pattern() .. "$"):match_str(request.context.cursor_before_line) then
    return callback()
  end
  if not self.items then
    self.items = items
  end
  if vim.bo.filetype == 'python' then
    if node:type() == 'string' then
      callback(self.items)
    end
  else
      callback(self.items)
  end
end

require('cmp').register_source('custom_latex_symbols', source.new())

cmp.setup({
	snippet = {
		expand = function(args)
			--vim.fn["UltiSnips#Anon"](args.body)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.

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

		--{ name = 'ultisnips' },
		{ name = 'luasnip' }, -- For luasnip users.


		{ name = 'custom_latex_symbols' },

		{ name = 'nvim_lua' },
	}
})
