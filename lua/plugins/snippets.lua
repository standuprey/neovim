return {
  -- Disable friendly-snippets
  {
    "rafamadriz/friendly-snippets",
    enabled = false,
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("snippets.init")
    end,
  },
}
