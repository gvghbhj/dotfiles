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

      local pick = require 'mini.pick'
      local extra_pick = require 'mini.extra'

      local win_config = function()
        vim.opt.cmdheight = 0
        height = math.floor(0.618 * vim.o.lines) - math.floor(vim.api.nvim_win_get_height(0) / 5.3)
        width = math.floor(0.618 * vim.o.columns) - math.floor(vim.api.nvim_win_get_width(0) / 9)
        return {
          anchor = 'NW',
          border = 'rounded',
          height = height,
          width = width,
          row = math.floor(0.5 * (vim.o.lines - height)),
          col = math.floor(0.5 * (vim.o.columns - width)),
        }
      end

      pick.setup { window = { config = win_config, prompt_prefix = ' 󰘧 ' }, options = { use_cache = true } }
      extra_pick.setup()
      vim.ui.select = MiniPick.ui_select

      vim.keymap.set('n', '<leader>fo', '<cmd>lua MiniExtra.pickers.oldfiles()<CR>', { desc = '[f]ind [o]ldfiles' })
      vim.keymap.set('n', '<leader>ff', '<cmd>lua MiniPick.builtin.files({tool="fd"})<CR>', { desc = '[f]ind [F]iles' })
      vim.keymap.set('n', '<leader>fh', '<cmd>lua MiniPick.builtin.help()<CR>', { desc = '[f]ind [H]elp' })
      vim.keymap.set('n', '<leader>fk', '<cmd>lua MiniExtra.pickers.keymaps()<CR>', { desc = '[f]ind [K]eymaps' })
      vim.keymap.set('n', '<leader>fg', '<cmd>lua MiniPick.builtin.grep_live({tool = "rg"})<CR>', { desc = '[f]ind by [G]rep' })
      vim.keymap.set('n', '<leader>fd', '<cmd>lua MiniExtra.pickers.diagnostic()<CR>', { desc = '[f]ind [D]iagnostics' })
      vim.keymap.set('n', '<leader>fc', '<cmd>lua MiniExtra.pickers.commands()<CR>', { desc = '[f]ind [c]ommands' })
      vim.keymap.set('n', '<leader>fr', '<cmd>lua MiniExtra.pickers.registers()<CR>', { desc = '[f]ind [r]egisters' })
      vim.keymap.set('n', '<leader>gc', '<cmd>lua MiniExtra.pickers.git_commits()<CR>', { desc = 'find [g]it [c]ommits' })
      vim.keymap.set('n', '<leader>fi', '<cmd>lua MiniExtra.pickers.history()<CR>', { desc = '[f]ind command h[i]story' })
      vim.keymap.set('n', '<leader>fe', '<cmd>lua MiniPick.builtin.resume()<CR>', { desc = '[f]ind r[e]sume' })
      vim.keymap.set('n', '<leader>fl', '<cmd>lua MiniExtra.pickers.buf_lines({scope = "current"})<CR>', { desc = '[f]ind in buffer [l]ines' })
      vim.keymap.set('n', '<leader>fa', '<cmd>lua MiniExtra.pickers.buf_lines()<CR>', { desc = '[f]ind line in [a]ll buffers' })

      vim.keymap.set(
        'n',
        '<leader>fn',
        "<cmd>lua MiniPick.builtin.files(nil, {source = { cwd = vim.fn.stdpath 'config'}})<CR>",
        { desc = '[f]ind [n]eovim files' }
      )
      vim.keymap.set('n', 'z=', '<cmd>lua MiniExtra.pickers.spellsuggest()<CR>', { desc = 'spellsuggestions' })
      vim.keymap.set('n', '<Tab>', '<cmd>lua MiniPick.builtin.buffers({include_current = false})<CR>', { desc = 'find buffers' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
