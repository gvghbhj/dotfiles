-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin
--
-- A function that sets the theme to be ivy
local function theme_wrapper(telescope_command)
  return function()
    telescope_command(require('telescope.themes').get_ivy())
  end
end

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
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        defaults = {
          prompt_prefix = ' 󰘧 ',
          --   mappings = {
          --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        },
        -- },
        pickers = {
          lsp_definitions = {
            theme = 'ivy',
          },
          lsp_references = {
            theme = 'ivy',
          },
          lsp_implementations = {
            theme = 'ivy',
          },
          lsp_type_definitions = {
            theme = 'ivy',
          },
          lsp_document_symbols = {
            theme = 'ivy',
          },
          lsp_dynamic_workspace_symbols = {
            theme = 'ivy',
          },
          treesitter = {
            theme = 'ivy',
          },
          buffers = {
            theme = 'ivy',
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
      vim.keymap.set('n', '<leader>fh', theme_wrapper(builtin.help_tags), { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>fk', theme_wrapper(builtin.keymaps), { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>ff', theme_wrapper(builtin.find_files), { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>fs', theme_wrapper(builtin.builtin), { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>fw', theme_wrapper(builtin.grep_string), { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>fg', theme_wrapper(builtin.live_grep), { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>fd', theme_wrapper(builtin.diagnostics), { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>fr', theme_wrapper(builtin.resume), { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>fo', theme_wrapper(builtin.oldfiles), { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader>fk', theme_wrapper(builtin.keymaps), { desc = 'search through keymaps using telescope ' })
      vim.keymap.set('n', '<leader>fc', theme_wrapper(builtin.commands), { desc = 'search through commands using telescope ' })
      vim.keymap.set('n', '<leader>fl', theme_wrapper(builtin.command_history), { desc = 'Search through command history in nvim' })
      vim.keymap.set('n', '<leader>fm', theme_wrapper(builtin.registers), { desc = 'Search through Regsiters in nvim' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_ivy {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      vim.keymap.set('n', 'z=', theme_wrapper(builtin.spell_suggest), { desc = 'Spell suggestion via telescope' })
      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>f/', function()
        builtin.live_grep(require('telescope.themes').get_ivy {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        })
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>fn', function()
        builtin.find_files(require('telescope.themes').get_ivy { cwd = vim.fn.stdpath 'config' })
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
