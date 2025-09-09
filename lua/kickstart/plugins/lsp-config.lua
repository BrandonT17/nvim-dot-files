return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- Example: enable lua_ls for Lua
      local lspconfig = require 'lspconfig'
      lspconfig.lua_ls.setup {}
    end,
  },
}
