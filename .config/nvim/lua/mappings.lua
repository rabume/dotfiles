-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Move between windows
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- LazyGit with custom file opening
vim.api.nvim_set_keymap(
  'n',
  '<leader>gg',
  ':lua require("utils.lazygit_opener").start_lazygit()<CR>',
  { noremap = true, silent = true, desc = 'Open LazyGit with file opener' }
)

-- Copilot
vim.api.nvim_set_keymap('n', '<leader>dc', ':Copilot disable<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ec', ':Copilot enable<CR>', { noremap = true, silent = true })

-- Toggling comments
vim.api.nvim_set_keymap('n', '<C-/>', '<Plug>(comment_toggle_linewise_current)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-/>', '<Plug>(comment_toggle_linewise_visual)', { noremap = true, silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- NvimTree keymaps
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })

-- Bufferline keymaps
vim.keymap.set('n', '<TAB>', ':BufferLineCycleNext<CR>', { desc = 'Move to next buffer' })
vim.keymap.set('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', { desc = 'Move to next buffer' })
vim.api.nvim_set_keymap('n', '<C-w>', ':bd<CR>', { noremap = true, silent = true })

-- Git navigation keymaps (fast shortcuts)
vim.keymap.set('n', '[g', function()
  require('gitsigns').prev_hunk()
end, { desc = 'Go to previous git change' })

vim.keymap.set('n', ']g', function()
  require('gitsigns').next_hunk()
end, { desc = 'Go to next git change' })

-- LSP implementation mapping with Telescope
vim.keymap.set('n', 'gi', function()
  require('telescope.builtin').lsp_implementations()
end, { desc = 'Go to implementation with Telescope' })

-- Terminal mappings (toggleterm.nvim)
vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical<CR>', { desc = 'Open terminal in vertical split' })
vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>', { desc = 'Open terminal in horizontal split at bottom' })
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>', { desc = 'Open floating terminal' })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
