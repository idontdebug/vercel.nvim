local M = {}

---@param hex string "#rrggbb"
---@return number, number, number
local function hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

---Blend fg onto bg by the alpha ratio
---@param fg string
---@param bg string
---@param alpha number 0..1, where 1 means pure fg
---@return string
function M.blend(fg, bg, alpha)
  if fg == "NONE" or bg == "NONE" then
    return fg
  end
  local fr, fg_, fb = hex_to_rgb(fg)
  local br, bg_, bb = hex_to_rgb(bg)
  local function mix(f, b)
    local v = math.floor(f * alpha + b * (1 - alpha) + 0.5)
    return math.min(255, math.max(0, v))
  end
  return string.format("#%02x%02x%02x", mix(fr, br), mix(fg_, bg_), mix(fb, bb))
end

function M.darken(hex, amount, bg)
  return M.blend(hex, bg or "#000000", amount)
end

function M.lighten(hex, amount, fg)
  return M.blend(hex, fg or "#ffffff", amount)
end

---Merge style tables (e.g. { italic = true }) into a highlight definition
---@param base table
---@param ... table|nil
---@return table
function M.style(base, ...)
  local out = vim.tbl_extend("force", {}, base)
  for _, extra in ipairs({ ... }) do
    if type(extra) == "table" then
      out = vim.tbl_extend("force", out, extra)
    end
  end
  return out
end

---Apply highlight groups in bulk
---@param groups table<string, table>
function M.apply(groups)
  for name, spec in pairs(groups) do
    if spec.link then
      vim.api.nvim_set_hl(0, name, { link = spec.link, default = spec.default })
    else
      vim.api.nvim_set_hl(0, name, spec)
    end
  end
end

return M
