-- [[ Configure and install plugins ]]

require('lazy').setup({

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  require 'kickstart/plugins/gitsigns',

  require 'kickstart/plugins/which-key',

  require 'kickstart/plugins/telescope',

  -- require 'kickstart/plugins/conform',

  require 'kickstart/plugins/cmp',

  require 'kickstart/plugins/leetcode-nvim',

  require 'kickstart/plugins/noice',
  require 'kickstart/plugins/obsidian',

  require 'kickstart/plugins/lsp',

  require 'kickstart/plugins/catppuccin',

  require 'kickstart/plugins/lazygit',

  require 'kickstart/plugins/autopairs',

  require 'kickstart/plugins/image',

  require 'kickstart/plugins/img-clip',

  require 'kickstart/plugins/luarocks',

  require 'kickstart/plugins/render-markdown',

  require 'kickstart/plugins/todo-comments',

  require 'kickstart/plugins/mini',

  require 'kickstart/plugins/treesitter',

  require 'kickstart/plugins/bible-verse',

  require 'kickstart/plugins/dashboard',

  require 'kickstart/plugins/neo-tree',

  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',

  -- require 'kickstart.plugins.lint',

  require 'kickstart.plugins.autopairs',

  require 'kickstart.plugins.neo-tree',

  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
