---A ready-made lualine config whose mode section carries the triangle.
---Colors come from lua/lualine/themes/vercel.lua; this file only lays out the sections.
---
---  require("vercel.lualine").setup()
---
---Or take the config and modify it yourself:
---
---  require("lualine").setup(require("vercel.lualine").opts({
---    options = { globalstatus = false },
---  }))
local logo = require("vercel.logo")

local M = {}

---@param overrides table|nil deep-merged onto the defaults
---@return table
function M.opts(overrides)
  local opts = {
    options = {
      theme = "vercel",
      globalstatus = true,
      -- Geist's UI uses no separators; sections are divided by spacing and background
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

---Equivalent to require("lualine").setup(M.opts(overrides))
---@param overrides table|nil
function M.setup(overrides)
  require("lualine").setup(M.opts(overrides))
end

return M
