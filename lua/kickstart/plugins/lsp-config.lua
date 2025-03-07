local custom_border = {
  { '─', 'FloatBorder' },
  { '│', 'FloatBorder' },
  { '─', 'FloatBorder' },
  { '│', 'FloatBorder' },
  { '╭', 'FloatBorder' },
  { '╮', 'FloatBorder' },
  { '╯', 'FloatBorder' },
  { '╰', 'FloatBorder' },
}
return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      local on_attach = function(client, bufnr)
        local function map(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end
          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        -- Keybindings
        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        map('K', vim.lsp.buf.hover, 'Hover Documentation')
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        -- Floating windows with custom borders
        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = custom_border })

        if client.server_capabilities.documentHighlightProvider then
          local highlight_group = vim.api.nvim_create_augroup('LSPDocumentHighlight', { clear = true })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            group = highlight_group,
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            group = highlight_group,
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
          })
        end

        if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          map('<leader>th', function()
            vim.lsp.inlay_hint(bufnr, nil)
          end, '[T]oggle Inlay [H]ints')
        end
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      local servers = {
        clangd = { filetypes = { 'c', 'cpp', 'objc', 'objcpp' } },
        pyright = {},
        rust_analyzer = {
          root_dir = function(fname)
            return require('lspconfig.util').root_pattern('Cargo.toml', '.git')(fname) or vim.fn.fnamemodify(fname, ':p:h')
          end,
        },
        cssls = {},
        html = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = { callSnippet = 'Replace' },
            },
          },
        },
      }

      local ensure_installed = vim.tbl_keys(servers)
      vim.list_extend(ensure_installed, { 'stylua' })
      require('mason').setup()
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server_opts = servers[server_name] or {}
            server_opts.capabilities = vim.tbl_deep_extend('force', capabilities, server_opts.capabilities or {})
            server_opts.on_attach = server_opts.on_attach or on_attach
            require('lspconfig')[server_name].setup(server_opts)
          end,
        },
      }

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('LSPDetach', { clear = true }),
        callback = function(event)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'LSPDocumentHighlight', buffer = event.buf }
        end,
      })
    end,
  },
}
