return {
  {
    'LunarVim/templeos.nvim',
    lazy = false, -- Load immediately (set to true if you want it to load on event)
    config = function()
      require('templeos').setup()
    end,
  },
}
