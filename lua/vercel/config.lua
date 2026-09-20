local M = {}

---@class VercelConfig
M.defaults = {
  -- "black" = 纯黑 #000000（Vercel 官网风格）；"soft" = #0a0a0a
  background = "black",
  -- 背景透明，交给终端渲染
  transparent = false,
  -- 设置 g:terminal_color_0..15
  terminal_colors = true,
  -- 非当前窗口使用更暗的背景
  dim_inactive = false,
  -- 浮动窗口边框："none" | "single"（single 时给 FloatBorder 单独上色）
  float_border = "single",
  -- 侧边栏类窗口使用 bg_sidebar 背景
  sidebars = { "qf", "help", "NvimTree", "neo-tree", "Trouble", "trouble", "lazy", "mason", "fugitive" },
  -- 各类语法元素的字体样式
  styles = {
    comments   = { italic = true },
    keywords   = { italic = false },
    functions  = {},
    variables  = {},
    types      = {},
    strings    = {},
    booleans   = { bold = true },
    parameters = { italic = true },
  },
  -- 在颜色生成后修改调色板：function(colors) end
  on_colors = nil,
  -- 在高亮生成后修改高亮组：function(highlights, colors) end
  on_highlights = nil,
}

M.options = vim.deepcopy(M.defaults)

---@param opts table|nil
function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", vim.deepcopy(M.defaults), opts or {})
  return M.options
end

---@param opts table|nil
---@return VercelConfig
function M.extend(opts)
  if not opts then
    return M.options
  end
  return vim.tbl_deep_extend("force", vim.deepcopy(M.options), opts)
end

return M
