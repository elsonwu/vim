vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.wrap = true
vim.opt.number = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.hls = true
vim.opt.swapfile = false
vim.opt.smartcase = true
vim.opt.history = 1000
vim.opt.showcmd = true
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'
vim.opt.clipboard = 'unnamedplus'
-- vim.opt.clipboard = vim.opt.clipboard + 'unnamedplus'
vim.opt.termguicolors = true
vim.opt.updatetime = 300

-- better diagnostic sign
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

pcall(vim.cmd, 'colorscheme dracula')
