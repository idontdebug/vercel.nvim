-- snacks.nvim start screen with the triangle as its header.
-- The theme does not load this file; paste its contents into your own snacks config.
local logo = require("vercel.logo")

require("snacks").setup({
  dashboard = {
    preset = {
      header = table.concat(logo.header({ size = "large" }), "\n"),
      keys = {
        { icon = "", key = "f", desc = "查找文件", action = ":lua Snacks.dashboard.pick('files')" },
        { icon = "", key = "n", desc = "新建文件", action = ":ene | startinsert" },
        { icon = "", key = "g", desc = "全局搜索", action = ":lua Snacks.dashboard.pick('live_grep')" },
        { icon = "", key = "r", desc = "最近文件", action = ":lua Snacks.dashboard.pick('oldfiles')" },
        { icon = "", key = "c", desc = "配置", action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })" },
        { icon = "", key = "L", desc = "Lazy", action = ":Lazy" },
        { icon = "", key = "q", desc = "退出", action = ":qa" },
      },
    },
    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 1 },
      { section = "startup" },
    },
  },
})
