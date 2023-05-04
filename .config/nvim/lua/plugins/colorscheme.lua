return {
  { "rktjmp/lush.nvim" },
  { "Mofiqul/adwaita.nvim" },
  { "kyazdani42/blue-moon" },
  { "adisen99/apprentice.nvim" },
  { "lourenci/github-colors" },
  { "savq/melange-nvim" },
  { "kvrohit/mellow.nvim" },
  { "Yazeed1s/minimal.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "Yazeed1s/oh-lucy.nvim" },
  { "kvrohit/rasmus.nvim" },
  { "sainnhe/sonokai" },
  { "kvrohit/substrata.nvim" },
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
