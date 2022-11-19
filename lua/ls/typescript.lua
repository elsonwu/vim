-- LSP for languages
local root_pattern = require("lspconfig").util.root_pattern

-- Typescript -- START
require("lspconfig").tsserver.setup({
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  cmd = { "typescript-language-server", "--stdio" },
  root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", "index.js", "app.js"),
})
-- Typescript -- END

