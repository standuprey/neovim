return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      tsserver = {
        settings = {
          typescript = {
            preferences = {
              importModuleSpecifier = "absolute",
              providePrefixAndSuffixTextForRename = false,
            },
            suggest = {
              completeFunctionCalls = false,
            },
          },
          javascript = {
            preferences = {
              importModuleSpecifier = "absolute",
              providePrefixAndSuffixTextForRename = false,
            },
            suggest = {
              completeFunctionCalls = false,
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
