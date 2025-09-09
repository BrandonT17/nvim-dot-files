return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- Options: latte, frappe, macchiato, mocha
        transparent_background = true,
        color_overrides = {
          mocha = {
            base = '#000000',
            mantle = '#000000',
            crust = '#000000',
          },
        },
        integrations = {
          treesitter = true,
          native_lsp = { enabled = true },
          lsp_trouble = true,
          telescope = true,
          cmp = true,
        },
      }
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },
}
