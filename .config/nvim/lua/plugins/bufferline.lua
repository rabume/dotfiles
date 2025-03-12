return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {
        options = {
          show_close_icon = true,
          show_tab_indicators = true,
          always_show_bufferline = true,
          custom_filter = function(buf_number)
            local buftype = vim.bo[buf_number].filetype
            -- Skip terminals in bufferline
            if buftype == 'toggleterm' or buftype == 'terminal' then
              return false
            end
            return true
          end,
        },
      }
    end,
  },
}
