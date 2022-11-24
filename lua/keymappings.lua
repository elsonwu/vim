vim.api.nvim_set_keymap('c', '<C-k>', '<Up>', {})
vim.api.nvim_set_keymap('c', '<C-j>', '<Down>', {})
vim.api.nvim_set_keymap('c', '<C-h>', '<Left>', {})
vim.api.nvim_set_keymap('c', '<C-l>', '<Right>', {})

vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', {})
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', {})
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', {})
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', {})

vim.keymap.set('n', '<leader>ww', ':bdelete<CR>', { silent = true })
vim.keymap.set('n', '<leader>wh', ':NvimTreeToggle<CR>', { silent = true })
vim.keymap.set('n', '<leader>ff', ':NvimTreeFindFileToggle<CR>', { silent = true })
vim.keymap.set('n', '<C-n>', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<C-p>', ':bprev<CR>', { silent = true })
vim.keymap.set('x', '<', "<gv", { noremap = true, silent = true })
vim.keymap.set('x', '>', ">gv", { noremap = true, silent = true })

-- search and replace current word
vim.keymap.set('n', '<leader>Sw', ":lua require('spectre').open_visual({select_word=true})<CR>", {})

-- LSP
vim.keymap.set('n', 'rn', vim.lsp.buf.rename, { silent = true })
vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, { silent = true })
vim.keymap.set('n', '<leader>fmt', ':Neoformat<CR>', { silent = true })

-- search + LSP
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ss', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sw', builtin.grep_string, {})

vim.keymap.set('n', 'gd', builtin.lsp_definitions, { silent = true })
vim.keymap.set('n', 'gt', builtin.lsp_type_definitions, { silent = true })
vim.keymap.set('n', 'gr', builtin.lsp_references, { silent = true })
vim.keymap.set('n', 'gi', builtin.lsp_implementations, { silent = true })
vim.keymap.set('n', 'gD', builtin.diagnostics, { silent = true })
