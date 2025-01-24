return {
  "neovim/nvim-lspconfig",
  -- config = function()
  --   require("mason-lspconfig").setup({
  --     ensure_installed = {
  --       "lua_ls",
  --       "tsserver",
  --       "astro",
  --     },
  --     handlers = {
  --       function(ls)
  --         require("lspconfig")[ls].setup({})
  --       end,
  --     },
  --   })
  -- end,
  opts = {
    diagnostics = {
      virtual_text = false,
    },
    inlay_hints = {
      enabled = false,
    },
    servers = {
      astro = {},
      -- Ensure mason installs the server
      clangd = {
        keys = {
          { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
        },
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern(
            "Makefile",
            "configure.ac",
            "configure.in",
            "config.h.in",
            "meson.build",
            "meson_options.txt",
            "build.ninja"
          )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
            fname
          ) or require("lspconfig.util").find_git_ancestor(fname)
        end,
        capabilities = {
          offsetEncoding = { "utf-16" },
        },
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
        },
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
        },
      },
      gopls = {
        settings = {
          gopls = {
            usePlaceholders = false,
          },
        },
      },
      jdtls = {},
      sqls = {},
      shopify_theme_ls = {},
      taplo = {
        keys = {
          {
            "K",
            function()
              if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
                require("crates").show_popup()
              else
                vim.lsp.buf.hover()
              end
            end,
            desc = "Show Crate Documentation",
          },
        },
      },
      -- sqlls = {
      --   root_dir = function(_)
      --     return vim.loop.cwd()
      --   end,
      --   settings = {
      --     connections = {
      --       {
      --         name = "chinook",
      --         database = "chinook",
      --         adapter = "postgres",
      --         user = "patrick",
      --         password = "ghs0td0ggy",
      --         projectPaths = { "/home/patrick/Study/psql-art/app/" }
      --       }
      --     }
      --   }
      -- }
      rust_analyzer = { enabled = false },
    },
    setup = {
      clangd = function(_, opts)
        local clangd_ext_opts = require("lazyvim.util").opts("clangd_extensions.nvim")
        require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
        return false
      end,
      hls = function()
        return true
      end,
      jdtls = function()
        return true
      end,
    },
  },
}
