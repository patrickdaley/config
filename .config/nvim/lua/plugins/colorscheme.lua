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
  { "olivercederborg/poimandres.nvim" },
  { "Yazeed1s/oh-lucy.nvim" },
  { "kvrohit/rasmus.nvim" },
  { "sainnhe/sonokai" },
  {
    "kvrohit/substrata.nvim",
    init = function()
      vim.g.substrata_variant = "brighter"
    end,
  },
  {
    "ramojus/mellifluous.nvim",
    dependecies = { "rktjmp/lush.nvim" },
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
  { "mcchrish/zenbones.nvim", dependecies = { "rktjmp/lush.nvim" } },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "mellow",
    },
  },
}
