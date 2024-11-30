--  TODO: Use config template from docs

return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufNewFile", "BufReadPost" },
  build = function()
    vim.cmd("TSUpdate")
  end,
  cmd = "TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      ensure_installed = {
        "c",
        "cpp",
        "css",
        "astro",
        "typescript",
        "javascript",
        "tsx",
        "haskell",
        "html",
        "java",
        "rust",
        "ron",
      },
      highlight = {
        additional_vim_regex_highlighting = true,
        enable = true,
      },
      textsubjects = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
