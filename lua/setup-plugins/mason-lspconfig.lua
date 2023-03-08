require("mason-lspconfig").setup({
  automatic_installation = true,
  ensure_installed = { "tsserver", "rust_analyzer", "gopls", "lua_ls", "vimls" },
})

local lspconfig = require("lspconfig");
require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    -- print("server_name", server_name)
    lspconfig[server_name].setup {}
  end,
}
