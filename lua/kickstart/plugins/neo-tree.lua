-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

return {
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup {
        view = {
          side = 'left',
          width = 25,
          border = rounded,
        },
      }
      vim.keymap.set('n', '|', ':NvimTreeToggle<CR>', { desc = 'opens tree', noremap = true, silent = true })
    end,
  },
}
