return {
  {
    'romgrk/barbar.nvim',
    lazy = false,

    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },

    init = function()
      vim.g.barbar_auto_setup = false
    end,

    keys = {
      { '<S-h>', '<cmd>BufferPrevious<cr>', desc = 'Prev buffer' },
      { '<S-l>', '<cmd>BufferNext<cr>', desc = 'Next buffer' },
    },

    opts = {
      sidebar_filetypes = {
        ['neo-tree'] = {
          event = 'BufWipeout',
        },
      },
    },

    version = '^1.0.0',
  },
}
