-- snacks.nvim 的 explorer 和 picker 里的 git 状态图标，换成三角形。
-- 这个文件不会被主题自动加载，把内容粘进你自己的 snacks 配置即可。
--
-- snacks 的默认值是 modified = "○"、staged = "●"，用空心和实心区分两种状态。
-- 这里换成 △ 和 ▲，保持同样的区分方式，宽度也一样是一格。
-- 其余几个状态（added / deleted / renamed 等）保持 snacks 默认的 Nerd Font 图标，
-- 因为它们本来就靠形状区分，全换成三角反而分不出来。
local logo = require("vercel.logo")

require("snacks").setup({
  picker = {
    icons = {
      git = {
        modified = logo.outline, -- △ 已修改，未暂存
        staged = logo.glyph, -- ▲ 已暂存
      },
    },
  },
})

-- 如果你要连未跟踪的文件一起改：
--
--   git = {
--     modified  = logo.outline,
--     staged    = logo.glyph,
--     untracked = logo.outline,
--   },
