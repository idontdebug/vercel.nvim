local M = {}

local modules = { "editor", "syntax", "treesitter", "lsp", "plugins" }

---生成全部高亮组
---@param c table 颜色表
---@param config table
---@return table<string, table>
function M.setup(c, config)
  local hl = {}
  for _, name in ipairs(modules) do
    local groups = require("vercel.groups." .. name)(c, config)
    for group, spec in pairs(groups) do
      hl[group] = spec
    end
  end

  if type(config.on_highlights) == "function" then
    config.on_highlights(hl, c)
  end

  return hl
end

return M
