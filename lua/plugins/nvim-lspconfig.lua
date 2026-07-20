return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
          "--function-arg-placeholders=false",
          "--header-insertion=iwyu",
        },
      },
      gopls = {
        settings = {
          gopls = {
            usePlaceholders = false,
            completeUnimported = true,
          },
        },
      },
    },
  },
}
