require('telescope').setup({
  defaults = {
    initial_mode = 'insert',
    path_display = {'absolute'},
    wrap_results = true,
    layout_strategy = 'vertical',
    layout_config = { height = 0.95, width = 0.95 },
    default_mappings = false,
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
      }
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  },
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('dap')
