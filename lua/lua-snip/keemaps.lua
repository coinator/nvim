local function prequire(...)
local status, lib = pcall(require, ...)
if (status) then return lib end
    return nil
end

local luasnip = prequire('luasnip')
local cmp = prequire("cmp")

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if cmp and cmp.visible() then
        cmp.select_next_item()
    elseif luasnip and luasnip.expand_or_jumpable() then
        return t("<Plug>luasnip-expand-or-jump")
    elseif check_back_space() then
        return t "<Tab>"
    else
        cmp.complete()
    end
    return ""
end
_G.s_tab_complete = function()
    if cmp and cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip and luasnip.jumpable(-1) then
        return t("<Plug>luasnip-jump-prev")
    else
        return t "<S-Tab>"
    end
    return ""
end

--vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
--vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})


--local ls = require('luasnip')
--local cmp = prequire("cmp")
--
--local t = function(str)
--    return vim.api.nvim_replace_termcodes(str, true, true, true)
--end
--
--local check_back_space = function()
--    local col = vim.fn.col('.') - 1
--    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
--        return true
--    else
--        return false
--    end
--end
--
--_G.tab_complete = function()
--    --if cmp and cmp.visible() then
--    --    cmp.select_next_item()
--    --elseif luasnip and luasnip.expand_or_jumpable() then
--    if luasnip and luasnip.expand_or_jumpable() then
--        return t("<Plug>luasnip-expand-or-jump")
--    elseif check_back_space() then
--        return t "<Tab>"
--    else
--        cmp.complete()
--    end
--    return ""
--end
--_G.s_tab_complete = function()
--    if cmp and cmp.visible() then
--        cmp.select_prev_item()
--    elseif luasnip and luasnip.jumpable(-1) then
--        return t("<Plug>luasnip-jump-prev")
--    else
--        return t "<S-Tab>"
--    end
--    return ""
--end
--
--vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("i", "<C-J>", "v:lua.tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("s", "<C-J>", "v:lua.tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
--vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})
----vim.api.nvim_set_keymap("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", { expr=true, noremap=true, silent=true })
----vim.api.nvim_set_keymap("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", { expr=true, noremap=true, silent=true })
----vim.api.nvim_set_keymap("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", {expr=true,  noremap=true, silent=true })
----vim.api.nvim_set_keymap("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", {expr=true,  noremap=true, silent=true })
----
local ls = require('luasnip')

vim.keymap.set({"i", "s"}, "<C-J>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, {})

vim.keymap.set({"i", "s"}, "<C-K>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, {silent = true})

vim.api.nvim_set_keymap("i", "<C-L>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-L>", "<Plug>luasnip-next-choice", {})
