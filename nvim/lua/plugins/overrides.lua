-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "folke/which-key.nvim",
    opts = { window = { border = "rounded" } },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ui = { border = "rounded" },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
      lsp = {
        signature = {
          enabled = false,
          opts = {
            size = {
              max_width = 50,
            },
          },
        },
        hover = {
          enabled = true,
          opts = {
            size = {
              max_width = 50,
            },
          },
        },
      },
    },
  },
  {
    "folke/trouble.nvim",
    opts = function(_, opts)
      opts.focus = true
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      label = {
        uppercase = false,
        rainbow = {
          enabled = true,
          shade = 5,
        },
      },
    },
    {
      "lewis6991/gitsigns.nvim",
      opts = {
        current_line_blame = true,
      },
    },
  },
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
}
