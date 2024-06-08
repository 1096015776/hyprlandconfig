return {
  --tmux nav
  "alexghergh/nvim-tmux-navigation",
  --theme
  { "navarasu/onedark.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
  --git blame
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },
  --ensure_installed lsp
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "biome",
        "flake8",
        "lua-language-server",
        "shfmt",
        "stylua",
        "vetur-vls",
        "typescript-language-server",
      },
    },
  },
  --embled terminal open file in only one instance
  {
    "samjwill/nvim-unception",
    init = function()
      vim.g.unception_delete_replaced_buffer = true
      vim.g.unception_enable_flavor_text = false
    end,
  },
  --bookmark
  {
    "tomasky/bookmarks.nvim",
    init = function()
      require("bookmarks").setup()
      require("telescope").load_extension("bookmarks")
    end,
  },
  "LunarVim/bigfile.nvim",
  "sindrets/diffview.nvim",
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["<c-f>"] = function(state)
            local node = state.tree:get_node()
            local path = node:get_parent_id()
            if node.type == "directory" then
              path = node:get_id()
            end
            require("neo-tree").close_all()
            require("spectre").open({
              open_cmd = "vnew",
              is_insert_mode = true,
              cwd = path,
              search_text = "",
              is_close = false,
            })
          end,
          ["<c-e>"] = function(state)
            local node = state.tree:get_node()
            local path = node:get_parent_id()
            if node.type == "directory" then
              path = node:get_id()
            end
            require("neo-tree").close_all()
            local term_opts = { cwd = path, esc_esc = false, ctrl_hjkl = false, border = "single" }
            local Util = require("lazyvim.util")
            Util.terminal({ "zsh", "-c", "cd " .. path .. " && ranger" }, term_opts)
          end,
          ["<c-d>"] = function(state)
            local node = state.tree:get_node()
            local path = node:get_parent_id()
            if node.type == "directory" then
              path = node:get_id()
            end
            require("neo-tree").close_all()
            vim.cmd("DiffviewFileHistory " .. path)
          end,
        },
      },
    },
  },
  -- "folke/zen-mode.nvim",
  {
    "Pocco81/true-zen.nvim",
    config = function()
      require("true-zen").setup({})
    end,
  },
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		config = true,
	},
}
