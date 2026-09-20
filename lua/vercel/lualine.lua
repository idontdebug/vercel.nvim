---一份现成的 lualine 配置，模式段带三角标志。
---颜色来自 lua/lualine/themes/vercel.lua；这个文件只负责 sections 的排布。
---
---  require("vercel.lualine").setup()
---
---或者取出配置再自己改：
---
---  require("lualine").setup(require("vercel.lualine").opts({
---    options = { globalstatus = false },
---  }))
local logo = require("vercel.logo")

local M = {}

---@param overrides table|nil 深度合并到默认配置上
---@return table
function M.opts(overrides)
  local opts = {
    options = {
      theme = "vercel",
      globalstatus = true,
      -- Geist 的界面不用分隔符，靠留白和底色分段
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = {
        {
          "mode",
          fmt = function(str)
            return logo.glyph .. " " .. str
          end,
        },
      },
      lualine_b = { "branch" },
      lualine_c = {
        { "filename", path = 1, symbols = { modified = " ●", readonly = " ○", newfile = " +" } },
        "diagnostics",
      },
      lualine_x = { "diff", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
  }

  if overrides then
    opts = vim.tbl_deep_extend("force", opts, overrides)
  end
  return opts
end

---等价于 require("lualine").setup(M.opts(overrides))
---@param overrides table|nil
function M.setup(overrides)
  require("lualine").setup(M.opts(overrides))
end

return M
