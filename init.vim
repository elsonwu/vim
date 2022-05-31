set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

lua << EOF

require'nvim-tree'.setup()
require('lualine').setup()
require('bufferline').setup()
require('git-conflict').setup()

EOF
