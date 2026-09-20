# vercel.nvim

以 Vercel [Geist](https://vercel.com/geist/introduction) 设计系统为基础的 Neovim 暗色主题：
纯黑背景、单色灰阶正文、少量高饱和强调色。
支持 Treesitter、LSP 语义高亮，并为约 30 个常用插件定义了高亮组，共约 710 个高亮组。

**[English](README.md)**

需要 Neovim 0.9 以上和支持真彩色（`termguicolors`）的终端。

> 非官方主题，只借用了 Geist 的色阶，与 Vercel 没有从属关系。

## 预览

用浏览器打开 [`preview.html`](preview.html)，可以看到模拟的编辑器窗口和完整调色板。

## 设计规则

Vercel 官网与 Geist 设计系统的特征是：纯黑底色、大面积中性灰、强调色只出现在需要引导视线的位置。
主题据此制定三条规则：

1. **背景只有四层。** `#000000` 编辑区 → `#0a0a0a` 浮窗与侧边栏 → `#1a1a1a` 当前行 → `#292929` 边框。
   层级靠明度差区分，不加边框线和阴影。
2. **正文保持中性。** 变量、属性、标点用灰阶（`#ededed` / `#a1a1a1` / `#8f8f8f`），不着色。
   这样彩色部分才有区分度。
3. **强调色只用于五类元素。** 关键字紫色、函数蓝色、字符串绿色、字面量琥珀色、类型青色；
   导入、返回、转义等"控制流转折点"用粉色。其余元素一律归入灰阶。

### 调色板

| 用途 | 色值 | 与 `#000000` 的对比度 |
| --- | --- | --- |
| 正文 | `#ededed` | 17.9:1 |
| 次级文字、运算符 | `#a1a1a1` | 8.1:1 |
| 标点、分隔符 | `#8f8f8f` | 6.5:1 |
| 注释 | `#7d7d7d` | 5.1:1 |
| 关键字 | `#bf7af0` | 7.3:1 |
| 函数 | `#52a8ff` | 8.4:1 |
| 字符串 | `#62c073` | 9.3:1 |
| 数字、常量 | `#ffcb47` | 13.9:1 |
| 类型 | `#50e3c2` | 13.1:1 |
| 导入、返回、转义 | `#ff6fae` | 8.1:1 |
| 错误 | `#ff6369` | 7.2:1 |

所有语法色对比度均在 7:1 以上（WCAG AAA），注释为 5.1:1（AA）。

## 安装

### lazy.nvim

```lua
{
  "idontdebug/vercel.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function(_, opts)
    require("vercel").setup(opts)
    vim.cmd.colorscheme("vercel")
  end,
}
```

### packer.nvim

```lua
use({
  "idontdebug/vercel.nvim",
  config = function()
    require("vercel").setup({})
    vim.cmd.colorscheme("vercel")
  end,
})
```

### vim.pack（Neovim 0.12+）

```lua
vim.pack.add({ "https://github.com/idontdebug/vercel.nvim" })
vim.cmd.colorscheme("vercel")
```

### 不用插件管理器

```bash
git clone https://github.com/idontdebug/vercel.nvim \
  ~/.local/share/nvim/site/pack/themes/start/vercel.nvim
```

Windows 对应目录为 `%LOCALAPPDATA%\nvim-data\site\pack\themes\start\vercel.nvim`。之后在 `init.lua` 中：

```lua
vim.cmd.colorscheme("vercel")
```

### 两个变体

| 命令 | 背景 |
| --- | --- |
| `:colorscheme vercel` | `#000000` 纯黑 |
| `:colorscheme vercel-soft` | `#0a0a0a` |

## 配置

`setup()` 只保存配置，实际生效在 `:colorscheme vercel` 时。默认值如下：

```lua
require("vercel").setup({
  background = "black",      -- "black" = #000000，"soft" = #0a0a0a
  transparent = false,       -- 背景透明，交给终端渲染
  terminal_colors = true,    -- 设置 g:terminal_color_0..15
  dim_inactive = false,      -- 非当前窗口使用更暗的背景
  float_border = "single",   -- "single" 给浮窗边框上色；"none" 让边框融入背景
  sidebars = {               -- 这些 filetype 的窗口使用 #0a0a0a 背景
    "qf", "help", "NvimTree", "neo-tree", "Trouble", "trouble",
    "lazy", "mason", "fugitive",
  },
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
  on_colors = nil,           -- function(colors) 修改调色板
  on_highlights = nil,       -- function(highlights, colors) 修改高亮组
})
```

### 修改颜色

`on_colors` 在生成高亮组之前修改调色板，一处改动会影响所有引用该颜色的组：

```lua
require("vercel").setup({
  on_colors = function(c)
    c.comment = "#6b6b6b"   -- 注释再暗一点
    c.purple = c.blue       -- 关键字改用蓝色
  end,
})
```

`on_highlights` 在全部高亮组生成之后运行，用于单独覆盖某些组：

```lua
require("vercel").setup({
  on_highlights = function(hl, c)
    hl.CursorLine = { bg = "#141414" }
    hl["@keyword.return"] = { fg = c.pink, bold = true }
    hl.WinSeparator = { fg = c.gray_300 }
  end,
})
```

`c` 中除了语义名（`fg`、`comment`、`blue` 等），还包含 Geist 原始色阶 `c.gray_100` 到 `c.gray_1000`，
以及 `c.geist` 下的完整色板。

### 透明背景

```lua
require("vercel").setup({ transparent = true })
```

此时 `Normal`、`NormalFloat`、`SignColumn` 等组的 `bg` 设为 `NONE`，由终端背景显示。
浮窗和补全菜单仍保留实色背景，否则文字会叠在下层内容上。

## lualine

主题文件位于 `lua/lualine/themes/vercel.lua`，插件会自动找到：

```lua
require("lualine").setup({
  options = { theme = "vercel" },
})
```

各模式的强调色：普通模式白色、插入蓝色、可视紫色、替换红色、命令琥珀色、终端绿色。

## 已适配的插件

telescope.nvim、fzf-lua、nvim-cmp、blink.cmp、gitsigns.nvim、neo-tree.nvim、nvim-tree.lua、
oil.nvim、mini.nvim（files / statusline / tabline / indentscope / pick / cursorword）、snacks.nvim、
bufferline.nvim、indent-blankline.nvim、which-key.nvim、trouble.nvim、nvim-notify、noice.nvim、
lazy.nvim、mason.nvim、flash.nvim、leap.nvim、hop.nvim、vim-illuminate、nvim-navic、barbecue、
dropbar、nvim-treesitter-context、rainbow-delimiters、todo-comments.nvim、nvim-dap 与 dap-ui、
fidget.nvim、alpha-nvim、dashboard-nvim、aerial.nvim、diffview.nvim、render-markdown.nvim、
headlines.nvim、copilot.lua、codeium。

未适配的插件会回落到标准高亮组（`Normal`、`Pmenu`、`Comment` 等），通常也能正常显示。

## 目录结构

```
vercel-nvim/
├── colors/
│   ├── vercel.lua              -- :colorscheme vercel
│   └── vercel-soft.lua         -- :colorscheme vercel-soft
└── lua/
    ├── lualine/themes/vercel.lua
    └── vercel/
        ├── init.lua            -- setup / load / 终端色 / 侧边栏
        ├── config.lua          -- 默认配置
        ├── palette.lua         -- Geist 色阶与语义色
        ├── util.lua            -- 颜色混合、样式合并、写入高亮
        └── groups/
            ├── init.lua        -- 汇总各模块并执行 on_highlights
            ├── editor.lua      -- 编辑器界面
            ├── syntax.lua      -- 传统 Vim 语法组
            ├── treesitter.lua  -- @ 开头的 Treesitter 捕获组
            ├── lsp.lua         -- 诊断与 LSP 语义 token
            └── plugins.lua     -- 插件高亮组
```

## 自查

确认颜色是否按预期生效：

```vim
:highlight @function
:Inspect
```

`:Inspect` 显示光标处生效的 Treesitter 捕获组、LSP token 和语法组，是调整颜色时的主要依据。

## 许可证

MIT，见 [LICENSE](LICENSE)。

色值取自 Vercel Geist 设计系统。
