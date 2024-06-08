local set = vim.keymap.set
local opt = { noremap = true, silent = true }

-- nav
set({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>", { desc = "Navigate Left", silent = true })
set({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>", { desc = "Navigate Right", silent = true })
set({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>", { desc = "Navigate Up", silent = true })
set({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>", { desc = "Navigate Down", silent = true })
set({ "n", "v" }, "H", "^")
set({ "n", "v" }, "L", "g_")

-- use

set({ "n", "v" }, "<localleader>d", function()
  vim.cmd("DiffviewFileHistory %")
end, { desc = "fileHistory" })
set({ "n", "v" }, "<localleader>q", ":q<cr>", opt)
set("n", "<localleader><localleader>", "<cmd>Telescope smart_open<cr>", { desc = "Smart open", noremap = true })
set("n", "<leader><leader>", "<c-^>")
set("n", "<leader>ww", "<CMD>w<CR><ESC>", { desc = "Save File" })
set("n", "<leader>wq", "<CMD>wq<CR>", { desc = "Save File And Quit", silent = true })
set("i", "jk", "<esc>")
set("n", "<leader>dd", LazyVim.ui.bufremove, { desc = "Delete Buffer", silent = true })
set("n", "i", function()
  return string.match(vim.api.nvim_get_current_line(), "%g") == nil and "cc" or "i"
end, { expr = true, noremap = true })
set({ "n", "v" }, "<c-p>", LazyVim.telescope("files", { cwd = false }), opt)

set("n", "<leader>fB", "<cmd>Telescope file_browser<cr>", { desc = "File browser", noremap = true })
set("n", "<leader>fu", "<cmd>Telescope undo<cr>", { desc = "Undo history", noremap = true })
set("n", "<leader>fm", "<cmd>Telescope media_files<cr>", { desc = "Media files", noremap = true })
set("n", "<leader>fs", "<cmd>Telescope smart_open<cr>", { desc = "Smart open", noremap = true })
set("n", "<leader><leader>", "<c-^>")

-- clipboard setting
set("v", "p", "P")
set("v", "P", "p")
set("v", "<leader>y", '"+y')
set("v", "<c-c>", [["+y :call system('clip.exe', @+)<cr>]], opt)
set("i", "<c-v>", "<c-r>+", opt)
set("n", "<c-v>", '"+p', opt)
set("v", "<c-x>", '"+d', opt)
set("n", "<c-x>", '"+dd', opt)
set("n", "dd", '"_dd', opt)
set("v", "d", '"_d', opt)
set("n", "x", '"_x', opt)
set("v", "x", '"_x', opt)
set("n", "<localleader>p", '"+p', opt)
