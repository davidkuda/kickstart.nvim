---------------------------------------------------------------------------------------
--- oil:
vim.pack.add { 'https://github.com/stevearc/oil.nvim' }
require('oil').setup {
  win_options = {
    signcolumn = 'yes:2',
  },
  columns = {
    'icon',
    -- 'permissions',
    -- 'size',
    -- 'mtime',
  },
  watch_for_changes = true,
  view_options = {
    show_hidden = true,
  },
}

vim.keymap.set('n', '<Leader>n', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

---------------------------------------------------------------------------------------
--- auto-save:
vim.pack.add { 'https://github.com/Pocco81/auto-save.nvim' }
require('auto-save').setup {
  -- make it compatible with harpoon (https://github.com/ThePrimeagen/harpoon/issues/434):
  condition = function(buf)
    if vim.bo[buf].filetype == 'harpoon' then return false end
    if vim.bo[buf].filetype == 'oil' then return false end
  end,
}

---------------------------------------------------------------------------------------
--- git-confict:
vim.pack.add { 'https://github.com/akinsho/git-conflict.nvim' }
require('git-conflict').setup {}

---------------------------------------------------------------------------------------
--- render-markdown:
vim.pack.add { 'https://github.com/MeanderingProgrammer/render-markdown.nvim' }
require('render-markdown').setup {
  heading = {
    width = 'block',
    position = 'inline',
    left_pad = 0,
    right_pad = 2,
  },
  code = {
    style = 'full',
    width = 'block',
    left_margin = 0,
    left_pad = 0,
    right_pad = 2,
    min_width = 60,
    conceal_delimiters = false,
    border = 'thin',
  },
  sign = {
    enabled = false,
  },
}

---------------------------------------------------------------------------------------
--- vim-tmux-navigator:
vim.pack.add { 'https://github.com/christoomey/vim-tmux-navigator' }

---------------------------------------------------------------------------------------
--- tabby:
vim.pack.add { 'https://github.com/nanozuki/tabby.nvim' }
local theme = {
  fill = 'TabLineFill',
  -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
  head = 'TabLine',
  current_tab = 'TabLineSel',
  tab = 'TabLine',
  win = 'TabLine',
  tail = 'TabLine',
}
require('tabby').setup {
  line = function(line)
    return {
      {
        { '  ', hl = theme.head },
        line.sep('', theme.head, theme.fill),
      },
      line.tabs().foreach(function(tab)
        local hl = tab.is_current() and theme.current_tab or theme.tab
        return {
          line.sep('', hl, theme.fill),
          tab.is_current() and '' or '󰆣',
          tab.number(),
          tab.name(),
          tab.close_btn '',
          line.sep('', hl, theme.fill),
          hl = hl,
          margin = ' ',
        }
      end),
    }
  end,
}
