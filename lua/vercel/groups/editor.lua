---@param c table
---@param config table
---@return table
return function(c, config)
  local transparent = config.transparent
  local bg = transparent and c.none or c.bg
  local bg_float = transparent and c.none or c.bg_float
  local bg_sidebar = transparent and c.none or c.bg_sidebar

  local hl = {
    Normal       = { fg = c.fg, bg = bg },
    NormalNC     = { fg = c.fg, bg = config.dim_inactive and (transparent and c.none or c.bg_inactive) or bg },
    NormalSB     = { fg = c.fg_dim, bg = bg_sidebar },
    NormalFloat  = { fg = c.fg, bg = bg_float },
    FloatBorder  = { fg = config.float_border == "none" and bg_float or c.border, bg = bg_float },
    FloatTitle   = { fg = c.fg, bg = bg_float, bold = true },
    FloatFooter  = { fg = c.fg_subtle, bg = bg_float },

    ColorColumn  = { bg = c.gray_100 },
    Conceal      = { fg = c.fg_faint },
    Cursor       = { fg = c.bg_dark, bg = c.fg },
    lCursor      = { fg = c.bg_dark, bg = c.fg },
    CursorIM     = { fg = c.bg_dark, bg = c.fg },
    CursorColumn = { bg = c.bg_cursorline },
    CursorLine   = { bg = c.bg_cursorline },
    CursorLineNr = { fg = c.fg, bold = true },
    LineNr       = { fg = c.fg_gutter },
    LineNrAbove  = { fg = c.fg_gutter },
    LineNrBelow  = { fg = c.fg_gutter },
    SignColumn   = { fg = c.fg_gutter, bg = bg },
    FoldColumn   = { fg = c.fg_gutter, bg = bg },
    Folded       = { fg = c.fg_muted, bg = c.bg_highlight },

    Directory    = { fg = c.blue },
    EndOfBuffer  = { fg = transparent and c.none or c.bg },
    ErrorMsg     = { fg = c.error },
    WarningMsg   = { fg = c.warn },
    ModeMsg      = { fg = c.fg_dim, bold = true },
    MoreMsg      = { fg = c.blue },
    MsgArea      = { fg = c.fg_dim },
    MsgSeparator = { fg = c.border, bg = bg },
    Question     = { fg = c.blue },
    Title        = { fg = c.fg, bold = true },

    NonText      = { fg = c.gray_500 },
    SpecialKey   = { fg = c.gray_500 },
    Whitespace   = { fg = c.gray_400 },

    VertSplit    = { fg = c.border },
    WinSeparator = { fg = c.border, bold = false },

    IncSearch    = { fg = c.bg_dark, bg = c.bg_incsearch, bold = true },
    CurSearch    = { fg = c.bg_dark, bg = c.amber, bold = true },
    Search       = { fg = c.fg, bg = c.bg_search },
    Substitute   = { fg = c.bg_dark, bg = c.red },
    MatchParen   = { fg = c.amber, bold = true, underline = true },

    Pmenu        = { fg = c.fg_dim, bg = c.bg_float },
    PmenuSel     = { fg = c.fg, bg = c.gray_300, bold = true },
    PmenuSbar    = { bg = c.gray_200 },
    PmenuThumb   = { bg = c.gray_500 },
    PmenuKind    = { fg = c.purple, bg = c.bg_float },
    PmenuKindSel = { fg = c.purple, bg = c.gray_300 },
    PmenuExtra   = { fg = c.fg_subtle, bg = c.bg_float },
    PmenuExtraSel = { fg = c.fg_subtle, bg = c.gray_300 },
    PmenuMatch   = { fg = c.blue, bg = c.bg_float, bold = true },
    PmenuMatchSel = { fg = c.blue, bg = c.gray_300, bold = true },
    WildMenu     = { fg = c.fg, bg = c.gray_300 },
    Menu         = { fg = c.fg, bg = c.bg_float },

    Visual       = { bg = c.bg_visual },
    VisualNOS    = { bg = c.bg_visual },

    QuickFixLine = { bg = c.bg_highlight, bold = true },

    StatusLine   = { fg = c.fg_dim, bg = c.bg_statusline },
    StatusLineNC = { fg = c.fg_faint, bg = c.bg_statusline },
    TabLine      = { fg = c.fg_subtle, bg = c.bg_alt },
    TabLineFill  = { bg = c.bg_dark },
    TabLineSel   = { fg = c.fg, bg = c.bg, bold = true },
    WinBar       = { fg = c.fg_subtle, bg = bg },
    WinBarNC     = { fg = c.fg_faint, bg = bg },

    SpellBad     = { sp = c.error, undercurl = true },
    SpellCap     = { sp = c.warn, undercurl = true },
    SpellLocal   = { sp = c.info, undercurl = true },
    SpellRare    = { sp = c.hint, undercurl = true },

    DiffAdd      = { bg = c.diff.add },
    DiffChange   = { bg = c.diff.change },
    DiffDelete   = { bg = c.diff.delete },
    DiffText     = { bg = c.diff.text },
    Added        = { fg = c.git_add },
    Changed      = { fg = c.git_change },
    Removed      = { fg = c.git_delete },

    -- 终端与其他
    debugPC      = { bg = c.diagnostic_bg.info },
    debugBreakpoint = { fg = c.red, bg = c.diagnostic_bg.error },

    healthError  = { fg = c.error },
    healthSuccess = { fg = c.ok },
    healthWarning = { fg = c.warn },

    -- 命令行补全 / 模式
    NvimInternalError = { fg = c.error },
  }

  if config.float_border == "none" then
    hl.FloatBorder = { fg = c.bg_float, bg = bg_float }
  end

  return hl
end
