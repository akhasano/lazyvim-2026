return {
  "yetone/avante.nvim",
  build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  event = "VeryLazy",
  opts = {
    provider = "ollama",
    system_prompt = [[Ты — опытный русский разработчик и ИИ-ассистент. 
ВСЕГДА отвечай исключительно на русском языке.
ЗАПРЕЩЕНО использовать внутренние рассуждения и токен <|think|>.
Пиши код без изменений, а любые объяснения и комментарии давай сразу, четко и строго на русском языке.]],
    mode = "legacy",
    providers = {
      ollama = {
        api_key_name = "",
        __inherited_from = "openai",
        endpoint = "http://13.107.64.13:12345/v1", -- Note that there is no /v1 at the end.
        model = "gemma-4-26B-A4B-it-UD-Q4_K_M",
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          enable_thinking = false,
          temperature = 0.3,
          presence_penalty = 0.6, -- Штраф за повторение тем
          frequency_penalty = 0.8, -- Жесткий штраф за повторение одних и тех же слов/фраз
          max_tokens = 8192,
        },
      },
    },
    selection = {
      hint_display = "none",
    },
    behaviour = {
      auto_set_keymaps = false,
    },
  },
  cmd = {
    "AvanteAsk",
    "AvanteBuild",
    "AvanteChat",
    "AvanteClear",
    "AvanteEdit",
    "AvanteFocus",
    "AvanteHistory",
    "AvanteModels",
    "AvanteRefresh",
    "AvanteShowRepoMap",
    "AvanteStop",
    "AvanteSwitchProvider",
    "AvanteToggle",
  },
  keys = {
    { "<leader>aa", "<cmd>AvanteAsk<CR>", desc = "Ask Avante" },
    { "<leader>ac", "<cmd>AvanteChat<CR>", desc = "Chat with Avante" },
    { "<leader>ae", "<cmd>AvanteEdit<CR>", desc = "Edit Avante" },
    { "<leader>af", "<cmd>AvanteFocus<CR>", desc = "Focus Avante" },
    { "<leader>ah", "<cmd>AvanteHistory<CR>", desc = "Avante History" },
    { "<leader>am", "<cmd>AvanteModels<CR>", desc = "Select Avante Model" },
    { "<leader>an", "<cmd>AvanteChatNew<CR>", desc = "New Avante Chat" },
    { "<leader>ap", "<cmd>AvanteSwitchProvider<CR>", desc = "Switch Avante Provider" },
    { "<leader>ar", "<cmd>AvanteRefresh<CR>", desc = "Refresh Avante" },
    { "<leader>as", "<cmd>AvanteStop<CR>", desc = "Stop Avante" },
    { "<leader>at", "<cmd>AvanteToggle<CR>", desc = "Toggle Avante" },
  },
}
