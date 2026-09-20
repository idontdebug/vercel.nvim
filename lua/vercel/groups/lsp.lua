local util = require("vercel.util")

return function(c, config)
  local bg_float = config.transparent and c.none or c.bg_float

  return {
    -- Diagnostics
    DiagnosticError            = { fg = c.error },
    DiagnosticWarn             = { fg = c.warn },
    DiagnosticInfo             = { fg = c.info },
    DiagnosticHint             = { fg = c.hint },
    DiagnosticOk               = { fg = c.ok },

    DiagnosticVirtualTextError = { fg = c.error, bg = c.diagnostic_bg.error },
    DiagnosticVirtualTextWarn  = { fg = c.warn, bg = c.diagnostic_bg.warn },
    DiagnosticVirtualTextInfo  = { fg = c.info, bg = c.diagnostic_bg.info },
    DiagnosticVirtualTextHint  = { fg = c.hint, bg = c.diagnostic_bg.hint },
    DiagnosticVirtualTextOk    = { fg = c.ok, bg = c.diagnostic_bg.ok },

    DiagnosticUnderlineError   = { sp = c.error, undercurl = true },
    DiagnosticUnderlineWarn    = { sp = c.warn, undercurl = true },
    DiagnosticUnderlineInfo    = { sp = c.info, undercurl = true },
    DiagnosticUnderlineHint    = { sp = c.hint, undercurl = true },
    DiagnosticUnderlineOk      = { sp = c.ok, undercurl = true },

    DiagnosticFloatingError    = { fg = c.error, bg = bg_float },
    DiagnosticFloatingWarn     = { fg = c.warn, bg = bg_float },
    DiagnosticFloatingInfo     = { fg = c.info, bg = bg_float },
    DiagnosticFloatingHint     = { fg = c.hint, bg = bg_float },
    DiagnosticFloatingOk       = { fg = c.ok, bg = bg_float },

    DiagnosticSignError        = { fg = c.error },
    DiagnosticSignWarn         = { fg = c.warn },
    DiagnosticSignInfo         = { fg = c.info },
    DiagnosticSignHint         = { fg = c.hint },
    DiagnosticSignOk           = { fg = c.ok },

    DiagnosticUnnecessary      = { fg = c.fg_faint },
    DiagnosticDeprecated       = { fg = c.fg_muted, strikethrough = true },

    -- LSP general
    LspReferenceText            = { bg = c.gray_300 },
    LspReferenceRead            = { bg = c.gray_300 },
    LspReferenceWrite           = { bg = c.gray_400, underline = true },
    LspReferenceTarget          = { bg = c.gray_300 },
    LspSignatureActiveParameter = { fg = c.amber, bold = true },
    LspCodeLens                 = { fg = c.fg_faint, italic = true },
    LspCodeLensSeparator        = { fg = c.gray_400 },
    LspInlayHint                = { fg = c.fg_faint, bg = util.blend(c.fg_faint, c.bg, 0.10), italic = true },
    LspInfoBorder               = { fg = c.border, bg = bg_float },

    -- Semantic tokens
    ["@lsp.type.boolean"]             = { link = "@boolean" },
    ["@lsp.type.builtinType"]         = { link = "@type.builtin" },
    ["@lsp.type.comment"]             = { link = "@comment" },
    ["@lsp.type.class"]               = { link = "@type" },
    ["@lsp.type.decorator"]           = { link = "@attribute" },
    ["@lsp.type.deriveHelper"]        = { link = "@attribute" },
    ["@lsp.type.enum"]                = { link = "@type" },
    ["@lsp.type.enumMember"]          = { link = "@constant" },
    ["@lsp.type.escapeSequence"]      = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"]     = { link = "@punctuation.special" },
    ["@lsp.type.generic"]             = { link = "@variable" },
    ["@lsp.type.interface"]           = { fg = c.cyan },
    ["@lsp.type.keyword"]             = { link = "@keyword" },
    ["@lsp.type.lifetime"]            = { link = "@keyword.modifier" },
    ["@lsp.type.namespace"]           = { link = "@module" },
    ["@lsp.type.number"]              = { link = "@number" },
    ["@lsp.type.operator"]            = { link = "@operator" },
    ["@lsp.type.parameter"]           = { link = "@variable.parameter" },
    ["@lsp.type.property"]            = { link = "@property" },
    ["@lsp.type.selfKeyword"]         = { link = "@variable.builtin" },
    ["@lsp.type.selfTypeKeyword"]     = { link = "@variable.builtin" },
    ["@lsp.type.string"]              = { link = "@string" },
    ["@lsp.type.typeAlias"]           = { link = "@type.definition" },
    ["@lsp.type.unresolvedReference"] = { sp = c.error, undercurl = true },
    ["@lsp.type.variable"]            = {},

    ["@lsp.typemod.class.defaultLibrary"]      = { link = "@type.builtin" },
    ["@lsp.typemod.enum.defaultLibrary"]       = { link = "@type.builtin" },
    ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
    ["@lsp.typemod.function.defaultLibrary"]   = { link = "@function.builtin" },
    ["@lsp.typemod.keyword.async"]             = { link = "@keyword.coroutine" },
    ["@lsp.typemod.keyword.injected"]          = { link = "@keyword" },
    ["@lsp.typemod.method.defaultLibrary"]     = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"]         = { link = "@operator" },
    ["@lsp.typemod.string.injected"]           = { link = "@string" },
    ["@lsp.typemod.type.defaultLibrary"]       = { link = "@type.builtin" },
    ["@lsp.typemod.variable.defaultLibrary"]   = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"]         = { link = "@variable" },
    ["@lsp.typemod.variable.readonly"]         = { link = "@constant" },
    ["@lsp.typemod.variable.static"]           = { link = "@constant" },
    ["@lsp.mod.deprecated"]                    = { strikethrough = true },
  }
end
