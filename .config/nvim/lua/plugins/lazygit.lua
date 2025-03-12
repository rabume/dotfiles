return {
  {
    'kdheepak/lazygit.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      -- Set environment variables to ensure proper editor usage
      vim.env.EDITOR = 'nvim'
      vim.env.VISUAL = 'nvim'
      vim.env.GIT_EDITOR = 'nvim'
      require 'utils.lazygit_opener'
    end,
  },
}
