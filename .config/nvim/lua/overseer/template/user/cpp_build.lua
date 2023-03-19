return {
  name = "g++ build",
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand("%:p")
    local output = vim.fn.expand("%:r")
    return {
      cmd = { "g++" },
      args = { file, "-o", output },
      -- components = { { "on_output_quickfix", open = true }, "default" },
      components = {
        -- { "on_output_quickfix", set_diagnostics = true },
        -- "on_result_diagnostics",
        "default",
      },
    }
  end,
  condition = {
    filetype = { "cpp" },
  },
}
