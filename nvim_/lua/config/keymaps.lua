-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local Util = require("lazyvim.util")
map("i", "jk", "<esc>")
-- map("v", "<c-c>", '"*y')
vim.api.nvim_set_keymap("v", "<c-c>", [["+y :call system('clip.exe', @+)<cr>]], { noremap = true, silent = true })

-- tmux
local nvim_tmux_nav = require("nvim-tmux-navigation")
map("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
map("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
map("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
map("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
map("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
map("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
local term_opts = { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false, border = "single" }

-- use ranger open file
map("n", "<localleader>e", function()
  Util.terminal({ "ranger" }, term_opts)
end, { desc = "ranger" })
map("n", "<localleader>g", function()
  Util.terminal({ "lazygit" }, term_opts)
end, { desc = "lazygit" })
map("n", "<leader>%", "<c-w>v", { desc = "| window" })
map("n", '<leader>"', "<c-w>s", { desc = "- window" })
map("n", "<localleader>q", "<c-w>q", { desc = "close window" })
map("n", "<localleader>/", function()
  require("spectre").toggle()
end, { desc = "toggle search" })
--bookmark map
map("n", "mm", require("bookmarks").bookmark_toggle, { desc = "bookmark toggle" })
map("n", "mi", require("bookmarks").bookmark_ann, { desc = "bookmark annonte" })
map("n", "mc", require("bookmarks").bookmark_clean, { desc = "bookmark clean" }) -- clean all marks in local buffer
map("n", "mn", require("bookmarks").bookmark_next, { desc = "bookmark next" }) -- jump to next mark in local buffer
map("n", "mp", require("bookmarks").bookmark_prev, { desc = "bookmark prev" }) -- jump to previous mark in local buffer
map("n", "ml", require("bookmarks").bookmark_list, { desc = "bookmark list" }) -- show marked file list in quickfix window
map("n", "<leader>m", function()
  vim.cmd("Telescope bookmarks list")
end, { desc = "bookmark telescope" }) -- show marked file list in quickfix window

-- line jump
map({ "n", "v" }, "H", "^")
map({ "n", "v" }, "L", "g_")

map("n", "<c-g>", function()
  Util.terminal({ "lazygit" }, term_opts)
end, { noremap = true, silent = true })
map("n", "<localleader>r", function()
  Util.terminal({ "zsh" }, term_opts)
end, { noremap = true, silent = true, desc = "shell" })
map({ "n", "v" }, "<c-p>", function()
  vim.cmd("Telescope find_files")
end, {
  noremap = true,
  silent = true,
  desc = "find_files",
})
map("v", "p", "P")
map("v", "P", "p")
map("i", "<c-e>", function()
  vim.api.nvim_put({ vim.fn.getreg("0") }, "c", false, true)
end)
map("v", "<leader>y", '"*y')
map("n", "<leader>p", '"*p')
map("n", "<2-LeftMouse>", function()
  -- 将光标所在单词转义后设为搜索模式，并高亮匹配项
  vim.fn.setreg("/", "\\V\\<" .. vim.fn.escape(vim.fn.expand("<cword>"), "\\") .. "\\>")
  vim.api.nvim_command("set hls")
  -- 将光标所在单词复制到系统剪贴板
  vim.fn.setreg("+", vim.fn.expand("<cword>"))
end, { silent = true })
map("n", "<leader>zn", ":TZNarrow<CR>", {silent=true})
map("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {silent=true})
map("n", "<leader>zf", ":TZFocus<CR>", {silent=true})
map("n", "<leader>zm", ":TZMinimalist<CR>", {silent=true})
map("n", "<leader>za", ":TZAtaraxis<CR>", {silent=true})
