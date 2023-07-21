---
-- Plugins
---
require('lazy').setup({
  -- colorscheme
  { 'dracula/vim', name = 'dracula' },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-treesitter/nvim-treesitter-textobjects", dependencies={"nvim-treesitter/nvim-treesitter"}},

  -- Telescope
  { 'nvim-telescope/telescope.nvim', lazy=true, dependencies={{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}},

  -- Telescope plugins
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    lazy=true,
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },

  -- {'nvim-telescope/telescope-dap.nvim', dependencies = {{'nvim-telescope/telescope.nvim'}}}
  {'nvim-telescope/telescope-project.nvim', lazy=true},

  -- File exporer
  {'nvim-tree/nvim-tree.lua', lazy=true, dependencies = {'nvim-tree/nvim-web-devicons'}, version = 'nightly'},
  {'nvim-lualine/lualine.nvim', lazy=true, dependencies = {'nvim-tree/nvim-web-devicons'}},
  {'akinsho/bufferline.nvim', lazy=true, version = 'v3.*', dependencies = 'nvim-tree/nvim-web-devicons'},

  -- Git related
  {'lewis6991/gitsigns.nvim', lazy=true, config = true},
  {'akinsho/git-conflict.nvim', lazy=true, version = '*'},

  -- utils
  {'Raimondi/delimitMate', lazy=true, event='UIEnter'},
  {'tpope/vim-commentary', lazy=true, event='UIEnter'},
  {'djoshea/vim-autoread', lazy=true, event='UIEnter'},
  {'gelguy/wilder.nvim', lazy=true, event='UIEnter'},
  {'jparise/vim-graphql', lazy=true, event='UIEnter'},
  {'qpkorr/vim-bufkill', lazy=true, event='UIEnter'},
  {'ggandor/leap.nvim', lazy=true, event='UIEnter'},
  {'tpope/vim-repeat', lazy=true, event='UIEnter'},
  {'tpope/vim-surround', lazy=true, event='UIEnter'},
  {'tpope/vim-sleuth', lazy=true, event='UIEnter'},
  {'sbdchd/neoformat', lazy=true, event='UIEnter'},
  {'Pocco81/HighStr.nvim', lazy=true, config = true, event='UIEnter'},
  -- {'folke/which-key.nvim', config = true},
  {'iamcco/markdown-preview.nvim', lazy=true, event='UIEnter', build = function() vim.fn['mkdp#util#install']() end},

  -- 'windwp/nvim-ts-autotag',
  {'windwp/nvim-spectre', lazy = true, event='UIEnter'},
  {'windwp/nvim-autopairs', lazy=true, config = true, event='UIEnter'},
  {'jxnblk/vim-mdx-js', lazy=true, event='UIEnter'},
  {'goolord/alpha-nvim', lazy=true, event='UIEnter', dependencies = {'nvim-tree/nvim-web-devicons'}},

  -- vscode-like icons in completion
  {'onsails/lspkind.nvim', lazy=true, event = 'UIEnter'},

  -- LSP Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-cmdline', -- command line
      'hrsh7th/cmp-buffer', -- buffer completions
      'hrsh7th/cmp-nvim-lua', -- nvim config completions
      'hrsh7th/cmp-nvim-lsp', -- lsp completions
      'hrsh7th/cmp-path', -- file path completions
    },
    event='UIEnter',
    lazy = true,
  },

  -- Better rust support
  {'simrat39/rust-tools.nvim', lazy = true },

  -- LSP Support
  {'neovim/nvim-lspconfig', lazy=true, event="UIEnter"},
  {'williamboman/mason.nvim', lazy=true, event="UIEnter", build = ':MasonUpdate'},
  {'williamboman/mason-lspconfig.nvim', lazy=true, event="UIEnter"},
  {'b0o/schemastore.nvim', lazy=true, event="UIEnter"},

  {
    'glepnir/lspsaga.nvim',
    branch = 'main',
    dependencies = {{
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig'
    }},
    lazy=true,
    event='UIEnter'
  },
})
