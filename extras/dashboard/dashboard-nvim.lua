-- dashboard-nvim start screen with the triangle as its header.
-- The theme does not load this file; paste its contents into your own dashboard config.
local logo = require("vercel.logo")

local header = { "" }
vim.list_extend(header, logo.header({ size = "large" }))
table.insert(header, "")

require("dashboard").setup({
  theme = "doom",
  config = {
    header = header,
    center = {
      { key = "f", desc = " 查找文件", action = "Telescope find_files" },
      { key = "n", desc = " 新建文件", action = "ene | startinsert" },
      { key = "r", desc = " 最近文件", action = "Telescope oldfiles" },
      { key = "g", desc = " 全局搜索", action = "Telescope live_grep" },
      { key = "l", desc = " Lazy", action = "Lazy" },
      { key = "q", desc = " 退出", action = "qa" },
    },
    footer = {},
  },
})
