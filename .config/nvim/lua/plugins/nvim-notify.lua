return {
  "rcarriga/nvim-notify",
  keys = {
    {
      "<leader>un",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Delete all Notifications",
    },
  },
  opts = {
    timeout = 5000,
    -- max_height = function()
    --   return math.floor(vim.o.lines * 0.4)
    -- end,
    -- max_width = function()
    --   return math.floor(vim.o.columns * 0.75)
    -- end,
    -- render = "minimal",
    top_down = false,
  },
  init = function()
    -- when noice is not enabled, install notify on VeryLazy
    local Util = require("lazyvim.util")
    if not Util.has("noice.nvim") then
      Util.on_very_lazy(function()
        vim.notify = require("notify")
      end)
    end
  end,
}
