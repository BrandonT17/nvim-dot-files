return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      -- list of quotes
      local quotes = {
        {
          '"Truly He is my rock and my salvation,',
          'He is my fortress. I shall not be shaken."',
          '- Psalm 62:6',
          '',
        },
        {
          '"Rejoice always, pray without ceasing,',
          'in everything give thanks, for this',
          'is Gods will for you in Christ Jesus."',
          '- 1 Thessalonians 5:15-7',
          '',
        },
        {
          '"I can do all things through Christ',
          'who strenghtens me."',
          '- Philippians 4:13',
          '',
        },
        {
          '"I command you: be strong and steadfast!',
          'Do not fear nor be dismayed, for the',
          'Lord, your God, is with you wherever you go."',
          '- Joshua 1:9',
          '',
        },
        {
          '"The Lord is my shepard; I shall not want."',
          '- Psalm 23',
          '',
        },
        {
          '"O God, You are my God!',
          'I shall seek you earnestly;',
          'My soul thirsts for You, my flesh yearns for You"',
          '- Psalm 63',
          '',
        },
      }
      -- select quote from quotes list
      math.randomseed(os.time())
      local quote = quotes[math.random(#quotes)]

      require('dashboard').setup {
        -- config
        theme = 'doom',
        config = {
          header = vim.list_extend({
            '',
            '',
            '',
            '        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⡀⠀    ',
            '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠴⠋⡽⢃⣀⣇⠀    ',
            '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠔⠉⣠⠞⢠⡞⠁⣏⠀    ',
            '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠤⣀⡞⠁⢀⠔⠁⣰⠏⢀⣤⠁⡇    ',
            '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⡞⠀⣰⠃⢀⠞⠁⣰⠋⣸⣄⠇    ',
            '⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠇⡼⠁⣰⠃⢀⠏⠀⢰⠃⢠⠇⢸⠀    ',
            '⠀⠀⠀⠀⠀⠀⠀⠀⢠⠏⠜⠁⡰⠃⠀⡜⠀⢠⠇⠀⡜⡀⠈⡇    ',
            '⠀⠀⠀⠀⠀⠀⠀⢀⡏⠀⠀⠀⠀⠀⠀⠀⠠⠋⠀⡸⢡⠃⠀⡇    ',
            '⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⢣⠃⢀⡞⠁    ',
            '⠀⠀⠀⠀⠀⠀⠀⡾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⠳⠄⡜⠀⠀    ',
            '⠀⠀⠀⠀⠀⠀⢰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠀⠀⢀⠇⠀⠀    ',
            '⠀⠀⠀⠀⠀⠀⡸⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠇⠀⠀⡘⠀⠀⠀    ',
            '⣀⣠⣤⣶⣦⣴⠃⠀⠀⠀⠀⠀⠀⠀⠀⢠⠏⠀⠀⡰⠁⠀⠀⠀    ',
            '⠈⢿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⢀⡴⠋⠀⠀⣴⣿⡄⠀⠀⠀    ',
            '⠀⠀⢻⣿⣿⣿⣿⣿⡄⠀⠀⣠⡴⠋⠀⠀⠀⠰⣿⣿⣿⡄⠀⠀    ',
            '⠀⠀⠈⣿⣿⣿⣿⣿⣿⣀⠞⣿⣷⡀⠀⠀⠀⠀⣿⣿⣿⡇⠀⠀    ',
            '⠀⠀⠀⢸⣿⣿⣿⣿⣿⣏⠀⢹⣿⣿⣶⣤⣤⣴⣿⣿⣿⠇⠀⠀    ',
            '⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀    ',
            '⠀⠀⠀⠀⢸⣿⣿⠿⠟⠉⠀⠀⠀⠙⠻⠿⠿⠿⠟⠋⠀⠀⠀⠀    ',
            '⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    ',
          }, quote),
          center = {
            {
              icon = '១ ',
              icon_hl = 'String',
              desc = 'Find File',
              desc_hl = 'Comment',
              key = 'a',
              key_hl = 'Keyword',
              key_format = ' [%s]', -- `%s` will be substituted with value of `key`
              action = 'Telescope find_files',
            },
            {
              icon = '២ ',
              icon_hl = 'String',
              desc = 'Search Text',
              desc_hl = 'Comment',
              key = 'b',
              key_hl = 'Keyword',
              key_format = ' [%s]', -- `%s` will be substituted with value of `key`
              action = 'Telescope live_grep',
            },
            {
              icon = '៣ ',
              icon_hl = 'String',
              desc = 'Recent Files',
              desc_hl = 'Comment',
              key = 'd',
              key_hl = 'Keyword',
              key_format = ' [%s]', -- `%s` will be substituted with value of `key`
              action = 'Telescope oldfiles',
            },
            {
              icon = '៤ ',
              icon_hl = 'String',
              desc = 'Edit Configuration',
              desc_hl = 'Comment',
              key = 'e',
              key_hl = 'Keyword',
              key_format = ' [%s]', -- `%s` will be substituted with value of `key`
              action = 'edit ~/.config/nvim/lua/kickstart/plugins/dashboard.lua',
            },
          },
          footer = {
            'Welcome back, Brandon',
          }, -- your footer
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
}
