require('telescope').setup({})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ss', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sw', builtin.grep_string, {})

vim.keymap.set('n', 'gd', builtin.lsp_definitions, { silent = true })
vim.keymap.set('n', 'gr', builtin.lsp_references, { silent = true })
-- vim.keymap.set('n', 'dd', builtin.diagnostics, { silent = true })
