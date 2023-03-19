-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.background = "light"
-- opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20"
vim.api.nvim_create_user_command("BuildRun", function()
  local overseer = require("overseer")
  -- local task = overseer.new_task({
  --   name = "Build and serve app",
  --   strategy = {
  --     "orchestrator",
  --     tasks = {
  --       "g++ build",
  --       "c output",
  --     },
  --   },
  -- })
  -- task:start()
  overseer.run_template({ name = "c output", autostart = false }, function(task)
    if task then
      task:add_component({
        "dependencies",
        task_names = {
          "g++ build",
        },
        sequential = true,
      })
      task:subscribe("on_start", function()
        overseer.run_action(task, "open vsplit")
        return false
      end)
      task:start()
    end
  end)
end, {})

vim.api.nvim_create_user_command("RunOutput", function()
  local overseer = require("overseer")
  overseer.run_template({ name = "c output" }, function(task)
    if task then
      overseer.run_action(task, "open vsplit")
      task:start()
    else
      vim.notify("RunOutput not supported for filetype" .. vim.bo.filetype, vim.log.levels.ERROR)
    end
  end)
end, {})

vim.api.nvim_create_user_command("WatchRun", function()
  local overseer = require("overseer")
  overseer.run_template({ name = "run script" }, function(task)
    if task then
      task:add_component({ "restart_on_save", path = vim.fn.expand("%:p") })
      local main_win = vim.api.nvim_get_current_win()
      overseer.run_action(task, "open hsplit")
      vim.api.nvim_set_current_win(main_win)
    else
      vim.notify("WatchRun not supported for filetype " .. vim.bo.filetype, vim.log.levels.ERROR)
    end
  end)
end, {})

vim.api.nvim_create_user_command("WatchBuild", function()
  local overseer = require("overseer")

  overseer.run_template({ name = "g++ build" }, function(task)
    if task then
      task:add_component({ "restart_on_save", path = vim.fn.expand("%:p") })
    else
      vim.notify("WatchBuild not supported for filetype" .. vim.bo.filetype, vim.log.levels.ERROR)
    end
  end)
end, {})
