-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local map = vim.keymap.set
map("n", "<leader><leader>", "<c-^>")
map({ "n", "v" }, "<localleader>d", function()
  vim.cmd("DiffviewFileHistory %")
end, { desc = "fileHistory" })
