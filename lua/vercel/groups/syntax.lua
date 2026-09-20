local util = require("vercel.util")

---传统 Vim 语法组。设计原则：正文保持中性灰白，
---强调色只用于关键字、函数、字符串、字面量与类型五类。
return function(c, config)
  local s = config.styles

  return {
    Comment        = util.style({ fg = c.comment }, s.comments),

    Constant       = { fg = c.amber },
    String         = util.style({ fg = c.green }, s.strings),
    Character      = { fg = c.green },
    Number         = { fg = c.amber },
    Float          = { fg = c.amber },
    Boolean        = util.style({ fg = c.amber }, s.booleans),

    Identifier     = util.style({ fg = c.fg }, s.variables),
    Function       = util.style({ fg = c.blue }, s.functions),

    Statement      = util.style({ fg = c.purple }, s.keywords),
    Conditional    = util.style({ fg = c.purple }, s.keywords),
    Repeat         = util.style({ fg = c.purple }, s.keywords),
    Label          = { fg = c.purple },
    Operator       = { fg = c.fg_dim },
    Keyword        = util.style({ fg = c.purple }, s.keywords),
    Exception      = util.style({ fg = c.pink }, s.keywords),

    PreProc        = { fg = c.pink },
    Include        = util.style({ fg = c.pink }, s.keywords),
    Define         = { fg = c.pink },
    Macro          = { fg = c.pink },
    PreCondit      = { fg = c.pink },

    Type           = util.style({ fg = c.cyan }, s.types),
    StorageClass   = util.style({ fg = c.purple }, s.keywords),
    Structure      = util.style({ fg = c.cyan }, s.types),
    Typedef        = util.style({ fg = c.cyan }, s.types),

    Special        = { fg = c.pink },
    SpecialChar    = { fg = c.pink },
    Tag            = { fg = c.blue },
    Delimiter      = { fg = c.fg_muted },
    SpecialComment = { fg = c.fg_muted, italic = s.comments and s.comments.italic or false },
    Debug          = { fg = c.orange },

    Underlined     = { underline = true },
    Bold           = { bold = true },
    Italic         = { italic = true },
    Ignore         = { fg = c.fg_faint },
    Error          = { fg = c.error },
    Todo           = { fg = c.bg_dark, bg = c.amber, bold = true },
  }
end
