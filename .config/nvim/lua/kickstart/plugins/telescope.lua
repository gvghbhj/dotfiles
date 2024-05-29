-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin
--
-- A function that sets the theme to be ivy
return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      --
      -- Current telescope theme
      local current_theme = 'dropdown'

      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        defaults = {
          prompt_prefix = ' 󰘧 ',
        },
        pickers = {
          lsp_definitions = {
            theme = current_theme,
          },
          lsp_references = {
            theme = current_theme,
          },
          lsp_implementations = {
            theme = current_theme,
          },
          lsp_type_definitions = {
            theme = current_theme,
          },
          lsp_document_symbols = {
            theme = current_theme,
          },
          lsp_dynamic_workspace_symbols = {
            theme = current_theme,
          },
          treesitter = {
            theme = current_theme,
          },
          oldfiles = {
            theme = current_theme,
          },
          find_files = {
            theme = current_theme,
          },
          spell_suggest = {
            theme = current_theme,
          },
          live_grep = {
            theme = current_theme,
          },
          help_tags = {
            theme = current_theme,
          },
          keymaps = {
            theme = current_theme,
          },
          current_buffer_fuzzy_find = {
            theme = current_theme,
          },
          builtin = {
            theme = current_theme,
          },
          grep_string = {
            theme = current_theme,
          },
          diagnostics = {
            theme = current_theme,
          },
          resume = {
            theme = current_theme,
          },
          commands = {
            theme = current_theme,
          },
          command_history = {
            theme = current_theme,
          },
          registers = {
            theme = current_theme,
          },
          buffers = {
            theme = current_theme,
            initial_mode = 'normal',
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = '[f]ind [o]ldfiles' })
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[f]ind [F]iles' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[f]ind [H]elp' })
      vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[f]ind [K]eymaps' })
      vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[f]ind [S]elect Telescope' })
      vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[f]ind current [W]ord' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[f]ind by [G]rep' })
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[f]ind [D]iagnostics' })
      vim.keymap.set('n', '<leader>fe', builtin.resume, { desc = '[f]ind r[e]sume' })
      vim.keymap.set('n', '<leader>fc', builtin.command_history, { desc = '[f]ind [c]ommand history' })
      vim.keymap.set('n', '<leader>fm', builtin.commands, { desc = '[f]ind co[m]mands' })
      vim.keymap.set('n', '<leader>fr', builtin.registers, { desc = '[f]ind [r]egisters' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find {
          winblend = 10,
          previewer = false,
        }
      end, { desc = '[/] Fuzzily search in current buffer' })

      vim.keymap.set('n', 'z=', builtin.spell_suggest, { desc = 'Spell suggestion via telescope' })
      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>f/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[f]ind [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>fn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[f]ind [N]eovim files' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
