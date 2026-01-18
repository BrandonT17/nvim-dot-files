-- obsidian
return {
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('obsidian').setup {

        ---@param title string|?
        ---@return string
        note_id_func = function(title)
          -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
          -- In this case a note with the title 'My new note' will be given an ID that looks
          -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
          local suffix = ''
          if title ~= nil then
            -- If title is given, transform it into valid file name.
            suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
          else
            -- If title is nil, just add 4 random uppercase letters to the suffix.
            for _ = 1, 4 do
              suffix = suffix .. string.char(math.randomseed(os.time()))
            end
          end
          return tostring(os.time()) .. '-' .. suffix
        end,

        -- Optional, customize how note file names are generated given the ID, target directory, and title.
        ---@param spec { id: string, dir: obsidian.Path, title: string|? }
        ---@return string|obsidian.Path The full path to the new note.
        note_path_func = function(spec)
          -- This is equivalent to the default behavior.
          local path = spec.dir / tostring(spec.id)
          return path:with_suffix '.md'
        end,

        -- Optional, alternatively you can customize the frontmatter data.
        ---@return table

        note_frontmatter_func = function(note)
          if note.title then
            note:add_alias(note.title)
          end

          local out = {
            id = note.id,
            aliases = note.aliases or {},
            tags = note.tags or {},
          }

          if note.metadata and not vim.tbl_isempty(note.metadata) then
            for k, v in pairs(note.metadata) do
              if v ~= nil then
                out[k] = v
              end
            end
          end

          return out
        end,

        disable_frontmatter = true,

        ui = {
          enable = false,
        },

        workspaces = {
          { name = 'vault', path = vim.fn.expand '~/Obsidian' },
        },

        templates = {
          folder = vim.fn.expand '~/Obsidian/999-Templates',
          date_format = '%m-%d-%Y',
          time_format = '%H:%M',
          substitutions = {},
        },

        attachments = {
          path = '999-Attachments',
        },

        follow_url_func = function(url)
          vim.fn.jobstart { 'open', url }
        end,
      }

      vim.keymap.set('n', '<C-v>', ':ObsidianFollowLink vsplit<CR>', { desc = 'open link as vertical split' })
      vim.keymap.set('n', '-#', ':ObsidianTags<CR>', { desc = 'tags' })
      vim.keymap.set('n', '-l', ':ObsidianBacklinks<CR>', { desc = 'backlinks' })
      vim.keymap.set('n', '-i', ':ObsidianTemplate<CR>', { desc = 'insert template' })
      vim.keymap.set('n', '-t', ':ObsidianNewFromTemplate<CR>', { desc = 'create note from template' })
      vim.keymap.set('n', '-n', ':ObsidianNew<CR>', { desc = 'create new note' })
      vim.keymap.set('n', '-s', ':ObsidianQuickSwitch<CR>', { desc = 'open obsidian file search' })
      vim.keymap.set('n', '-f', ':ObsidianSearch<CR>', { desc = 'open obsidian word search' })
      vim.keymap.set('n', '-d', ':ObsidianToday<CR>', { desc = "open today's notes" })
    end,
  },
}
