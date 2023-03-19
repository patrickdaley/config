return {
  name = "run script",
  builder = function()
    local file = vim.fn.expand("%:p")
    local cmd = { file }
    if vim.bo.filetype == "go" then
      cmd = { "go", "run", file }
    end
    return {
      cmd = cmd,
      components = {
        { "on_output_quickfix", open = true, set_diagnostics = true },
        { "on_result_diagnostics_quickfix", open = true },
        "default",
      },
    }
  end,
  condition = {
    filetype = { "sh", "python", "go" },
  },
}
