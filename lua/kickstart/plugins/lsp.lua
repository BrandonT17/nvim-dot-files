return {
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      opts = opts or {} -- make sure opts is a table
      opts.ensure_installed = opts.ensure_installed or {} -- make sure it's a table

      vim.list_extend(opts.ensure_installed, {
        'stylua',
        'selene',
        'luacheck',
        'shellcheck',
        'shfmt',
        'tailwindcss-language-server',
        'typescript-language-server',
        'css-lsp',
        'svelte-language-server',
      })

      return opts -- return the table so LazyVim uses it
    end,
  },
}
