return {
  'hrsh7th/nvim-cmp', -- Core completion plugin
  dependencies = {
    'hrsh7th/cmp-nvim-lsp', -- LSP source for completion
    'hrsh7th/cmp-buffer', -- Buffer source for completion
    'hrsh7th/cmp-path', -- Path source for completion
    'hrsh7th/cmp-cmdline', -- Command-line source for completion
    'saadparwaiz1/cmp_luasnip', -- Snippet source for completion
    'L3MON4D3/LuaSnip', -- Snippet engine
    'rafamadriz/friendly-snippets', -- Predefined snippets
  },
  config = function()
    require('luasnip.loaders.from_vscode').lazy_load()

    -- nvim-cmp setup
    local cmp = require 'cmp'
    cmp.setup {
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm { select = true },
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
        { name = 'path' },
      }),
    }

    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        { name = 'cmdline' },
      }),
    })
  end,
}
