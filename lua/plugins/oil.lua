local function openExa(params)
  local path = vim.fn.expand '%:p'
  -- If path starts with oil:// then get the part after
  path = string.sub(path, 7)
  print('Test path' .. path)
  -- NOTE: Sometimes on first launch you need extra button for tab close
  vim.cmd('-tabnew | term exa --icons --tree -l --git ' .. params .. ' ' .. path)
end
local function windowChangeDirectory()
  local path = vim.fn.expand '%:p'
  -- If path starts with oil:// then get the part after
  path = string.sub(path, 7)
  local dir_path = vim.fn.fnamemodify(path, ':h')
  vim.cmd('lcd ' .. dir_path)
end
local function tabChangeDirectory()
  local path = vim.fn.expand '%:p'
  -- If path starts with oil:// then get the part after
  path = string.sub(path, 7)
  local dir_path = vim.fn.fnamemodify(path, ':h')
  vim.cmd('tcd ' .. dir_path)
end
local function changeDirectory()
  local path = vim.fn.expand '%:p'
  -- If path starts with oil:// then get the part after
  path = string.sub(path, 7)
  local dir_path = vim.fn.fnamemodify(path, ':h')
  vim.api.nvim_set_current_dir(dir_path)
end
local function neoTreeExpandAllNodes()
  local manager = require 'neo-tree.sources.manager'
  local commands = require 'neo-tree.sources.filesystem.commands'
  local state = manager.get_state 'filesystem'
  commands.expand_all_nodes(state, nil)
end
local function loadNeotreeAndExpandNodes()
  -- https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/826#discussioncomment-5431757
  local manager = require 'neo-tree.sources.manager'
  manager.show 'filesystem'
  -- 400 timeout to CD and expand neotree after keyboard
  -- shortcut until i find a non hacky way to do it
  vim.defer_fn(function()
    neoTreeExpandAllNodes()
  end, 400)
end
return {
  'stevearc/oil.nvim',
  lazy = false,
  cmd = { 'Oil' },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' } },
  },
  opts = {
    default_file_explorer = true,
    columns = {
      'icon',
      'permissions',
      'size',
      'mtime',
    },
    keymaps = {
      ['cd'] = 'actions.cd',
      ['<leader>lc'] = {
        callback = windowChangeDirectory,
        desc = '[T]ab [C]hange [D]irectory',
        mode = 'n',
      },
      ['<leader>tc'] = {
        callback = tabChangeDirectory,
        desc = '[T]ab [C]hange [D]irectory',
        mode = 'n',
      },
      ['<leader>x'] = {
        callback = function()
          changeDirectory()
          loadNeotreeAndExpandNodes()
        end,
        desc = 'CD and reload neotree',
        mode = 'n',
      },
      ['<leader>e'] = {
        callback = function()
          openExa '--git-ignore'
        end,
        desc = '[e]xa',
        mode = 'n',
      },
      ['<leader>g'] = {
        callback = function()
          openExa ''
        end,
        desc = '[e]xa',
        mode = 'n',
      },
    },
  },
}