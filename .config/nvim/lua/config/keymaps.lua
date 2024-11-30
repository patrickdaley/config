-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local map = Util.safe_keymap_set

local mini_desc = "Open Mini Files "

map({ "n" }, "<leader>e", function()
  require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
end, { desc = mini_desc .. " (current buffer directory)" }
)

map({ "n" }, "<leader>E", function()
  require("mini.files").open(vim.loop.cwd(), true)
end, { desc = mini_desc .. " (root directory)" }
)
