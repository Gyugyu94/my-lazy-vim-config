return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        vtsls = {
          -- vtsls가 제공하는 포맷팅 기능을 명시적으로 거부합니다.
          on_attach = function(client, _)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
          settings = {
            typescript = {
              format = {
                enable = false, -- vtsls 내부 설정에서도 포맷팅 비활성화
              },
            },
            javascript = {
              format = {
                enable = false,
              },
            },
          },
        },
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      scroll = { enabled = false },
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
          files = {
            hidden = true,
            ignored = true,
          },
        },
      },
    },
  },
}
