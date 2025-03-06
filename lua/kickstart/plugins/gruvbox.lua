return {
  {
    'morhetz/gruvbox', -- Add the Gruvbox plugin
    lazy = false, -- Load it immediately
    priority = 1000, -- Ensure it loads first
    config = function()
      -- Gruvbox settings
      vim.o.background = 'light' -- Use light mode
      vim.g.gruvbox_contrast_light = 'medium' -- Options: 'hard', 'medium', 'soft'
      vim.g.gruvbox_invert_selection = 0 -- Don't invert selections

      -- Apply the colorscheme
      vim.cmd 'colorscheme gruvbox'
    end,
  },
}
