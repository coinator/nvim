require("zen-mode").setup({
  window = {
    width = .42 -- width will be 85% of the editor width
  },
  plugins = {
    tmux = { 
      enabled = true, 
      hide_status = false, 
      hide_other_panes = true 
    }
  }
})
