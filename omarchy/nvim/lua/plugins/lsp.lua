return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                checkThirdParty = false,
              },
            },
          },
          pyright = {},
          clangd = {},
          tsserver = {},
          glslls = {},
          gopls = {
            settings = {
              gopls = {
                gofumpt = true,
                staticcheck = true,
                completeUnimported = true,
                analyses = {
                  unusedparams = true,
                },
              },
            },
          },
        },
      },
    },
  },
}
