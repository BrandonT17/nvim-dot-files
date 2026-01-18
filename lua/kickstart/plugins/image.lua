return {
  '3rd/image.nvim',
  event = 'VeryLazy',
  dependencies = { 'vhyrro/luarocks.nvim' },
  config = function()
    require('image').setup {
      backend = 'kitty',
      rocks = {
        hererocks = true,
      },
      integrations = {
        markdown = {
          enabled = true,
        },
      },
      max_width = 500,
      max_height = 500,
      tmux_show_only_in_active_window = true,
      only_render_image_at_cursor = false, -- show all images
    }
  end,
}
