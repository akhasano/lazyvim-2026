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
    -- mode = "legacy",

    providers = {
      ollama = {
        api_key_name = "",
        __inherited_from = "openai",
        endpoint = "http://13.107.64.13:12345", -- Note that there is no /v1 at the end.
        model = "gemma-4-26B-A4B-it-UD-Q4_K_M",
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          enable_thinking = false,
          temperature = 0.75,
          presence_penalty = 0.6, -- Штраф за повторение тем
          frequency_penalty = 0.8, -- Жесткий штраф за повторение одних и тех же слов/фраз
          max_tokens = 32768,
        },
      },
    },
    selection = {
      hint_display = "none",
    },
    behaviour = {
      auto_suggestions = false, -- Experimental stage
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
      minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
      enable_token_counting = true, -- Whether to enable token counting. Default to true.
      auto_add_current_file = true, -- Whether to automatically add the current file when opening a new chat. Default to true.
      auto_approve_tool_permissions = true, -- Default: auto-approve all tools (no prompts)
      -- Examples:
      -- auto_approve_tool_permissions = false,                -- Show permission prompts for all tools
      -- auto_approve_tool_permissions = {"bash", "str_replace"}, -- Auto-approve specific tools only
      ---@type "popup" | "inline_buttons"
      confirmation_ui_style = "inline_buttons",
      --- Whether to automatically open files and navigate to lines when ACP agent makes edits
      ---@type boolean
      acp_follow_agent_locations = true,
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
