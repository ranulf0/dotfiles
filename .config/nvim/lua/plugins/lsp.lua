return {
  "neovim/nvim-lspconfig",
  config = function()

    local function on_attach(_, _)
      vim.keymap.set("n", "gK", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    end

    vim.lsp.config("lua_ls", {
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
    vim.lsp.enable("lua_ls")

    vim.lsp.config("pyright", {
      on_attach = on_attach,
    })
    vim.lsp.enable("pyright")

    vim.lsp.config("bashls", {
      on_attach = on_attach,
    })
    vim.lsp.enable("bashls")

    vim.lsp.config("rust_analyzer", {
      on_attach = on_attach,
    })
    vim.lsp.enable("rust_analyzer")

    vim.diagnostic.config({
      virtual_text = true,
    })
  end,
}
