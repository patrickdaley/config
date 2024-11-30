-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    io.stdout:write("\027]111;;\027\\")
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local bg = vim.api.nvim_get_hl(0, { name = "Normal", link = false }).bg
    if bg == nil then return end
    io.stdout:write(("\027]11;#%06x\027\\"):format(bg))
  end,
})
