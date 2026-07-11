return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "prettier",
          "markdownlint-cli2",
          "gofumpt",
          "goimports",
          "shfmt",
          "stylua",
        },
        -- Автоматически обновлять инструменты при старте (по желанию, false чтобы не спамить)
        auto_update = false,
        -- Запускать установку сразу после старта Neovim
        run_on_start = true,
      })
    end,
  },
}
