require('setup-plugins.alpha')
require('setup-plugins.bufferline')
require('setup-plugins.cmp')
-- require('setup-plugins.dap')
require('setup-plugins.git-conflict')
require('setup-plugins.leap')
require('setup-plugins.lspkind')
require('setup-plugins.lspsaga')
require('setup-plugins.lualine')
require('setup-plugins.mason')
require('setup-plugins.mason-lspconfig')
require('setup-plugins.nvim-tree')
require('setup-plugins.telescope')

if not vim.g.vscode then
	require('setup-plugins.treesitter')
end

require('setup-plugins.wilder')
