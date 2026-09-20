---三角标志的字符形式，供 lualine 组件和 dashboard header 使用。
---主题本身不会渲染这些字符，需要你在自己的插件配置里引用。
local M = {}

---单个字符，适合放在状态栏里
M.glyph = "▲"

---4 行，适合窄终端
M.small = {
  "   █",
  "  ███",
  " █████",
  "███████",
}

---8 行，适合启动页
M.large = {
  "       █",
  "      ███",
  "     █████",
  "    ███████",
  "   █████████",
  "  ███████████",
  " █████████████",
  "███████████████",
}

---把标志和一行文字组成 header
---@param opts table|nil { size = "large"|"small", text = "vercel.nvim", gap = 1 }
---@return string[]
function M.header(opts)
  opts = opts or {}
  local lines = vim.deepcopy(opts.size == "small" and M.small or M.large)
  local text = opts.text ~= false and (opts.text or "vercel.nvim") or nil
  if text then
    for _ = 1, (opts.gap or 1) do
      table.insert(lines, "")
    end
    -- 按标志宽度居中
    local width = 0
    for _, line in ipairs(lines) do
      width = math.max(width, vim.fn.strdisplaywidth(line))
    end
    local pad = math.max(0, math.floor((width - vim.fn.strdisplaywidth(text)) / 2))
    table.insert(lines, string.rep(" ", pad) .. text)
  end
  return lines
end

return M
