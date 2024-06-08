return {

  -- git blame
  {
    "FabijanZulj/blame.nvim",
    keys = {
      { "<leader>gb", "<cmd>BlameToggle<cr>", desc = "Toggle Git Blame" },
    },
    config = function()
      require("blame").setup()
    end,
  },
  --bufferline
  {
    "akinsho/bufferline.nvim",
    after = "catppuccin",
    opts = {
      options = {
        themable = true,
        indicator = {
          style = "underline",
        },
      },
    },
    config = function(_, opts)
      opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
      require("bufferline").setup(opts)
    end,
  },
  --bar
  {
    "Bekaboo/dropbar.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },
  {
    "gpanders/editorconfig.nvim",
  },
  {
    "b0o/incline.nvim",
    config = function()
      require("incline").setup()
    end,
    -- Optional: Lazy load Incline
    event = "VeryLazy",
  },
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  "sindrets/diffview.nvim",
}
