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
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
    opts = {
      dev_log = { enabled = true, open_cmd = "tabedit" },
    },
  },
}
