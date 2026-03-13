return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        dartls = {
          -- 저장 시 자동 수정을 위한 설정
          settings = {
            -- Lint에서 제안하는 Fix를 저장할 때 적용
            updateImportsOnFileMove = { enabled = "always" },
            completeFunctionCalls = true,
          },
        },
      },
      -- 핵심: 저장 시 Code Action(Fix All)을 실행하도록 설정
      setup = {
        dartls = function()
          vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.dart",
            callback = function()
              vim.lsp.buf.code_action({
                context = { only = { "source.fixAll" } },

                apply = true,
              })
            end,
          })
        end,
      },
    },
  },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
    opts = {
      dev_log = { enabled = true, open_cmd = "tabedit" }, -- 로그를 탭으로 관리
    },
    config = function()
      require("flutter-tools").setup({
        debugger = {
          enabled = true,
          run_via_dap = true, -- DAP 사용 필수
          register_configurations = function(_)
            require("dap").configurations.dart = {
              {
                type = "dart",
                request = "launch",
                name = "Launch flutter",
                dartSdkPath = "path/to/flutter/bin/cache/dart-sdk/bin/dart", -- 본인의 경로로 수정
                flutterSdkPath = "path/to/flutter/bin/flutter", -- 본인의 경로로 수정
                program = "lib/main.lua", -- 엔트리 포인트
                cwd = "${workspaceFolder}",
              },
            }
          end,
        },
      })
    end,
  },
}
