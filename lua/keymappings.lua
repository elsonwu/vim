vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'rn', ':lua vim.lsp.buf.rename()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', ':lua vim.lsp.buf.hover()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>fmt', ':Neoformat<CR>', { silent = true })

vim.api.nvim_set_keymap('n', '<leader>ww', ':bdelete<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>wh', ':NvimTreeToggle<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', ':NvimTreeFindFileToggle<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':bnext<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':bprev<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>F', ":Files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sw',
  ":call fzf#vim#grep('rg --column --hidden --line-number --no-heading --color=always -s -- '.expand('<cword>'), 1, fzf#vim#with_preview())<CR>"
  , { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<', "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '>', ">gv", { noremap = true, silent = true })
