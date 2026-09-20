---The triangle logo as characters, for lualine components and dashboard headers.
---The theme never renders these characters itself; reference them from your own plugin config.
---
---The art has no leading spaces: alpha-nvim, snacks.nvim and dashboard-nvim center line by line,
---so built-in indentation would stack with their centering and push the art to the right. Pass align = "center" to center it yourself.
local M = {}

---A single character, suited to the statusline
M.glyph = "▲"

---Hollow variant, paired with M.glyph, e.g. to tell staged from unstaged
M.outline = "△"

---4 rows, for narrow terminals
M.small = {
  "█",
  "███",
  "█████",
  "███████",
}

---8 rows, for start screens
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

---Center a line within width
---@param line string
---@param width integer
---@return string
local function center(line, width)
  local pad = math.max(0, math.floor((width - vim.fn.strdisplaywidth(line)) / 2))
  return string.rep(" ", pad) .. line
end

---Combine the logo and a line of text into a header
---@param opts table|nil
---  size  "large" (default) or "small"
---  text  caption under the logo, default "vercel.nvim"; false omits it
---  gap   blank lines between logo and caption, default 1
---  align "none" (default, the renderer centers each line) or "center" (pad with leading spaces here)
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
    -- The caption may be wider than the art, so center on the larger of the two
    width = math.max(width, text and vim.fn.strdisplaywidth(text) or 0)
    for i, line in ipairs(lines) do
      lines[i] = line ~= "" and center(line, width) or line
    end
  end

  return lines
end

return M
