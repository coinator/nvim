require("zen-mode").setup({
  window = {
    width = .12, -- width will be 85% of the editor width
    options = {
      signcolumn="no",
    }
  },
  plugins = {
    tmux = { 
      enabled = true, 
      hide_status = false, 
      hide_other_panes = true 
    }
  }
})
