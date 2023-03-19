return {
  -- add gruvbox
  { "Yazeed1s/minimal.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  -- { "adisen99/apprentice.nvim" },
  -- { "Mofiqul/adwaita.nvim" },
  -- { "Yazeed1s/minimal.nvim" },
  { "kvrohit/rasmus.nvim" },
  { "lourenci/github-colors" },
  { "kvrohit/mellow.nvim" },
  { "sainnhe/sonokai" },
  { "rktjmp/lush.nvim" },
  {
    "ramojus/mellifluous.nvim",
    dependecies = {
      { "rktjmp/lush.nvim" },
    },
    -- opts = function()
    --   if vim.o.background == "light" then
    --     return nil
    --   else
    --     return {
    --       transparent_background = {
    --         enabled = true,
    --         floating_windows = true,
    --         telescope = true,
    --         cursor_line = true,
    --         status_line = false,
    --       },
    --     }
    --   end
    -- end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "mellow",
    },
  },
}
