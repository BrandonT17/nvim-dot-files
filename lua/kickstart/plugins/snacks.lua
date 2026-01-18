return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    image = {
      enabled = true,
      backend = 'kitty',
      tmux_show_only_in_active_window = true,
      show_in_viewport = false,
    },
  },
}
