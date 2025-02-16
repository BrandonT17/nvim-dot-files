return {
  {
    'dasupradyumna/midnight.nvim',
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'midnight'
    end,
  },
}
