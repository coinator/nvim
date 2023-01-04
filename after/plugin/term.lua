api = vim .api
function AdjustHistFile()
  env = os.getenv("TERM_PROGRAM")
  histfile = os.getenv("HISTFILE")

  if env == "tmux" and histfile ~= "" then
    for token in string.gmatch(histfile, "([^/]+)") do
      filename = token
    end
    if filename ~= ".zsh_history" then
      fcCommand = "fc -p " .. histfile  ..  "\n"
      api.nvim_chan_send(vim.b.terminal_job_id, fcCommand)
      api.nvim_chan_send(vim.b.terminal_job_id, "clear \n")
      print("Correct history file chosen")
    end
  end
end

local termGrp = api.nvim_create_augroup("termGrp", { clear = true })
api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  command = "setlocal nonumber norelativenumber",
-- 	autocmd TermOpen * call AdjustHistFile()
  group = termGrp,
})

