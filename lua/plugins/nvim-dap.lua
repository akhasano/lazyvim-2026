return {
  {
    "mfussenegger/nvim-dap",
    opts = function(_, opts)
      local dap = require("dap")
      -- Перебираем все загруженные extras конфигурации C/C++
      for _, lang in ipairs({ "c", "cpp" }) do
        if dap.configurations[lang] then
          for _, config in ipairs(dap.configurations[lang]) do
            -- Направляет stdout в левое нижнее окно (DAP REPL / Console)
            config.console = "internalConsole"
          end
        end
      end
    end,
    keys = function()
      local dap = require("dap")
      return {
        -- Continue / Start debug session (<leader>dc или F5)
        {
          "<leader>dc",
          function()
            dap.continue()
          end,
          desc = "Debug: Continue / Start",
        },
        {
          "<F5>",
          function()
            dap.continue()
          end,
          desc = "Debug: Continue / Start",
        },

        -- Step over (<leader>do или F10)
        {
          "<leader>do",
          function()
            dap.step_over()
          end,
          desc = "Debug: Step Over",
        },
        {
          "<F10>",
          function()
            dap.step_over()
          end,
          desc = "Debug: Step Over",
        },

        -- Step into (<leader>di или F11)
        {
          "<leader>di",
          function()
            dap.step_into()
          end,
          desc = "Debug: Step Into",
        },
        {
          "<F11>",
          function()
            dap.step_into()
          end,
          desc = "Debug: Step Into",
        },

        -- Step out (<leader>dO или F12)
        {
          "<leader>dO",
          function()
            dap.step_out()
          end,
          desc = "Debug: Step Out",
        },
        {
          "<F12>",
          function()
            dap.step_out()
          end,
          desc = "Debug: Step Out",
        },

        -- Полезное дополнение: переключатель брейкпоинтов на <leader>db
        {
          "<leader>db",
          function()
            dap.toggle_breakpoint()
          end,
          desc = "Debug: Toggle Breakpoint",
        },
      }
    end,
  },
}
