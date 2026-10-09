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

vim.pack.add { 'https://github.com/refractalize/oil-git-status.nvim' }
require('oil-git-status').setup {}

vim.pack.add { 'https://github.com/nvim-tree/nvim-web-devicons' }
require('nvim-web-devicons').setup {}

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

---------------------------------------------------------------------------------------
--- color schemes:

-- NOTE: If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.

-- vitesse (requires colorbuddy):
vim.pack.add { 'https://github.com/tjdevries/colorbuddy.nvim' }
vim.pack.add { 'https://github.com/2nthony/vitesse.nvim' }

-- tokyonioght (why not):
vim.pack.add { 'https://github.com/folke/tokyonight.nvim' }
---@diagnostic disable-next-line: missing-fields
require('tokyonight').setup {
  styles = {
    comments = { italic = false }, -- Disable italics in comments
  },
}

-- rose-pine (my beloved):
vim.pack.add({
	{
		src = "https://github.com/rose-pine/neovim",
		name = "rose-pine",
	},
})
require("rose-pine").setup()

vim.cmd("colorscheme rose-pine")

---------------------------------------------------------------------------------------
--- marks:
vim.pack.add({"https://github.com/chentoast/marks.nvim"})
require("marks").setup()

---------------------------------------------------------------------------------------
--- diagflow:
vim.pack.add({
  { src = "https://github.com/dgagn/diagflow.nvim" },
})

vim.api.nvim_create_autocmd("LspAttach", {
  once = true,
  callback = function()
    require("diagflow").setup({
      scope = "line",
      max_width = 78,
      placement = "inline",
    })
  end,
})


---------------------------------------------------------------------------------------
--- harpoon:
vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
})

local harpoon = require("harpoon")

require("harpoon").setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>l", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end)
vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end)
vim.keymap.set("n", "<leader>0", function() harpoon:list():select(10) end)

-- Toggle previous & next buffers stored within Harpoon list
-- "<C-S-P>" -> ctrl shift p
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
