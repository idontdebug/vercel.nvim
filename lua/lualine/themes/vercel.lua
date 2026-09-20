-- lualine 主题：require("lualine").setup({ options = { theme = "vercel" } })
local ok, vercel = pcall(require, "vercel")
if not ok then
  return {}
end

local c = vercel.colors or vercel.palette()

local function mode(color)
  return { a = { fg = c.bg_dark, bg = color, gui = "bold" } }
end

local base = {
  b = { fg = c.fg_dim, bg = c.gray_200 },
  c = { fg = c.fg_subtle, bg = c.bg_statusline },
}

local theme = {
  normal   = vim.tbl_extend("force", { a = mode(c.fg).a }, base),
  insert   = vim.tbl_extend("force", { a = mode(c.blue).a }, base),
  visual   = vim.tbl_extend("force", { a = mode(c.purple).a }, base),
  replace  = vim.tbl_extend("force", { a = mode(c.red).a }, base),
  command  = vim.tbl_extend("force", { a = mode(c.amber).a }, base),
  terminal = vim.tbl_extend("force", { a = mode(c.green).a }, base),
  inactive = {
    a = { fg = c.fg_faint, bg = c.bg_statusline },
    b = { fg = c.fg_faint, bg = c.bg_statusline },
    c = { fg = c.fg_faint, bg = c.bg_statusline },
  },
}

return theme
