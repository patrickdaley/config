local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import any extras modules here
    -- { import = "lazyvim.plugins.extras.lang.typescript" },
    -- { import = "lazyvim.plugins.extras.lang.json" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  -- install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   dependencies = {
  --     {
  --       "williamboman/mason-lspconfig.nvim",
  --       dependencies = { "williamboman/mason.nvim" },
  --     },
  --   },
  --   config = function()
  --     require("mason-lspconfig").setup({
  --       ensure_installed = {
  --         "lua_ls",
  --         "tsserver",
  --         "astro",
  --       },
  --       handlers = {
  --         function(ls)
  --           require("lspconfig")[ls].setup({})
  --         end,
  --       },
  --     })
  --   end,
  -- },
  -- {
  --   "williamboman/mason.nvim",
  --   opts = { ui = { border = "single" } },
  -- },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   event = "InsertEnter",
  --   dependencies = {
  --     "L3MON4D3/LuaSnip", -- snippet engine
  --     "onsails/lspkind.nvim", -- vs-code like pictograms
  --     "hrsh7th/cmp-nvim-lsp",
  --   },
  --   config = function()
  --     local cmp = require("cmp")
  --     local luasnip = require("luasnip")
  --     local lspkind = require("lspkind")
  --
  --     -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
  --     require("luasnip.loaders.from_vscode").lazy_load()
  --
  --     print("hi")
  --     cmp.setup({
  --       completion = {
  --         completeopt = vim.o.completeopt,
  --       },
  --       snippet = { -- configure how nvim-cmp interacts with snippet engine
  --         expand = function(args)
  --           luasnip.lsp_expand(args.body)
  --         end,
  --       },
  --       mapping = cmp.mapping.preset.insert({
  --         ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
  --         ["<C-e>"] = cmp.mapping.abort(), -- close completion window
  --         ["<CR>"] = cmp.mapping.confirm({ select = false }),
  --       }),
  --       sources = cmp.config.sources({
  --         { name = "nvim_lsp" },
  --       }),
  --       formatting = {
  --         format = lspkind.cmp_format({
  --           maxwidth = 50,
  --           ellipsis_char = "...",
  --         }),
  --       },
  --     })
  --   end,
  -- },
})
