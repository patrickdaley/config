local icons = require("lazyvim.config").icons

local function fg(name)
  return function()
    ---@type {foreground?:number}?
    local hl = vim.api.nvim_get_hl_by_name(name, true)
    return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
  end
end

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {},
      lualine_c = {
        { "filename", path = 0, symbols = { modified = "  ", readonly = "", unnamed = "" } },
        "diagnostics",
      },
      lualine_x = {
        { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
        -- {
        --   "diff",
        --   symbols = {
        --     added = icons.git.added,
        --     modified = icons.git.modified,
        --     removed = icons.git.removed,
        --   },
        -- },
      },
      lualine_y = {
        { "location", padding = { left = 1, right = 1 } },
      },
      lualine_z = {
        { "progress", separator = "u'uE0B4'", padding = { left = 1, right = 1 } },
      },
    },
  },
}
