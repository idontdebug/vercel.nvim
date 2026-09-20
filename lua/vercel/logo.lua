---三角标志的字符形式，供 lualine 组件和 dashboard header 使用。
---主题本身不会渲染这些字符，需要你在自己的插件配置里引用。
---
---图形不带前导空格：alpha-nvim、snacks.nvim、dashboard-nvim 都会逐行居中，
---自带缩进会和它们的居中叠加，把图形推向右边。需要自己居中时传 align = "center"。
local M = {}

---单个字符，适合放在状态栏里
M.glyph = "▲"

---4 行，适合窄终端
M.small = {
  "█",
  "███",
  "█████",
  "███████",
}

---8 行，适合启动页
M.large = {
  "█",
  "███",
  "█████",
  "███████",
  "█████████",
  "███████████",
  "█████████████",
  "███████████████",
}

---@param lines string[]
---@return integer
local function max_width(lines)
  local width = 0
  for _, line in ipairs(lines) do
    width = math.max(width, vim.fn.strdisplaywidth(line))
  end
  return width
end

---把一行按 width 居中
---@param line string
---@param width integer
---@return string
local function center(line, width)
  local pad = math.max(0, math.floor((width - vim.fn.strdisplaywidth(line)) / 2))
  return string.rep(" ", pad) .. line
end

---把标志和一行文字组成 header
---@param opts table|nil
---  size  "large"（默认）或 "small"
---  text  标志下方的文字，默认 "vercel.nvim"，传 false 则不加
---  gap   标志与文字之间的空行数，默认 1
---  align "none"（默认，交给渲染方逐行居中）或 "center"（自己补前导空格）
---@return string[]
function M.header(opts)
  opts = opts or {}
  local lines = vim.deepcopy(opts.size == "small" and M.small or M.large)
  local width = max_width(lines)

  local text = opts.text ~= false and (opts.text or "vercel.nvim") or nil
  if text then
    for _ = 1, (opts.gap or 1) do
      table.insert(lines, "")
    end
    table.insert(lines, text)
  end

  if opts.align == "center" then
    -- 文字可能比图形宽，按两者的较大值居中
    width = math.max(width, text and vim.fn.strdisplaywidth(text) or 0)
    for i, line in ipairs(lines) do
      lines[i] = line ~= "" and center(line, width) or line
    end
  end

  return lines
end

return M
