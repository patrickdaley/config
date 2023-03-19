return {
  name = "c output",
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand("%:r")
    local cmd = { "./" .. file }
    return {
      cmd = cmd,
      -- args = { file },
      -- components = { { "on_output_quickfix", open = true }, "default" },
      components = {
        { "on_output_quickfix", tail = false },
        "on_complete_dispose",
      },
    }
  end,
}
