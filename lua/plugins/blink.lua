return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "none", -- Отключаем дефолтные пресеты, чтобы настроить под себя

        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide" },
        ["<CR>"] = { "accept", "fallback" },

        -- Навигация с помощью Ctrl + j / Ctrl + k
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },

        -- Навигация с помощью Tab / Shift + Tab
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },

        -- Прокрутка документации
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      },
    },
  },
}
