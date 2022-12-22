---
-- Plugins
---
require('packer').startup(function(use)
  -- packer can update itself
  use 'wbthomason/packer.nvim'

  -- colorscheme
  use { 'dracula/vim', as = 'dracula' }

  -- Treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

  -- Telescope
  use({'nvim-telescope/telescope.nvim', requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}})
  -- Telescope plugins
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use {'nvim-telescope/telescope-dap.nvim', requires = {{"nvim-telescope/telescope.nvim"}}}

  -- File exporer
  use {'nvim-tree/nvim-tree.lua', requires = {'nvim-tree/nvim-web-devicons'}, tag = 'nightly'}
  use {'nvim-lualine/lualine.nvim', requires = {'nvim-tree/nvim-web-devicons', opt = true}}
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons', config = function() require('bufferline').setup{} end}

  -- Git related
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'
  use 'junegunn/gv.vim'

  -- utils
  use 'Raimondi/delimitMate'
  use 'tpope/vim-commentary'
  use 'djoshea/vim-autoread'
  use 'gelguy/wilder.nvim'
  use 'jparise/vim-graphql'
  use 'qpkorr/vim-bufkill'
  use 'ggandor/leap.nvim'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-sleuth'
  use 'sbdchd/neoformat'
  use {'folke/which-key.nvim', config = function() require('which-key').setup {} end }

  use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-spectre'
  use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }
  use 'jxnblk/vim-mdx-js'
  use { 'goolord/alpha-nvim', requires = { 'nvim-tree/nvim-web-devicons' } }

  -- vscode-like icons in completion
  use "onsails/lspkind.nvim"

  -- Debugger
  use 'mfussenegger/nvim-dap'
  use { "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} }
  use { "microsoft/vscode-js-debug", opt = true, run = "npm install --legacy-peer-deps && npm run compile" }

  -- LSP Autocompletion
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-cmdline", -- command line
      "hrsh7th/cmp-buffer", -- buffer completions
      "hrsh7th/cmp-nvim-lua", -- nvim config completions
      "hrsh7th/cmp-nvim-lsp", -- lsp completions
      "hrsh7th/cmp-path", -- file path completions
    },
  })

  -- Better rust support
  use 'simrat39/rust-tools.nvim'

  -- LSP Support
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use({ "glepnir/lspsaga.nvim", branch = "main" })
end)
