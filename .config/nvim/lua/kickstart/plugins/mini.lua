return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- File manager
      -- require('mini.files').setup {
      --   windows = { preview = true },
      --   mappings = {
      --     close = 'q',
      --     go_in = '<CR>',
      --     go_in_plus = 'L',
      --     go_out = '-',
      --     go_out_plus = 'H',
      --     reset = 'u',
      --     reveal_cwd = '@',
      --     show_help = 'g?',
      --     synchronize = '=',
      --     trim_left = '<',
      --     trim_right = '>',
      --   },
      -- }

      -- Dashboard
      local starter = require 'mini.starter'
      starter.setup {
        autoopen = true,
        items = {
          starter.sections.recent_files(10, false),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet '-> ',
          starter.gen_hook.aligning('center', 'center'),
        },
        footer = '',
        evaluate_single = true,
        header = [[ 
      ████ ██████           █████      ██                     
     ███████████             █████                             
     █████████ ███████████████████ ███   ███████████   
    █████████  ███    █████████████ █████ ██████████████   
   █████████ ██████████ █████████ █████ █████ ████ █████   
 ███████████ ███    ███ █████████ █████ █████ ████ █████  
██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      }

      -- shows clues similar to whichkey
      local miniclue = require 'mini.clue'
      miniclue.setup {
        triggers = {
          -- Leader triggers
          { mode = 'n', keys = '<Leader>' },
          { mode = 'x', keys = '<Leader>' },

          -- Built-in completion
          { mode = 'i', keys = '<C-x>' },

          -- `g` key
          { mode = 'n', keys = 'g' },
          { mode = 'x', keys = 'g' },

          -- Marks
          { mode = 'n', keys = "'" },
          { mode = 'n', keys = '`' },
          { mode = 'x', keys = "'" },
          { mode = 'x', keys = '`' },

          -- Registers
          { mode = 'n', keys = '"' },
          { mode = 'x', keys = '"' },
          { mode = 'i', keys = '<C-r>' },
          { mode = 'c', keys = '<C-r>' },

          -- Window commands
          { mode = 'n', keys = '<C-w>' },

          -- `z` key
          { mode = 'n', keys = 'z' },
          { mode = 'x', keys = 'z' },
        },

        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
        },

        window = {
          delay = 250,
        },
      }
      -- autocompletes pairs, such as '' and ()
      require('mini.pairs').setup { modes = { comamnd = true } }

      -- for zoom functionality
      require('mini.misc').setup { make_global = { 'zoom' } }

      -- moves selected line up and down using using alt+k/j/h/l
      require('mini.move').setup()
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
