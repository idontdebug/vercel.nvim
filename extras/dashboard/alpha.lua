-- alpha-nvim start screen with the triangle as its header.
-- The theme does not load this file; paste its contents into your own alpha config.
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local logo = require("vercel.logo")

dashboard.section.header.val = logo.header({ size = "large" })
dashboard.section.header.opts.hl = "AlphaHeader"

dashboard.section.buttons.val = {
  dashboard.button("f", "查找文件", "<cmd>Telescope find_files<cr>"),
  dashboard.button("n", "新建文件", "<cmd>ene | startinsert<cr>"),
  dashboard.button("r", "最近文件", "<cmd>Telescope oldfiles<cr>"),
  dashboard.button("g", "全局搜索", "<cmd>Telescope live_grep<cr>"),
  dashboard.button("c", "配置", "<cmd>e $MYVIMRC<cr>"),
  dashboard.button("l", "Lazy", "<cmd>Lazy<cr>"),
  dashboard.button("q", "退出", "<cmd>qa<cr>"),
}

for _, button in ipairs(dashboard.section.buttons.val) do
  button.opts.hl = "AlphaButtons"
  button.opts.hl_shortcut = "AlphaShortcut"
end

dashboard.section.footer.opts.hl = "AlphaFooter"
dashboard.opts.layout[1].val = 6

alpha.setup(dashboard.config)
