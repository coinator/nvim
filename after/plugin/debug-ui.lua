require("dapui").setup({
  icons = {
    expanded = "▾",
    collapsed = "▸"
  },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = {"<CR>", "<2-LeftMouse>"},
    open = "o",
    remove = "d",
    edit = "e",
  },
  -- sidebar = {
  --   elements = {
  --     -- You can change the order of elements in the sidebar
  --     "scopes",
  --     "stacks",
  --     -- "watches",
  --     "breakpoints",
  --   },
  --   position = "left" -- Can be "left" or "right"
  -- },
  -- tray = {
  --   elements = {
  --     "repl"
  --   },
  --   size = 5,
  --   position = "bottom" -- Can be "bottom" or "top"
  -- },
})

