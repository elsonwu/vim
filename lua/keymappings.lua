vim.api.nvim_set_keymap('c', '<C-k>', '<Up>', {})
vim.api.nvim_set_keymap('c', '<C-j>', '<Down>', {})
vim.api.nvim_set_keymap('c', '<C-h>', '<Left>', {})
vim.api.nvim_set_keymap('c', '<C-l>', '<Right>', {})

vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', {})
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', {})
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', {})
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', {})

-- Defined in telescope.lua
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { silent = true })
-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, { silent = true })
vim.keymap.set('n', 'rn', vim.lsp.buf.rename, { silent = true })
vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, { silent = true })
vim.keymap.set('n', '<leader>fmt', ':Neoformat<CR>', { silent = true })

vim.api.nvim_set_keymap('n', '<leader>ww', ':bdelete<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>wh', ':NvimTreeToggle<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', ':NvimTreeFindFileToggle<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':bnext<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':bprev<CR>', { silent = true })
vim.api.nvim_set_keymap('x', '<', "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '>', ">gv", { noremap = true, silent = true })
