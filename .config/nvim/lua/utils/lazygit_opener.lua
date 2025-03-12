local M = {}

-- Function to check clipboard with retries
local function get_clipboard_content(retries, delay)
  local content
  for i = 1, retries do
    content = vim.fn.getreg '+'
    if content ~= '' then
      return content -- Return content if clipboard is not empty
    end
    vim.loop.sleep(delay) -- Wait before retrying
  end
  return nil -- Return nil if clipboard is still empty after retries
end

-- Function to handle editing from lazygit
function M.lazygit_edit(original_buffer)
  -- Get terminal channel ID
  local bufnr = vim.fn.bufnr '%'
  local channel_id = vim.fn.getbufvar(bufnr, 'terminal_job_id')

  if not channel_id then
    vim.notify('No terminal job ID found.', vim.log.levels.ERROR)
    return
  end

  -- Copy file path to clipboard using lazygit's Ctrl+o shortcut
  vim.fn.chansend(channel_id, '\15') -- \15 is <c-o>

  -- Close the lazygit window
  vim.cmd 'close'

  -- Get the file path from clipboard with retry mechanism
  local filepath = get_clipboard_content(5, 50)
  if not filepath then
    vim.notify('Clipboard is empty or invalid.', vim.log.levels.ERROR)
    return
  end

  -- Focus on the original window
  local winid = vim.fn.bufwinid(original_buffer)
  if winid == -1 then
    -- If original window not found, just use current window
    vim.cmd('e ' .. filepath)
  else
    vim.fn.win_gotoid(winid)
    vim.cmd('e ' .. filepath)
  end
end

-- Function to start lazygit with custom key binding
function M.start_lazygit()
  -- Store current buffer to return to it later
  local current_buffer = vim.api.nvim_get_current_buf()

  -- Open lazygit in a floating terminal
  vim.cmd 'LazyGit'

  -- Get the terminal buffer number
  local lazygit_buf = vim.api.nvim_get_current_buf()

  -- Set custom keymap for file opening (Ctrl+e)
  vim.api.nvim_buf_set_keymap(
    lazygit_buf,
    't',
    '<c-e>',
    string.format([[<Cmd>lua require('utils.lazygit_opener').lazygit_edit(%d)<CR>]], current_buffer),
    { noremap = true, silent = true }
  )
end

return M
