-- Neovide settings
if vim.g.neovide then
  -- vim.api.nvim_set_keymap('n', '<D-v>', '"*p', { noremap = true })
  vim.o.guifont = 'MesloLGS NF:h13'
  -- Set current working directory to the project directory env var
  local projects_dir = os.getenv 'PROJECTS_DIR'
  vim.cmd('cd ' .. projects_dir)
  -- vim.api.nvim_set_keymap('i', '<D-v>', '<cmd><ESC> "*P<cr>', { noremap = true })
  vim.keymap.set('i', '<D-v>', '<C-r>*') -- Paste insert mode
  vim.keymap.set('t', '<D-v>', '<C-\\><C-n>l"+Pli') -- Paste insert mode
  vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.g.neovide_input_macos_alt_is_meta = true
  vim.o.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20'
end
vim.g.neovide_scroll_animation_length = 0.05
vim.g.neovide_transparency = 0.7
vim.g.neovide_window_blurred = true
vim.g.neovide_show_border = true -- Doesn't seem to do anything
vim.g.neovide_hide_mouse_when_typing = true
-- vim.g.neovide_cursor_animation_length = 0.05
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_animate_command_line = true
vim.g.neovide_cursor_unfocused_outline_width = 0.18

-- Railgun
-- vim.g.neovide_cursor_vfx_mode = 'railgun'
-- vim.g.neovide_cursor_vfx_opacity = 700.0
-- vim.g.neovide_cursor_vfx_particle_lifetime = 0.7
-- vim.g.neovide_cursor_vfx_particle_density = 43.0
-- vim.g.neovide_cursor_vfx_particle_speed = 13.0
-- vim.g.neovide_cursor_vfx_particle_phase = 30.5
-- vim.g.neovide_cursor_vfx_particle_curl = 0.3

-- Pixiedust
vim.g.neovide_cursor_vfx_mode = 'pixiedust'
vim.g.neovide_cursor_vfx_opacity = 1000.0
vim.g.neovide_cursor_vfx_particle_lifetime = 0.7
vim.g.neovide_cursor_vfx_particle_density = 125.0
vim.g.neovide_cursor_vfx_particle_speed = 10.0