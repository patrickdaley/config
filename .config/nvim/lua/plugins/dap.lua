local scan = require "plenary.scandir"

local contains = function(tbl, str)
  for _, v in ipairs(tbl) do
    if v == str then
      return true
    end
  end
  return false
end

local fileexists = function(dir, file_pattern)
  local dirs = scan.scan_dir(dir, { depth = 1, search_pattern = file_pattern })
  return contains(dirs, dir .. "/" .. file_pattern)
end

return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")

    dap.configurations.cpp = {
      {
        name = "C++ Debug And Run",
        type = "codelldb",
        request = "launch",
        program = function()
          -- First, check if exists CMakeLists.txt
          local cwd = vim.fn.getcwd()
          if fileexists(cwd, "CMakeLists.txt") then
            -- Then invoke cmake commands
            -- Then ask user to provide execute file
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          else
            local fileName = vim.fn.expand("%:t:r")
            -- create this directory
            os.execute("mkdir -p " .. "bin")
            local cmd = "!g++ -g % -o bin/" .. fileName
            -- First, compile it
            vim.cmd(cmd)
            -- Then, return it
            return "${fileDirname}/bin/" .. fileName
          end
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        runInTerminal = true,
        console = "integratedTerminal",
      },
    }
  end,
}
