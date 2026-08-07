-----------------------------------------------------------------------------
--- gitsigns:
local gitsigns = require 'gitsigns'
vim.keymap.set('v', '<leader>gsh', function()
  gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
end, { desc = '[g]it [s]tage [h]unk' })

vim.keymap.set('n', '<leader>gsb', gitsigns.stage_buffer, { desc = '[g]it [s]tage [b]uffer' })

vim.keymap.set('n', ']c', function()
  if vim.wo.diff then
    vim.cmd.normal { ']c', bang = true }
  else
    gitsigns.nav_hunk 'next'
  end
end, { desc = 'Go to next git [C]hanges' })

vim.keymap.set('n', '[c', function()
  if vim.wo.diff then
    vim.cmd.normal { '[c', bang = true }
  else
    gitsigns.nav_hunk 'prev'
  end
end, { desc = 'Go to previous git [C]hanges' })


-----------------------------------------------------------------------------
--- Folding / folds:
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldcolumn = '0'
vim.opt.foldlevel = 42
vim.opt.foldlevelstart = 42
vim.opt.foldnestmax = 42
function _G.CustomFoldText()
  local line = vim.fn.getline(vim.v.foldstart)
  local num_folded_lines = vim.v.foldend - vim.v.foldstart + 1
  local foldtext = line .. ' { ... ' .. num_folded_lines .. ' lines }'

  -- Ensure the foldtext does not exceed the window width
  return foldtext
end
vim.opt.foldtext = 'v:lua.CustomFoldText()'
vim.opt.fillchars:append { fold = ' ' }
vim.opt.foldminlines = 1
-- vim.opt.foldtext = ""


-----------------------------------------------------------------------------
--- KeyMaps:
-- copy to clipboard
vim.keymap.set('v', 'Y', '"+y')
vim.keymap.set('n', 'Y', '"+yy')

-- show / hide normal line numbers, when someone is watching my screen
vim.keymap.set('n', '<leader>cr', ':set relativenumber<CR>')
vim.keymap.set('n', '<leader>cn', ':set norelativenumber<CR>')

-- working with tabs
-- inspiration: https://github.com/nanozuki/tabby.nvim?tab=readme-ov-file#key-mapping-example
vim.keymap.set('n', '<Leader>tr', ':TabRename ', { desc = '[t]ab [r]ename' })
vim.keymap.set('n', '<leader>tn', ':$tabnew<CR>:TabRename ', { desc = '[t]ab new with name' })
vim.keymap.set('n', '<leader>tj', ':$tabnew<CR>', { desc = '[t]ab new ("down")' })
vim.keymap.set('n', '<leader>tk', ':tabclose<CR>', { desc = '[t]ab close ("up")' })
-- vim.keymap.set('n', '<leader>to', ':tabonly<CR>', { desc = '[t]ab '})
vim.keymap.set('n', '<leader>th', 'gT', { desc = '[t]ab previous ("left")' })
vim.keymap.set('n', 'gh', 'gT', { desc = 'previous tab' })
vim.keymap.set('n', 'gl', 'gt', { desc = 'next tab' })
-- move current tab to previous position
vim.keymap.set('n', '<leader>tH', ':-tabmove<CR>', { desc = '[t]ab move left' })
-- move current tab to next position
vim.keymap.set('n', '<leader>tL', ':+tabmove<CR>', { desc = '[t]ab move right' })

-- close a window:
vim.keymap.set('n', '<C-x>', ':x<CR>', { desc = 'e[x]it window: close the active window' })

-- comma comma => go down a line
vim.keymap.set('i', ',,', '<Esc>A,<Enter>')
vim.keymap.set('i', ',.', '<Esc>A,<Enter>')

-- Go: if err != nil {}
vim.keymap.set('i', 'errnil', 'err != nil {}<Esc>i<Enter>')
vim.keymap.set('i', 'ierrn', 'if err != nil {<Enter>\treturn nil, err<Enter><Backspace>}<Esc>')
