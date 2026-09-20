local util = require("vercel.util")

return function(c, config)
  local s = config.styles

  return {
    -- Identifiers
    ["@variable"]                   = util.style({ fg = c.fg }, s.variables),
    ["@variable.builtin"]           = { fg = c.pink, italic = true },
    ["@variable.parameter"]         = util.style({ fg = c.fg_dim }, s.parameters),
    ["@variable.parameter.builtin"] = { fg = c.pink, italic = true },
    ["@variable.member"]            = { fg = c.fg_dim },

    ["@constant"]                   = { fg = c.amber },
    ["@constant.builtin"]           = { fg = c.amber, italic = true },
    ["@constant.macro"]             = { fg = c.pink },

    ["@module"]                     = { fg = c.cyan },
    ["@module.builtin"]             = { fg = c.cyan, italic = true },
    ["@label"]                      = { fg = c.purple },

    -- Literals
    ["@string"]                     = util.style({ fg = c.green }, s.strings),
    ["@string.documentation"]       = { fg = c.green },
    ["@string.regexp"]              = { fg = c.cyan },
    ["@string.escape"]              = { fg = c.pink, bold = true },
    ["@string.special"]             = { fg = c.pink },
    ["@string.special.symbol"]      = { fg = c.amber },
    ["@string.special.path"]        = { fg = c.blue, underline = true },
    ["@string.special.url"]         = { fg = c.blue, underline = true },
    ["@character"]                  = { fg = c.green },
    ["@character.special"]          = { fg = c.pink },
    ["@boolean"]                    = util.style({ fg = c.amber }, s.booleans),
    ["@number"]                     = { fg = c.amber },
    ["@number.float"]               = { fg = c.amber },

    -- Types
    ["@type"]                       = util.style({ fg = c.cyan }, s.types),
    ["@type.builtin"]               = util.style({ fg = c.cyan }, s.types),
    ["@type.definition"]            = util.style({ fg = c.cyan }, s.types),
    ["@type.qualifier"]             = util.style({ fg = c.purple }, s.keywords),
    ["@attribute"]                  = { fg = c.pink },
    ["@attribute.builtin"]          = { fg = c.pink },
    ["@property"]                   = { fg = c.fg_dim },

    -- Functions
    ["@function"]                   = util.style({ fg = c.blue }, s.functions),
    ["@function.builtin"]           = util.style({ fg = c.blue, italic = true }, s.functions),
    ["@function.call"]              = util.style({ fg = c.blue }, s.functions),
    ["@function.macro"]             = { fg = c.pink },
    ["@function.method"]            = util.style({ fg = c.blue }, s.functions),
    ["@function.method.call"]       = util.style({ fg = c.blue }, s.functions),
    ["@constructor"]                = { fg = c.cyan },
    ["@operator"]                   = { fg = c.fg_dim },

    -- Keywords
    ["@keyword"]                     = util.style({ fg = c.purple }, s.keywords),
    ["@keyword.coroutine"]           = util.style({ fg = c.purple }, s.keywords),
    ["@keyword.function"]            = util.style({ fg = c.purple }, s.keywords),
    ["@keyword.operator"]            = util.style({ fg = c.purple }, s.keywords),
    ["@keyword.import"]              = util.style({ fg = c.pink }, s.keywords),
    ["@keyword.type"]                = util.style({ fg = c.purple }, s.keywords),
    ["@keyword.modifier"]            = util.style({ fg = c.purple }, s.keywords),
    ["@keyword.repeat"]              = util.style({ fg = c.purple }, s.keywords),
    ["@keyword.return"]              = util.style({ fg = c.pink }, s.keywords),
    ["@keyword.debug"]               = { fg = c.orange },
    ["@keyword.exception"]           = util.style({ fg = c.pink }, s.keywords),
    ["@keyword.conditional"]         = util.style({ fg = c.purple }, s.keywords),
    ["@keyword.conditional.ternary"] = { fg = c.fg_dim },
    ["@keyword.directive"]           = { fg = c.pink },
    ["@keyword.directive.define"]    = { fg = c.pink },

    -- Punctuation
    ["@punctuation.delimiter"]      = { fg = c.fg_muted },
    ["@punctuation.bracket"]        = { fg = c.fg_muted },
    ["@punctuation.special"]        = { fg = c.pink },

    -- Comments
    ["@comment"]                    = util.style({ fg = c.comment }, s.comments),
    ["@comment.documentation"]      = util.style({ fg = c.fg_subtle }, s.comments),
    ["@comment.error"]              = { fg = c.bg_dark, bg = c.error, bold = true },
    ["@comment.warning"]            = { fg = c.bg_dark, bg = c.warn, bold = true },
    ["@comment.todo"]               = { fg = c.bg_dark, bg = c.blue, bold = true },
    ["@comment.note"]               = { fg = c.bg_dark, bg = c.cyan, bold = true },

    -- Markup
    ["@markup"]                     = { fg = c.fg },
    ["@markup.strong"]              = { fg = c.fg, bold = true },
    ["@markup.italic"]              = { fg = c.fg, italic = true },
    ["@markup.strikethrough"]       = { fg = c.fg_muted, strikethrough = true },
    ["@markup.underline"]           = { underline = true },
    ["@markup.heading"]             = { fg = c.fg, bold = true },
    ["@markup.heading.1"]           = { fg = c.fg, bold = true },
    ["@markup.heading.2"]           = { fg = c.blue, bold = true },
    ["@markup.heading.3"]           = { fg = c.cyan, bold = true },
    ["@markup.heading.4"]           = { fg = c.purple, bold = true },
    ["@markup.heading.5"]           = { fg = c.pink, bold = true },
    ["@markup.heading.6"]           = { fg = c.fg_dim, bold = true },
    ["@markup.quote"]               = { fg = c.fg_muted, italic = true },
    ["@markup.math"]                = { fg = c.cyan },
    ["@markup.link"]                = { fg = c.fg_dim },
    ["@markup.link.label"]          = { fg = c.blue },
    ["@markup.link.url"]            = { fg = c.fg_subtle, underline = true },
    ["@markup.raw"]                 = { fg = c.green },
    ["@markup.raw.block"]           = { fg = c.fg_dim },
    ["@markup.list"]                = { fg = c.blue },
    ["@markup.list.checked"]        = { fg = c.ok },
    ["@markup.list.unchecked"]      = { fg = c.fg_muted },

    ["@diff.plus"]                  = { fg = c.git_add },
    ["@diff.minus"]                 = { fg = c.git_delete },
    ["@diff.delta"]                 = { fg = c.git_change },

    -- Tags: HTML / JSX / Vue
    ["@tag"]                        = { fg = c.blue },
    ["@tag.builtin"]                = { fg = c.blue },
    ["@tag.attribute"]              = { fg = c.cyan, italic = true },
    ["@tag.delimiter"]              = { fg = c.fg_muted },

    ["@none"]                       = { fg = c.fg },
    ["@conceal"]                    = { fg = c.fg_faint },
    ["@error"]                      = { fg = c.error },

    -- Per-language tweaks
    ["@variable.member.yaml"]       = { fg = c.blue },
    ["@property.json"]              = { fg = c.blue },
    ["@property.jsonc"]             = { fg = c.blue },
    ["@property.toml"]              = { fg = c.blue },
    ["@label.json"]                 = { fg = c.blue },
    ["@constructor.lua"]            = { fg = c.fg_muted },
    ["@variable.builtin.bash"]      = { fg = c.pink },
    ["@function.builtin.bash"]      = { fg = c.blue },
    ["@markup.heading.gitcommit"]   = { fg = c.fg, bold = true },
  }
end
