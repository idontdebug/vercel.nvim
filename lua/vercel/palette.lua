-- Vercel / Geist 调色板
-- 参考 Vercel Geist Design System 的暗色色阶。
local M = {}

---@class VercelPalette
local geist = {
  -- 背景与灰阶（Geist gray, dark）
  black      = "#000000",
  bg_100     = "#0a0a0a",
  gray_100   = "#1a1a1a",
  gray_200   = "#1f1f1f",
  gray_300   = "#292929",
  gray_400   = "#2e2e2e",
  gray_500   = "#454545",
  gray_600   = "#575757",
  gray_700   = "#7d7d7d",
  gray_800   = "#8f8f8f",
  gray_900   = "#a1a1a1",
  gray_1000  = "#ededed",

  -- 强调色（Geist accent, dark）
  blue_700   = "#0072f5",
  blue_800   = "#0080ff",
  blue_900   = "#52a8ff",
  blue_1000  = "#eaf6ff",

  red_800    = "#e5484d",
  red_900    = "#ff6369",
  red_1000   = "#ffecee",

  amber_800  = "#ffb224",
  amber_900  = "#ffcb47",
  amber_1000 = "#fef3dd",

  green_800  = "#45a557",
  green_900  = "#62c073",
  green_1000 = "#e5fbe9",

  teal_800   = "#0f9d91",
  teal_900   = "#50e3c2",

  purple_800 = "#8e4ec6",
  purple_900 = "#bf7af0",

  pink_800   = "#ec6cb9",
  pink_900   = "#ff6fae",
}

local util = require("vercel.util")

---根据配置生成完整颜色表
---@param config table
---@return table
function M.get(config)
  local g = geist
  local bg = config.background == "soft" and g.bg_100 or g.black
  local bg_alt = config.background == "soft" and g.gray_100 or g.bg_100

  local c = {
    -- 原始色阶，供 on_highlights 使用
    geist = g,

    -- 灰阶别名
    gray_100  = g.gray_100,
    gray_200  = g.gray_200,
    gray_300  = g.gray_300,
    gray_400  = g.gray_400,
    gray_500  = g.gray_500,
    gray_600  = g.gray_600,
    gray_700  = g.gray_700,
    gray_800  = g.gray_800,
    gray_900  = g.gray_900,
    gray_1000 = g.gray_1000,

    -- 背景
    bg            = bg,
    bg_dark       = g.black,
    bg_alt        = bg_alt,
    bg_float      = bg_alt,
    bg_sidebar    = bg_alt,
    bg_statusline = bg_alt,
    bg_cursorline = g.gray_100,
    bg_visual     = util.blend(g.blue_800, bg, 0.38),
    bg_search     = util.blend(g.amber_800, bg, 0.28),
    bg_incsearch  = g.amber_800,
    bg_highlight  = g.gray_200,
    bg_inactive   = g.black,

    -- 边框
    border        = g.gray_400,
    border_strong = g.gray_500,
    border_focus  = g.gray_700,

    -- 前景
    fg            = g.gray_1000,
    fg_dim        = g.gray_900,
    fg_muted      = g.gray_800,
    fg_subtle     = g.gray_700,
    fg_faint      = g.gray_600,
    fg_gutter     = g.gray_600,
    comment       = g.gray_700,

    -- 语法强调色
    blue          = g.blue_900,
    blue_deep     = g.blue_700,
    cyan          = g.teal_900,
    green         = g.green_900,
    amber         = g.amber_900,
    orange        = g.amber_800,
    red           = g.red_900,
    red_deep      = g.red_800,
    purple        = g.purple_900,
    pink          = g.pink_900,
    magenta       = g.pink_800,

    -- 语义
    error         = g.red_900,
    warn          = g.amber_900,
    info          = g.blue_900,
    hint          = g.teal_900,
    ok            = g.green_900,

    -- Git
    git_add       = g.green_900,
    git_change    = g.amber_900,
    git_delete    = g.red_900,
    git_text      = g.blue_900,

    none          = "NONE",
  }

  -- diff 背景：低饱和叠加，不遮挡前景文字
  c.diff = {
    add    = util.blend(c.git_add, bg, 0.15),
    change = util.blend(c.git_change, bg, 0.12),
    delete = util.blend(c.git_delete, bg, 0.15),
    text   = util.blend(c.git_text, bg, 0.30),
  }

  c.diagnostic_bg = {
    error = util.blend(c.error, bg, 0.12),
    warn  = util.blend(c.warn, bg, 0.12),
    info  = util.blend(c.info, bg, 0.12),
    hint  = util.blend(c.hint, bg, 0.12),
    ok    = util.blend(c.ok, bg, 0.12),
  }

  if type(config.on_colors) == "function" then
    config.on_colors(c)
  end

  return c
end

M.raw = geist

return M
