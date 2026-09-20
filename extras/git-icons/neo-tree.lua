-- neo-tree.nvim 文件树里的 git 状态图标，换成三角形。
-- 这个文件不会被主题自动加载，把内容粘进你自己的 neo-tree 配置即可。
--
-- neo-tree 把状态分成两组：change type（added / deleted / modified / renamed）
-- 和 status type（untracked / ignored / unstaged / staged / conflict）。
-- 这里只改 modified 和 staged 这一对，用空心和实心三角区分，
-- 其余保持 neo-tree 默认，它们靠形状区分，全换成三角就看不出差别了。
local logo = require("vercel.logo")

require("neo-tree").setup({
  default_component_configs = {
    git_status = {
      symbols = {
        modified = logo.outline, -- △ 已修改
        staged = logo.glyph, -- ▲ 已暂存
      },
      align = "right",
    },
  },
})
