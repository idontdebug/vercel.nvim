---vercel.nvim — a dark Neovim colorscheme based on the Vercel Geist design system
local config = require("vercel.config")
local palette = require("vercel.palette")
local groups = require("vercel.groups")
local util = require("vercel.util")

local M = {}

M.config = config

---@param opts table|nil
function M.setup(opts)
  return config.setup(opts)
end

---Write the palette to g:terminal_color_0..15
---@param c table
local function set_terminal_colors(c)
  local g = vim.g
  g.terminal_color_0  = c.gray_200
  g.terminal_color_8  = c.gray_600
  g.terminal_color_1  = c.red
  g.terminal_color_9  = util.lighten(c.red, 0.20)
  g.terminal_color_2  = c.green
  g.terminal_color_10 = util.lighten(c.green, 0.20)
  g.terminal_color_3  = c.amber
  g.terminal_color_11 = util.lighten(c.amber, 0.20)
  g.terminal_color_4  = c.blue
  g.terminal_color_12 = util.lighten(c.blue, 0.20)
  g.terminal_color_5  = c.purple
  g.terminal_color_13 = util.lighten(c.purple, 0.20)
  g.terminal_color_6  = c.cyan
  g.terminal_color_14 = util.lighten(c.cyan, 0.20)
  g.terminal_color_7  = c.fg_dim
  g.terminal_color_15 = c.fg
end

---Apply the NormalSB background to sidebar-type windows
---@param opts table
local function setup_sidebars(opts)
  if not opts.sidebars or #opts.sidebars == 0 then
    return
  end
  local group = vim.api.nvim_create_augroup("VercelSidebars", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = opts.sidebars,
    callback = function()
      vim.opt_local.winhighlight:append("Normal:NormalSB,NormalNC:NormalSB,SignColumn:NormalSB")
    end,
  })
end

---Load the colorscheme
---@param opts table|nil one-off config overrides, not written back to the global settings
function M.load(opts)
  local o = config.extend(opts)

  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = o.background == "soft" and "vercel-soft" or "vercel"

  local c = palette.get(o)
  util.apply(groups.setup(c, o))

  if o.terminal_colors then
    set_terminal_colors(c)
  end

  setup_sidebars(o)

  M.colors = c
  return c
end

---Get the palette for the current config (without loading the theme)
---@param opts table|nil
---@return table
function M.palette(opts)
  return palette.get(config.extend(opts))
end

return M
