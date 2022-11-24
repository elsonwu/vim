---
-- Plugins
---
require('packer').startup(function(use)
  -- packer can update itself
  use 'wbthomason/packer.nvim'

  -- colorscheme
  use { 'dracula/vim', as = 'dracula' }

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
  })

  -- File exporer
  use {'nvim-tree/nvim-tree.lua', requires = {'nvim-tree/nvim-web-devicons'}, tag = 'nightly'}
  use {'nvim-lualine/lualine.nvim', requires = {'nvim-tree/nvim-web-devicons', opt = true}}
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

  -- Git related
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
  use 'sbdchd/neoformat'

  use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-spectre'
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use 'jxnblk/vim-mdx-js'
  use { 'goolord/alpha-nvim', requires = { 'nvim-tree/nvim-web-devicons' } }

  -- vscode-like icons in completion
  use "onsails/lspkind.nvim"

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

  use 'simrat39/rust-tools.nvim'

  -- LSP Support
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
end)
