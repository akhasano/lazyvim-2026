return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "default",
      -- Листаем vim-style
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },

      -- Прокрутка всплывающего окна с документацией/типами
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },

      -- Подтверждение выбора (Enter или Tab)
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },
  },
}
