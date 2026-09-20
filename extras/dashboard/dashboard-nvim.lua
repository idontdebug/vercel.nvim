-- dashboard-nvim 启动页，header 换成三角标志。
-- 这个文件不会被主题自动加载，把内容粘进你自己的 dashboard 配置即可。
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
