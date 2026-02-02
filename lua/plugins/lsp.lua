return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          -- Keep vtsls as is, it's working correctly
        },
        eslint = {
          -- Limit eslint to only activate in package.json directories
          root_dir = require("lspconfig.util").root_pattern(
            ".eslintrc.js",
            ".eslintrc.cjs",
            ".eslintrc.json",
            "eslint.config.js",
            "package.json"
          ),
          -- Reduce scope
          settings = {
            workingDirectories = { mode = "auto" },
          },
        },
        tailwindcss = {
          -- Only activate where tailwind config exists
          root_dir = require("lspconfig.util").root_pattern(
            "tailwind.config.js",
            "tailwind.config.ts",
            "tailwind.config.cjs"
          ),
        },
      },
    },
  },
}
