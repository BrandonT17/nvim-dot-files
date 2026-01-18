return {
  {
    'anthony-halim/bible-verse.nvim',
    cmd = { 'BibleVerse', 'BibleVerseQuery', 'BibleVerseInsert' },
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    opts = {
      diatheke = {
        translation = 'DRC',
      },
    },
    config = true,
  },
}
