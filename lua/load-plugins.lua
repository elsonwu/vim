---
-- Plugins
---
require('packer').startup(function(use)
  -- packer can update itself
  use 'wbthomason/packer.nvim'

  -- colorscheme
  use { 'dracula/vim', as = 'dracula' }

  -- File exporer
  use {'nvim-tree/nvim-tree.lua', requires = {'nvim-tree/nvim-web-devicons'}, tag = 'nightly'}
  use {'nvim-lualine/lualine.nvim', requires = {'nvim-tree/nvim-web-devicons', opt = true}}
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

  -- git related
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'
  use 'zivyangll/git-blame.vim'
  use 'junegunn/gv.vim'
  use 'ruanyl/vim-gh-line'

  -- utils
  use 'Raimondi/delimitMate'
  use 'tpope/vim-commentary'
  use 'djoshea/vim-autoread'
  use 'gelguy/wilder.nvim'
  use 'voldikss/vim-floaterm'
  use 'jparise/vim-graphql'
  use 'qpkorr/vim-bufkill'
  use 'justinmk/vim-sneak'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-sleuth'
  use { 'junegunn/fzf', run = './install --bin', }
  use 'junegunn/fzf.vim'
  -- use 'junegunn/fzf'
  use 'jxnblk/vim-mdx-js'

  use { 'goolord/alpha-nvim', requires = { 'nvim-tree/nvim-web-devicons' } }

  -- formatter
  -- use 'MunifTanjim/prettier.nvim'
  -- use "lukas-reineke/lsp-format.nvim"
  -- use 'mhartington/formatter.nvim'
  use 'sbdchd/neoformat'

  -- vscode-like icons in completion
  use "onsails/lspkind.nvim"

  -- LSP Autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

  -- LSP Support
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- utils
  use 'jose-elias-alvarez/null-ls.nvim'
end)
