require'nvim-treesitter.configs'.setup {
  ensure_installed = {"python", "lua", "sql"},
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
