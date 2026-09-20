local util = require("vercel.util")

return function(c, config)
  local bg = config.transparent and c.none or c.bg
  local bg_float = config.transparent and c.none or c.bg_float
  local bg_sidebar = config.transparent and c.none or c.bg_sidebar

  return {
    ----------------------------------------------------------------
    -- telescope.nvim
    ----------------------------------------------------------------
    TelescopeNormal       = { fg = c.fg_dim, bg = bg_float },
    TelescopeBorder       = { fg = c.border, bg = bg_float },
    TelescopeTitle        = { fg = c.bg_dark, bg = c.fg, bold = true },
    TelescopePromptNormal = { fg = c.fg, bg = c.gray_100 },
    TelescopePromptBorder = { fg = c.gray_100, bg = c.gray_100 },
    TelescopePromptTitle  = { fg = c.bg_dark, bg = c.blue, bold = true },
    TelescopePromptPrefix = { fg = c.blue },
    TelescopePromptCounter = { fg = c.fg_faint },
    TelescopeResultsTitle = { fg = c.bg_float, bg = c.bg_float },
    TelescopePreviewTitle = { fg = c.bg_dark, bg = c.green, bold = true },
    TelescopeSelection    = { fg = c.fg, bg = c.gray_200, bold = true },
    TelescopeSelectionCaret = { fg = c.blue, bg = c.gray_200 },
    TelescopeMatching     = { fg = c.blue, bold = true },
    TelescopeMultiSelection = { fg = c.amber },

    ----------------------------------------------------------------
    -- fzf-lua
    ----------------------------------------------------------------
    FzfLuaNormal      = { fg = c.fg_dim, bg = bg_float },
    FzfLuaBorder      = { fg = c.border, bg = bg_float },
    FzfLuaTitle       = { fg = c.bg_dark, bg = c.blue, bold = true },
    FzfLuaCursorLine  = { fg = c.fg, bg = c.gray_200, bold = true },
    FzfLuaFzfMatch    = { fg = c.blue, bold = true },
    FzfLuaHeaderText  = { fg = c.pink },
    FzfLuaHeaderBind  = { fg = c.cyan },
    FzfLuaPathLineNr  = { fg = c.fg_faint },
    FzfLuaPathColNr   = { fg = c.fg_faint },
    FzfLuaBufNr       = { fg = c.amber },
    FzfLuaLiveSym     = { fg = c.pink },

    ----------------------------------------------------------------
    -- nvim-cmp
    ----------------------------------------------------------------
    CmpDocumentation       = { fg = c.fg_dim, bg = bg_float },
    CmpDocumentationBorder = { fg = c.border, bg = bg_float },
    CmpGhostText           = { fg = c.fg_faint, italic = true },
    CmpItemAbbr            = { fg = c.fg_dim },
    CmpItemAbbrDeprecated  = { fg = c.fg_faint, strikethrough = true },
    CmpItemAbbrMatch       = { fg = c.blue, bold = true },
    CmpItemAbbrMatchFuzzy  = { fg = c.blue },
    CmpItemMenu            = { fg = c.fg_faint },
    CmpItemKindDefault     = { fg = c.fg_muted },
    CmpItemKindVariable    = { fg = c.fg },
    CmpItemKindField       = { fg = c.fg_dim },
    CmpItemKindProperty    = { fg = c.fg_dim },
    CmpItemKindFunction    = { fg = c.blue },
    CmpItemKindMethod      = { fg = c.blue },
    CmpItemKindConstructor = { fg = c.cyan },
    CmpItemKindClass       = { fg = c.cyan },
    CmpItemKindInterface   = { fg = c.cyan },
    CmpItemKindStruct      = { fg = c.cyan },
    CmpItemKindModule      = { fg = c.cyan },
    CmpItemKindKeyword     = { fg = c.purple },
    CmpItemKindSnippet     = { fg = c.pink },
    CmpItemKindText        = { fg = c.fg_muted },
    CmpItemKindConstant    = { fg = c.amber },
    CmpItemKindEnum        = { fg = c.amber },
    CmpItemKindEnumMember  = { fg = c.amber },
    CmpItemKindValue       = { fg = c.amber },
    CmpItemKindFile        = { fg = c.blue },
    CmpItemKindFolder      = { fg = c.blue },
    CmpItemKindColor       = { fg = c.pink },
    CmpItemKindEvent       = { fg = c.pink },
    CmpItemKindOperator    = { fg = c.fg_dim },
    CmpItemKindReference   = { fg = c.fg_dim },
    CmpItemKindTypeParameter = { fg = c.cyan },
    CmpItemKindCopilot     = { fg = c.green },

    ----------------------------------------------------------------
    -- blink.cmp
    ----------------------------------------------------------------
    BlinkCmpMenu              = { fg = c.fg_dim, bg = bg_float },
    BlinkCmpMenuBorder        = { fg = c.border, bg = bg_float },
    BlinkCmpMenuSelection     = { fg = c.fg, bg = c.gray_300, bold = true },
    BlinkCmpScrollBarThumb    = { bg = c.gray_500 },
    BlinkCmpScrollBarGutter   = { bg = c.gray_200 },
    BlinkCmpLabel             = { fg = c.fg_dim },
    BlinkCmpLabelDeprecated   = { fg = c.fg_faint, strikethrough = true },
    BlinkCmpLabelMatch        = { fg = c.blue, bold = true },
    BlinkCmpLabelDetail       = { fg = c.fg_faint },
    BlinkCmpLabelDescription  = { fg = c.fg_faint },
    BlinkCmpKind              = { fg = c.fg_muted },
    BlinkCmpSource            = { fg = c.fg_faint },
    BlinkCmpGhostText         = { fg = c.fg_faint, italic = true },
    BlinkCmpDoc               = { fg = c.fg_dim, bg = bg_float },
    BlinkCmpDocBorder         = { fg = c.border, bg = bg_float },
    BlinkCmpDocSeparator      = { fg = c.border, bg = bg_float },
    BlinkCmpSignatureHelp     = { fg = c.fg_dim, bg = bg_float },
    BlinkCmpSignatureHelpBorder = { fg = c.border, bg = bg_float },
    BlinkCmpSignatureHelpActiveParameter = { fg = c.amber, bold = true },

    ----------------------------------------------------------------
    -- gitsigns.nvim
    ----------------------------------------------------------------
    GitSignsAdd          = { fg = c.git_add },
    GitSignsChange       = { fg = c.git_change },
    GitSignsDelete       = { fg = c.git_delete },
    GitSignsUntracked    = { fg = c.fg_faint },
    GitSignsAddInline    = { bg = util.blend(c.git_add, c.bg, 0.30) },
    GitSignsChangeInline = { bg = util.blend(c.git_change, c.bg, 0.30) },
    GitSignsDeleteInline = { bg = util.blend(c.git_delete, c.bg, 0.30) },
    GitSignsCurrentLineBlame = { fg = c.fg_faint, italic = true },

    ----------------------------------------------------------------
    -- neo-tree.nvim
    ----------------------------------------------------------------
    NeoTreeNormal          = { fg = c.fg_dim, bg = bg_sidebar },
    NeoTreeNormalNC        = { fg = c.fg_dim, bg = bg_sidebar },
    NeoTreeWinSeparator    = { fg = c.border, bg = bg_sidebar },
    NeoTreeEndOfBuffer     = { fg = bg_sidebar, bg = bg_sidebar },
    NeoTreeRootName        = { fg = c.fg, bold = true },
    NeoTreeDirectoryName   = { fg = c.fg_dim },
    NeoTreeDirectoryIcon   = { fg = c.blue },
    NeoTreeFileName        = { fg = c.fg_dim },
    NeoTreeFileNameOpened  = { fg = c.fg, bold = true },
    NeoTreeIndentMarker    = { fg = c.gray_400 },
    NeoTreeExpander        = { fg = c.fg_muted },
    NeoTreeDimText         = { fg = c.fg_faint },
    NeoTreeCursorLine      = { bg = c.gray_200 },
    NeoTreeGitAdded        = { fg = c.git_add },
    NeoTreeGitModified     = { fg = c.git_change },
    NeoTreeGitDeleted      = { fg = c.git_delete },
    NeoTreeGitUntracked    = { fg = c.purple },
    NeoTreeGitIgnored      = { fg = c.fg_faint },
    NeoTreeGitConflict     = { fg = c.orange },
    NeoTreeTabActive       = { fg = c.fg, bg = bg_sidebar, bold = true },
    NeoTreeTabInactive     = { fg = c.fg_faint, bg = c.bg_dark },
    NeoTreeTabSeparatorActive   = { fg = c.border, bg = bg_sidebar },
    NeoTreeTabSeparatorInactive = { fg = c.bg_dark, bg = c.bg_dark },
    NeoTreeFloatBorder     = { fg = c.border, bg = bg_float },
    NeoTreeFloatTitle      = { fg = c.fg, bg = bg_float, bold = true },
    NeoTreeTitleBar        = { fg = c.bg_dark, bg = c.blue, bold = true },

    ----------------------------------------------------------------
    -- nvim-tree.lua
    ----------------------------------------------------------------
    NvimTreeNormal        = { fg = c.fg_dim, bg = bg_sidebar },
    NvimTreeNormalNC      = { fg = c.fg_dim, bg = bg_sidebar },
    NvimTreeWinSeparator  = { fg = c.border, bg = bg_sidebar },
    NvimTreeEndOfBuffer   = { fg = bg_sidebar, bg = bg_sidebar },
    NvimTreeRootFolder    = { fg = c.fg, bold = true },
    NvimTreeFolderName    = { fg = c.fg_dim },
    NvimTreeFolderIcon    = { fg = c.blue },
    NvimTreeOpenedFolderName = { fg = c.fg, bold = true },
    NvimTreeEmptyFolderName  = { fg = c.fg_faint },
    NvimTreeOpenedFile    = { fg = c.fg, bold = true },
    NvimTreeSpecialFile   = { fg = c.amber },
    NvimTreeExecFile      = { fg = c.green },
    NvimTreeSymlink       = { fg = c.cyan },
    NvimTreeImageFile     = { fg = c.purple },
    NvimTreeIndentMarker  = { fg = c.gray_400 },
    NvimTreeGitDirty      = { fg = c.git_change },
    NvimTreeGitNew        = { fg = c.git_add },
    NvimTreeGitDeleted    = { fg = c.git_delete },
    NvimTreeGitStaged     = { fg = c.green },
    NvimTreeCursorLine    = { bg = c.gray_200 },

    ----------------------------------------------------------------
    -- oil.nvim / mini.files
    ----------------------------------------------------------------
    OilDir          = { fg = c.blue },
    OilDirIcon      = { fg = c.blue },
    OilLink         = { fg = c.cyan },
    OilLinkTarget   = { fg = c.fg_muted },
    OilCopy         = { fg = c.green },
    OilMove         = { fg = c.amber },
    OilChange       = { fg = c.amber },
    OilCreate       = { fg = c.green },
    OilDelete       = { fg = c.red },
    OilPermissionNone = { fg = c.fg_faint },
    OilSize         = { fg = c.fg_muted },
    OilMtime        = { fg = c.fg_muted },

    MiniFilesNormal      = { fg = c.fg_dim, bg = bg_float },
    MiniFilesBorder      = { fg = c.border, bg = bg_float },
    MiniFilesBorderModified = { fg = c.amber, bg = bg_float },
    MiniFilesCursorLine  = { bg = c.gray_300 },
    MiniFilesDirectory   = { fg = c.blue },
    MiniFilesTitle       = { fg = c.fg_muted, bg = bg_float },
    MiniFilesTitleFocused = { fg = c.fg, bg = bg_float, bold = true },

    ----------------------------------------------------------------
    -- bufferline.nvim
    ----------------------------------------------------------------
    BufferLineFill              = { bg = c.bg_dark },
    BufferLineBackground        = { fg = c.fg_faint, bg = c.bg_alt },
    BufferLineBufferVisible     = { fg = c.fg_subtle, bg = c.bg_alt },
    BufferLineBufferSelected    = { fg = c.fg, bg = bg, bold = true },
    BufferLineSeparator         = { fg = c.bg_dark, bg = c.bg_alt },
    BufferLineSeparatorVisible  = { fg = c.bg_dark, bg = c.bg_alt },
    BufferLineSeparatorSelected = { fg = c.bg_dark, bg = bg },
    BufferLineIndicatorSelected = { fg = c.blue, bg = bg },
    BufferLineModified          = { fg = c.amber, bg = c.bg_alt },
    BufferLineModifiedVisible   = { fg = c.amber, bg = c.bg_alt },
    BufferLineModifiedSelected  = { fg = c.amber, bg = bg },
    BufferLineCloseButton       = { fg = c.fg_faint, bg = c.bg_alt },
    BufferLineCloseButtonSelected = { fg = c.red, bg = bg },

    ----------------------------------------------------------------
    -- indent-blankline.nvim（v3）
    ----------------------------------------------------------------
    IblIndent    = { fg = c.gray_300 },
    IblWhitespace = { fg = c.gray_300 },
    IblScope     = { fg = c.gray_500 },
    -- v2 兼容
    IndentBlanklineChar        = { fg = c.gray_300 },
    IndentBlanklineContextChar = { fg = c.gray_500 },

    ----------------------------------------------------------------
    -- mini.nvim
    ----------------------------------------------------------------
    MiniIndentscopeSymbol = { fg = c.gray_500 },
    MiniIndentscopePrefix = { nocombine = true },
    MiniStatuslineDevinfo  = { fg = c.fg_muted, bg = c.gray_200 },
    MiniStatuslineFilename = { fg = c.fg_dim, bg = c.gray_100 },
    MiniStatuslineFileinfo = { fg = c.fg_muted, bg = c.gray_200 },
    MiniStatuslineInactive = { fg = c.fg_faint, bg = c.bg_alt },
    MiniStatuslineModeNormal  = { fg = c.bg_dark, bg = c.fg, bold = true },
    MiniStatuslineModeInsert  = { fg = c.bg_dark, bg = c.blue, bold = true },
    MiniStatuslineModeVisual  = { fg = c.bg_dark, bg = c.purple, bold = true },
    MiniStatuslineModeReplace = { fg = c.bg_dark, bg = c.red, bold = true },
    MiniStatuslineModeCommand = { fg = c.bg_dark, bg = c.amber, bold = true },
    MiniStatuslineModeOther   = { fg = c.bg_dark, bg = c.cyan, bold = true },
    MiniTablineCurrent        = { fg = c.fg, bg = bg, bold = true },
    MiniTablineVisible        = { fg = c.fg_subtle, bg = c.bg_alt },
    MiniTablineHidden         = { fg = c.fg_faint, bg = c.bg_alt },
    MiniTablineModifiedCurrent = { fg = c.amber, bg = bg },
    MiniTablineModifiedVisible = { fg = c.amber, bg = c.bg_alt },
    MiniTablineModifiedHidden  = { fg = util.blend(c.amber, c.bg_alt, 0.6), bg = c.bg_alt },
    MiniTablineFill            = { bg = c.bg_dark },
    MiniCursorword             = { bg = c.gray_300 },
    MiniCursorwordCurrent      = { bg = c.gray_300 },
    MiniPickPrompt             = { fg = c.blue, bg = bg_float },
    MiniPickBorder             = { fg = c.border, bg = bg_float },
    MiniPickNormal             = { fg = c.fg_dim, bg = bg_float },
    MiniPickMatchCurrent       = { fg = c.fg, bg = c.gray_300, bold = true },
    MiniPickMatchRanges        = { fg = c.blue, bold = true },

    ----------------------------------------------------------------
    -- snacks.nvim
    ----------------------------------------------------------------
    SnacksNormal           = { fg = c.fg_dim, bg = bg_float },
    SnacksWinBar           = { fg = c.fg, bg = bg_float, bold = true },
    SnacksBackdrop         = { bg = c.bg_dark },
    SnacksNotifierInfo     = { fg = c.info, bg = bg_float },
    SnacksNotifierWarn     = { fg = c.warn, bg = bg_float },
    SnacksNotifierError    = { fg = c.error, bg = bg_float },
    SnacksNotifierDebug    = { fg = c.fg_muted, bg = bg_float },
    SnacksNotifierTrace    = { fg = c.purple, bg = bg_float },
    SnacksDashboardHeader  = { fg = c.fg, bold = true },
    SnacksDashboardDesc    = { fg = c.fg_dim },
    SnacksDashboardKey     = { fg = c.blue },
    SnacksDashboardIcon    = { fg = c.cyan },
    SnacksDashboardFooter  = { fg = c.fg_faint },
    SnacksIndent           = { fg = c.gray_300 },
    SnacksIndentScope      = { fg = c.gray_500 },
    SnacksPickerMatch      = { fg = c.blue, bold = true },
    SnacksPickerDir        = { fg = c.fg_faint },

    ----------------------------------------------------------------
    -- which-key.nvim
    ----------------------------------------------------------------
    WhichKey          = { fg = c.blue },
    WhichKeyGroup     = { fg = c.purple },
    WhichKeyDesc      = { fg = c.fg_dim },
    WhichKeySeparator = { fg = c.fg_faint },
    WhichKeyFloat     = { bg = bg_float },
    WhichKeyBorder    = { fg = c.border, bg = bg_float },
    WhichKeyValue     = { fg = c.fg_faint },
    WhichKeyIcon      = { fg = c.cyan },

    ----------------------------------------------------------------
    -- trouble.nvim
    ----------------------------------------------------------------
    TroubleNormal      = { fg = c.fg_dim, bg = bg_sidebar },
    TroubleNormalNC    = { fg = c.fg_dim, bg = bg_sidebar },
    TroubleText        = { fg = c.fg_dim },
    TroubleCount       = { fg = c.purple, bg = c.gray_200 },
    TroubleIndent      = { fg = c.gray_400 },
    TroubleFoldIcon    = { fg = c.fg_muted },
    TroubleLocation    = { fg = c.fg_faint },
    TroubleFile        = { fg = c.blue },

    ----------------------------------------------------------------
    -- nvim-notify / noice.nvim
    ----------------------------------------------------------------
    NotifyERRORBorder = { fg = util.blend(c.error, c.bg, 0.4), bg = bg_float },
    NotifyWARNBorder  = { fg = util.blend(c.warn, c.bg, 0.4), bg = bg_float },
    NotifyINFOBorder  = { fg = util.blend(c.info, c.bg, 0.4), bg = bg_float },
    NotifyDEBUGBorder = { fg = c.border, bg = bg_float },
    NotifyTRACEBorder = { fg = util.blend(c.purple, c.bg, 0.4), bg = bg_float },
    NotifyERRORIcon   = { fg = c.error },
    NotifyWARNIcon    = { fg = c.warn },
    NotifyINFOIcon    = { fg = c.info },
    NotifyDEBUGIcon   = { fg = c.fg_muted },
    NotifyTRACEIcon   = { fg = c.purple },
    NotifyERRORTitle  = { fg = c.error, bold = true },
    NotifyWARNTitle   = { fg = c.warn, bold = true },
    NotifyINFOTitle   = { fg = c.info, bold = true },
    NotifyDEBUGTitle  = { fg = c.fg_muted, bold = true },
    NotifyTRACETitle  = { fg = c.purple, bold = true },
    NotifyERRORBody   = { fg = c.fg_dim, bg = bg_float },
    NotifyWARNBody    = { fg = c.fg_dim, bg = bg_float },
    NotifyINFOBody    = { fg = c.fg_dim, bg = bg_float },
    NotifyDEBUGBody   = { fg = c.fg_dim, bg = bg_float },
    NotifyTRACEBody   = { fg = c.fg_dim, bg = bg_float },

    NoiceCmdline           = { fg = c.fg_dim, bg = bg_float },
    NoiceCmdlineIcon       = { fg = c.blue },
    NoiceCmdlineIconSearch = { fg = c.amber },
    NoiceCmdlinePopup      = { fg = c.fg_dim, bg = bg_float },
    NoiceCmdlinePopupBorder = { fg = c.border, bg = bg_float },
    NoiceCmdlinePopupBorderSearch = { fg = c.amber, bg = bg_float },
    NoiceCmdlinePopupTitle = { fg = c.fg, bold = true },
    NoiceConfirmBorder     = { fg = c.border, bg = bg_float },
    NoiceMini              = { fg = c.fg_muted, bg = c.bg_alt },
    NoiceVirtualtext       = { fg = c.fg_faint, italic = true },
    NoiceLspProgressTitle  = { fg = c.fg_dim },
    NoiceLspProgressClient = { fg = c.blue },
    NoiceLspProgressSpinner = { fg = c.cyan },

    ----------------------------------------------------------------
    -- 其他常用插件
    ----------------------------------------------------------------
    -- lazy.nvim
    LazyNormal         = { fg = c.fg_dim, bg = bg_float },
    LazyButton         = { fg = c.fg_dim, bg = c.gray_200 },
    LazyButtonActive   = { fg = c.bg_dark, bg = c.fg, bold = true },
    LazyH1             = { fg = c.bg_dark, bg = c.fg, bold = true },
    LazyH2             = { fg = c.fg, bold = true },
    LazyProgressDone   = { fg = c.green, bold = true },
    LazyProgressTodo   = { fg = c.gray_400, bold = true },
    LazyProp           = { fg = c.fg_muted },
    LazyReasonPlugin   = { fg = c.purple },
    LazyReasonEvent    = { fg = c.amber },
    LazyReasonKeys     = { fg = c.cyan },
    LazyReasonStart    = { fg = c.green },
    LazyReasonSource   = { fg = c.blue },
    LazyReasonFt       = { fg = c.pink },
    LazyCommit         = { fg = c.fg_faint },
    LazyDimmed         = { fg = c.fg_faint },

    -- mason.nvim
    MasonNormal            = { fg = c.fg_dim, bg = bg_float },
    MasonHeader            = { fg = c.bg_dark, bg = c.fg, bold = true },
    MasonHeaderSecondary   = { fg = c.bg_dark, bg = c.blue, bold = true },
    MasonHighlight         = { fg = c.blue },
    MasonHighlightBlock    = { fg = c.bg_dark, bg = c.blue },
    MasonHighlightBlockBold = { fg = c.bg_dark, bg = c.blue, bold = true },
    MasonMuted             = { fg = c.fg_faint },
    MasonMutedBlock        = { fg = c.fg_muted, bg = c.gray_200 },
    MasonError             = { fg = c.error },

    -- flash.nvim / leap.nvim / hop.nvim
    FlashBackdrop = { fg = c.fg_faint },
    FlashLabel    = { fg = c.bg_dark, bg = c.pink, bold = true },
    FlashMatch    = { fg = c.fg, bg = c.gray_300 },
    FlashCurrent  = { fg = c.bg_dark, bg = c.amber, bold = true },
    LeapBackdrop  = { fg = c.fg_faint },
    LeapMatch     = { fg = c.bg_dark, bg = c.pink, bold = true },
    LeapLabelPrimary   = { fg = c.bg_dark, bg = c.pink, bold = true },
    LeapLabelSecondary = { fg = c.bg_dark, bg = c.cyan, bold = true },
    HopNextKey    = { fg = c.pink, bold = true },
    HopNextKey1   = { fg = c.blue, bold = true },
    HopNextKey2   = { fg = c.purple },
    HopUnmatched  = { fg = c.fg_faint },

    -- vim-illuminate
    IlluminatedWordText  = { bg = c.gray_300 },
    IlluminatedWordRead  = { bg = c.gray_300 },
    IlluminatedWordWrite = { bg = c.gray_400 },

    -- nvim-navic / dropbar / barbecue
    NavicIconsFile      = { fg = c.blue },
    NavicIconsModule    = { fg = c.cyan },
    NavicIconsClass     = { fg = c.cyan },
    NavicIconsMethod    = { fg = c.blue },
    NavicIconsFunction  = { fg = c.blue },
    NavicIconsProperty  = { fg = c.fg_dim },
    NavicIconsField     = { fg = c.fg_dim },
    NavicIconsVariable  = { fg = c.fg },
    NavicIconsConstant  = { fg = c.amber },
    NavicIconsString    = { fg = c.green },
    NavicIconsKeyword   = { fg = c.purple },
    NavicText           = { fg = c.fg_dim },
    NavicSeparator      = { fg = c.fg_faint },
    BarbecueNormal      = { fg = c.fg_subtle, bg = bg },
    BarbecueBasename    = { fg = c.fg, bold = true },
    BarbecueDirname     = { fg = c.fg_faint },
    BarbecueSeparator   = { fg = c.fg_faint },
    DropBarIconUISeparator = { fg = c.fg_faint },
    DropBarMenuCurrentContext = { bg = c.gray_200 },

    -- treesitter-context / rainbow-delimiters
    TreesitterContext       = { bg = c.gray_100 },
    TreesitterContextLineNumber = { fg = c.fg_muted, bg = c.gray_100 },
    TreesitterContextBottom = { sp = c.border, underline = true },
    RainbowDelimiterRed     = { fg = c.red },
    RainbowDelimiterYellow  = { fg = c.amber },
    RainbowDelimiterBlue    = { fg = c.blue },
    RainbowDelimiterOrange  = { fg = c.orange },
    RainbowDelimiterGreen   = { fg = c.green },
    RainbowDelimiterViolet  = { fg = c.purple },
    RainbowDelimiterCyan    = { fg = c.cyan },

    -- todo-comments.nvim
    TodoBgFIX   = { fg = c.bg_dark, bg = c.red, bold = true },
    TodoBgTODO  = { fg = c.bg_dark, bg = c.blue, bold = true },
    TodoBgHACK  = { fg = c.bg_dark, bg = c.amber, bold = true },
    TodoBgWARN  = { fg = c.bg_dark, bg = c.warn, bold = true },
    TodoBgPERF  = { fg = c.bg_dark, bg = c.purple, bold = true },
    TodoBgNOTE  = { fg = c.bg_dark, bg = c.cyan, bold = true },
    TodoBgTEST  = { fg = c.bg_dark, bg = c.green, bold = true },
    TodoFgFIX   = { fg = c.red },
    TodoFgTODO  = { fg = c.blue },
    TodoFgHACK  = { fg = c.amber },
    TodoFgWARN  = { fg = c.warn },
    TodoFgPERF  = { fg = c.purple },
    TodoFgNOTE  = { fg = c.cyan },
    TodoFgTEST  = { fg = c.green },
    TodoSignFIX = { fg = c.red },
    TodoSignTODO = { fg = c.blue },
    TodoSignHACK = { fg = c.amber },
    TodoSignWARN = { fg = c.warn },
    TodoSignPERF = { fg = c.purple },
    TodoSignNOTE = { fg = c.cyan },
    TodoSignTEST = { fg = c.green },

    -- nvim-dap / dap-ui
    DapBreakpoint         = { fg = c.red },
    DapBreakpointCondition = { fg = c.amber },
    DapLogPoint           = { fg = c.cyan },
    DapStopped            = { fg = c.amber },
    DapUIVariable         = { fg = c.fg },
    DapUIScope            = { fg = c.cyan },
    DapUIType             = { fg = c.purple },
    DapUIValue            = { fg = c.fg_dim },
    DapUIModifiedValue    = { fg = c.cyan, bold = true },
    DapUIDecoration       = { fg = c.cyan },
    DapUIThread           = { fg = c.green },
    DapUIStoppedThread    = { fg = c.cyan },
    DapUISource           = { fg = c.purple },
    DapUILineNumber       = { fg = c.cyan },
    DapUIFloatBorder      = { fg = c.border },
    DapUIWatchesEmpty     = { fg = c.red },
    DapUIWatchesValue     = { fg = c.green },
    DapUIWatchesError     = { fg = c.red },
    DapUIBreakpointsPath  = { fg = c.cyan },
    DapUIBreakpointsInfo  = { fg = c.green },
    DapUIBreakpointsCurrentLine = { fg = c.green, bold = true },

    -- fidget.nvim
    FidgetTask  = { fg = c.fg_faint },
    FidgetTitle = { fg = c.blue },

    -- alpha-nvim / dashboard-nvim
    AlphaHeader   = { fg = c.fg, bold = true },
    AlphaButtons  = { fg = c.fg_dim },
    AlphaShortcut = { fg = c.blue },
    AlphaFooter   = { fg = c.fg_faint },
    DashboardHeader = { fg = c.fg, bold = true },
    DashboardCenter = { fg = c.fg_dim },
    DashboardShortCut = { fg = c.blue },
    DashboardFooter = { fg = c.fg_faint },
    DashboardKey    = { fg = c.blue },
    DashboardDesc   = { fg = c.fg_dim },
    DashboardIcon   = { fg = c.cyan },

    -- aerial.nvim / outline
    AerialLine       = { bg = c.gray_200 },
    AerialGuide      = { fg = c.gray_400 },
    AerialNormal     = { fg = c.fg_dim, bg = bg_sidebar },

    -- diffview.nvim
    DiffviewNormal        = { fg = c.fg_dim, bg = bg_sidebar },
    DiffviewFilePanelTitle = { fg = c.fg, bold = true },
    DiffviewFilePanelCounter = { fg = c.purple, bold = true },
    DiffviewFilePanelFileName = { fg = c.fg_dim },
    DiffviewStatusAdded   = { fg = c.git_add },
    DiffviewStatusModified = { fg = c.git_change },
    DiffviewStatusDeleted = { fg = c.git_delete },
    DiffviewStatusRenamed = { fg = c.blue },
    DiffviewFolderSign    = { fg = c.blue },

    -- markdown / render-markdown.nvim
    RenderMarkdownCode     = { bg = c.bg_alt },
    RenderMarkdownCodeInline = { fg = c.green, bg = c.gray_200 },
    RenderMarkdownH1Bg     = { fg = c.fg, bg = util.blend(c.fg, c.bg, 0.08), bold = true },
    RenderMarkdownH2Bg     = { fg = c.blue, bg = util.blend(c.blue, c.bg, 0.10) },
    RenderMarkdownH3Bg     = { fg = c.cyan, bg = util.blend(c.cyan, c.bg, 0.10) },
    RenderMarkdownH4Bg     = { fg = c.purple, bg = util.blend(c.purple, c.bg, 0.10) },
    RenderMarkdownH5Bg     = { fg = c.pink, bg = util.blend(c.pink, c.bg, 0.10) },
    RenderMarkdownH6Bg     = { fg = c.fg_dim, bg = c.gray_200 },
    RenderMarkdownBullet   = { fg = c.blue },
    RenderMarkdownQuote    = { fg = c.fg_muted },
    RenderMarkdownDash     = { fg = c.gray_400 },
    RenderMarkdownTableHead = { fg = c.fg_muted },
    RenderMarkdownTableRow  = { fg = c.fg_muted },

    -- headlines.nvim
    Headline    = { bg = c.gray_100 },
    CodeBlock   = { bg = c.bg_alt },
    Dash        = { fg = c.gray_400, bold = true },

    -- copilot / codeium
    CopilotSuggestion = { fg = c.fg_faint, italic = true },
    CopilotAnnotation = { fg = c.fg_faint, italic = true },
    CodeiumSuggestion = { fg = c.fg_faint, italic = true },
  }
end
