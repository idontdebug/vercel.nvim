local M = {}

---@class VercelConfig
M.defaults = {
  -- "black" = pure black #000000 (vercel.com style); "soft" = #0a0a0a
  background = "black",
  -- Transparent background; let the terminal render it
  transparent = false,
  -- Set g:terminal_color_0..15
  terminal_colors = true,
  -- Use a darker background for non-current windows
  dim_inactive = false,
  -- Float window border: "none" | "single" (single colors FloatBorder separately)
  float_border = "single",
  -- Sidebar-type windows use the bg_sidebar background
  sidebars = { "qf", "help", "NvimTree", "neo-tree", "Trouble", "trouble", "lazy", "mason", "fugitive" },
  -- Font styles for each kind of syntax element
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
  -- Modify the palette after colors are generated: function(colors) end
  on_colors = nil,
  -- Modify highlight groups after they are generated: function(highlights, colors) end
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
