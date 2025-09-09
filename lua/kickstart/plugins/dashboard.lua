return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      -- list of quotes
      local quotes = {
        {
          '"Truly, He is my rock', 
          'and my salvation,',
          'He is my fortress.', 
          'I shall not be shaken."',
          'Psalm 62:6',
          '',
        },
        {
          '"I can do all things through',
          'Christ who strenghtens me."',
          'Philippians 4:13',
          '',
        },
        {
          '"He must increase, but I must decrease."',
          'John 3:30',
          '',
        },
        {
          '"Come to Me, all who are',
          'weary and burdened,',
          'and I will give you rest."',
          'Matthew 11:28',
          '',
        },
        {
          '"I command you: be strong and steadfast!',
          'Do not fear nor be dismayed, for the',
          'Lord, your God, is with you wherever you go."',
          'Joshua 1:9',
          '',
        },
        {
          '"The Lord is my shepard; I shall not want."',
          'Psalm 23',
          '',
        },
        {
          '"O God, You are my God! I shall seek you earnestly;',
          'My soul thirsts for You, My flesh yearns for You"',
          'Psalm 63',
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
            '',
            '',
            '',
            '~ N E O V I M ~',
            --            '                                   ██             ',
            --            '▄▄ ▄▄▄     ▄▄▄▄    ▄▄▄   ▄▄▄▄ ▄▄▄ ▄▄▄  ▄▄ ▄▄ ▄▄   ',
            --            ' ██  ██  ▄█▄▄▄██ ▄█  ▀█▄  ▀█▄  █   ██   ██ ██ ██  ',
            --            ' ██  ██  ██      ██   ██   ▀█▄█    ██   ██ ██ ██  ',
            --            '▄██▄ ██▄  ▀█▄▄▄▀  ▀█▄▄█▀    ▀█    ▄██▄ ▄██ ██ ██▄ ',

       
            --'⠀⠀  ⠀⠀⡴⠂⡔⠠⠀⠀⢀⡔⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢦⡙⣦⡑⠀⠀⠀⣤⣤⣤⠀⠀⠀⠀⠀⠀⢲⡔⣲⣿⡟⠒⢁⠀⡀⠀⠀⠀⠀⠀⠀,⠀⡀⠀⠀⠀⠀⠀⢠⠛⣟',
            --'⠀⠀⠐⠀⡶⣥⣣⣌⡁⢂⠢⠂⡗⣄⡱⠠⡄⢢⠀⠀⠁⠆⡐⠈⠄⢃⠰⠈⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⢀⡀⢃⡞⡕⣫⡔⣘⣮⢪⡔⠄⠂⠠⠢⡠⠀⢀⠀⠑⡄⠀⠀⠀⠀⠡⠀',
            --'⡁⢌⢃⠧⣘⢆⠳⣽⡯⣦⣭⣌⠘⡠⢁⠃⠜⠠⠂⠀⠀⠀⠀⠁⠀⠠⢀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⠘⠀⣉⢟⣣⡝⡛⠣⠧⠨⡢⡠⠗⠀⠈⠀⠀⠄⠐⠈⠠⠄⠄⠀⠀⠀',
            --'⠈⠀⠎⢰⢇⡎⢁⣹⣿⣹⢿⡱⢀⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⢀⡶⠉⠈⠿⠁⠁⢀⠀⠈⠀⠀⢆⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀',
            --'⠀⠀⢀⠀⣈⣸⠯⡵⢯⢏⣋⣳⣾⢯⢧⡄⠀⠀⠀⠀⣤⣤⣴⣶⣦⣤⣤⣤⣤⣤⣤⣿⣿⣿⣤⣤⣤⣤⣤⣤⣦⣿⣧⣤⣤⠀⠀⠆⢀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
            --'⠀⢀⠀⢈⠀⡹⠘⠹⢎⠞⡭⢻⡽⢯⡳⢎⠁⠀⠀⠀⠿⠿⠿⠿⠿⣿⣿⡿⠿⠿⠻⣿⣿⣿⠿⠿⠿⢿⣿⡿⠟⠛⠯⠷⠞⠀⠀⠀⠈⡐⠀⡀⠀⠐⠂⠀⠀⠀⠀⡐⠀⠀⠀⠀⠀',
            --'⠱⢢⠁⡾⠑⠄⢠⠌⡙⢆⡸⢭⡻⣌⠓⠌⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⠿⣶⣦⣔⣻⣯⡼⣔⣴⢰⠞⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢀⠐⠀⢀⠀⠀⢀⠀⠀⢀⠀⡀⠀⠀⠀',
            --'⢣⠀⠀⠘⡀⢂⠘⠌⢓⠮⡰⢃⠱⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⢏⣛⠏⡔⢨⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡜⣼⢦⡽⣜⢦⣆⡳⣌⠶⣱⢂⠤⣄',
            --'⠀⠀⠀⠐⠝⡂⢀⡀⠠⢢⡱⢠⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⡦⠷⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡞⣩⢳⡻⣽⢯⢿⣹⣛⡞⣷⢣⣃⡉⠙⠖⠀',
            --'⣀⢄⣐⠀⠒⠩⢨⢶⣙⡿⣽⢣⡌⢆⠰⢀⠀⡀⢀⡈⢢⣀⠀⠀⠀⠀⠀⠀⠀⠀⡐⡾⠃⡄⢐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣐⢭⠼⣠⢍⡳⢹⢭⣛⢮⠧⡝⣾⡱⣟⠲⣧⠞⡒⣲',
            --'⣿⢾⣸⢁⣸⢷⣏⣏⡿⣿⣏⣷⠈⡆⠁⠀⡆⢸⡰⢸⣁⡆⠀⠀⠀⠀⠀⠀⠀⠀⣉⡰⢁⢀⠰⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢈⠁⢶⢁⡎⠰⠁⠆⠸⠈⢷⠹⢶⡉⣶⣹⣾⠏⢱⠱',
            --'⣿⡳⢭⢷⡌⢯⢟⣿⣷⣿⢿⣎⠷⣀⠊⡐⠌⠧⠙⠁⡂⠃⠀⠀⠀⠀⠀⠀⠀⠀⣝⡷⣼⣆⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠊⢐⠨⡖⣬⠁⠀⢀⡠⢀⡄⣧⣳⢿⣿⣷⣿⣷⣤⣆',
            --'⣷⣼⣳⣿⣮⣍⡈⢿⣿⣯⡿⣯⢷⡤⣄⠀⠈⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⣻⣿⣿⠷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡦⠒⡀⠇⡘⢳⢋⢶⣯⣞⣧⣿⣾⣽⣿⣿⣿⣿⣿⣿⡁',
            --'⣯⠛⡽⠚⣿⢿⡽⣻⢽⣻⢿⣹⣧⡛⠉⠀⠀⠀⠀⠀⢠⠣⠌⠀⠀⠀⠀⠀⠀⠀⢫⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⡀⡀⠀⠐⡁⣮⣻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀',
            --'⢣⠍⡀⠀⢴⣯⢷⡣⠎⠘⡝⠈⡀⠔⠑⠀⠄⡀⠀⠀⠣⠈⡀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⢀⡔⠀⠠⢀⡾⢏⣞⢯⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣸',
            --'⠁⠂⠠⡀⢪⠄⡀⠑⠬⠂⠁⠀⢰⠏⢁⠀⡌⣔⠀⡀⠀⠁⠠⠁⠀⠀⠀⠀⠀⠀⠀⡿⣿⣟⠀⠀⠀⠀⠀⢀⠢⡐⠠⡄⠀⣨⠇⡐⡱⢬⡞⣼⣻⣾⣽⣿⣿⢿⣞⢿⣼⣿⣻⠇⠈',
            --'⣀⡀⠀⡕⠂⡂⢄⠀⠀⠀⠀⠀⠸⡀⣂⡘⢬⡑⢇⠰⡀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⡗⣿⣯⠀⠀⠀⢀⠰⣈⠦⣑⢣⡔⣩⢧⣊⡴⣃⠿⣼⣻⣿⢿⡿⣫⣷⣾⣨⣂⣾⣽⣭⡀⢠',
            --'⣿⡹⣏⡸⢆⠈⠆⢆⠀⡀⠀⠀⡰⠈⢀⢱⠎⡰⢀⣉⠿⠰⢇⡀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⣆⠉⣶⢱⡾⣉⣷⡾⣇⣿⣸⢷⣿⣿⣷⣿⣿⣿⣰⣱⣿⣿⣿⡎⢇⣿⣿⣿⣿',
            --'⣯⢳⡝⣜⠣⣂⢀⠢⡂⣸⠒⢀⢁⣆⠀⠼⢪⢴⣟⣷⣗⢾⣿⠔⠀⠀⠀⠀⠀⠀⠀⣷⡏⠹⣀⢦⢨⣝⡲⣏⡾⣝⡾⣽⣿⣳⣿⣿⣿⣾⣿⣿⣿⣫⡼⣿⡟⣿⣿⡟⣆⡿⣿⢟⣾',
            --'⣯⣷⣺⢮⡕⢤⣫⣟⣻⣌⠚⢍⠀⠈⢂⠊⠀⠈⣹⣿⢿⣿⣾⣧⢀⠄⢄⡀⡀⠀⠀⡏⠈⣿⣱⣎⠷⣮⢿⡵⣿⣽⣻⣯⣿⢿⣿⣿⣿⣿⣿⣿⣿⢿⡏⣭⣾⣿⣿⣿⣿⣿⠷⠚⠍',
            --'⣿⣿⣿⣿⣿⡳⡝⣮⢵⣛⣏⡠⠀⠀⢈⡦⣁⣾⣿⣺⣯⠻⣆⠟⡉⠂⠂⠐⢧⣣⡵⣀⡀⣌⡷⣾⣟⡾⣯⣿⣿⣻⣿⣿⢿⣯⣷⣻⣎⣷⣻⡟⣿⣵⣿⣿⣿⣿⣿⣿⣿⡏⠰⠈⢂',
            '',
            '☦ ☦ ☦',
            '',
          }, quote),
          center = {
            {
              icon = 'I.   ',
              icon_hl = 'String',
              desc = 'Find File',
              desc_hl = 'Comment',
              key = 'a',
              key_hl = 'Keyword',
              key_format = ' [%s]', -- `%s` will be substituted with value of `key`
              action = function()
                require('telescope.builtin').find_files()
              end,
            },
            {
              icon = 'II.  ',
              icon_hl = 'String',
              desc = 'Search Text',
              desc_hl = 'Comment',
              key = 'b',
              key_hl = 'Keyword',
              key_format = ' [%s]', -- `%s` will be substituted with value of `key`
              action = function()
                require('telescope.builtin').live_grep()
              end,
            },
            {
              icon = 'III. ',
              icon_hl = 'String',
              desc = 'Recent Files',
              desc_hl = 'Comment',
              key = 'd',
              key_hl = 'Keyword',
              key_format = ' [%s]', -- `%s` will be substituted with value of `key`
              action = function()
                require('telescope.builtin').oldfiles()
              end,
            },
            {
              icon = 'IV.  ',
              icon_hl = 'String',
              desc = 'Edit Dashboard',
              desc_hl = 'Comment',
              key = 'e',
              key_hl = 'Keyword',
              key_format = ' [%s]', -- `%s` will be substituted with value of `key`
              action = 'edit ~/.config/nvim/lua/kickstart/plugins/dashboard.lua',
            },
            {
              icon = 'V.   ',
              icon_hl = 'String',
              desc = 'Edit Neovim',
              desc_hl = 'Comment',
              key = 'f',
              key_hl = 'Keyword',
              key_format = ' [%s]', -- `%s` will be substituted with value of `key`
              action = 'edit ~/.config/nvim/lua/',
            },
          },
          footer = {
            'Welcome back, Brandon...',
          },
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
}
