return {
  -- Add the onedark theme plugin
  {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'deep', -- Options: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
        transparent = true, -- Enable transparent background
        term_colors = true, -- Set terminal colors
        code_style = {
          comments = 'italic',
          keywords = 'bold',
          functions = 'none',
          strings = 'none',
          variables = 'none',
        },
        highlights = {
          TelescopeBorder = { fg = '#FFFFFF' },
          FloatBorder = { fg = '#FFFFFF' },
        },
      }
      require('onedark').load()
    end,
  },
  -- You can keep other color schemes as options if you'd like
  -- {
  --   'scottmckendry/cyberdream.nvim',
  -- },
  -- {
  --   'rebelot/kanagawa.nvim',
  -- },
}
-- vim: ts=2 sts=2 sw=2 et
