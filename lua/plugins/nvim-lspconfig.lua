return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      tsserver = {
        settings = {
          typescript = {
            preferences = {
              importModuleSpecifier = "absolute",
              -- Disable snippet completions
              providePrefixAndSuffixTextForRename = false,
            },
          },
          javascript = {
            preferences = {
              importModuleSpecifier = "absolute",
              providePrefixAndSuffixTextForRename = false,
            },
          },
        },
        capabilities = {
          textDocument = {
            completion = {
              completionItem = {
                snippetSupport = false,
              },
            },
          },
        },
      },
    },
  },
}
