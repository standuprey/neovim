return {
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true,
        ignored = false,
        sources = {
          explorer = {
            hidden = true,
            ignored = false,
            layout = {
              preset = "sidebar",
              preview = "main", -- This makes preview use the main editor window
            },
            win = {
              list = {
                keys = {
                  -- Open preview in main window and keep focus on explorer
                  ["<S-l>"] = "toggle_preview",
                  -- Or use this to show preview automatically as you navigate
                  -- ["l"] = "show_preview",
                  -- Confirm when you want to actually edit and close explorer
                  ["<CR>"] = "confirm",
                },
              },
            },
          },
        },
      },
    },
  },
}
