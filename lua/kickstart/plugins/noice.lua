return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
      -- Don't include 'nvim-notify' here if you're disabling it separately
    },
  },
  {
    'rcarriga/nvim-notify',
    enabled = false, -- ✅ disables it entirely
  },
}
