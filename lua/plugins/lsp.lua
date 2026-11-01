return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      keymap = { preset = "enter" },
      completion = {
        documentation = { auto_show = true },
        list = { selection = { preselect = true } },
      },
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      vim.lsp.config("clangd", {
        cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu" },
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })
      vim.lsp.enable("clangd")
    end,
  },
}
