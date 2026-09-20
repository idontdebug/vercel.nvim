# extras

可选片段，主题不会自动加载。

配色主题只能定义高亮组，也就是"文字用什么颜色"；屏幕上出现哪些字符由别的插件决定。
三角标志属于字符，只能放在这些插件的配置里，所以放在这个目录，由你决定要不要用。

## 启动页

| 文件 | 插件 |
| --- | --- |
| [`dashboard/alpha.lua`](dashboard/alpha.lua) | [alpha-nvim](https://github.com/goolord/alpha-nvim) |
| [`dashboard/snacks.lua`](dashboard/snacks.lua) | [snacks.nvim](https://github.com/folke/snacks.nvim) 的 dashboard |
| [`dashboard/dashboard-nvim.lua`](dashboard/dashboard-nvim.lua) | [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) |

每个文件都是完整可运行的配置，把内容粘进你自己的插件配置即可。按键和文案按需要改。

渲染出来是这样：

```
       █
      ███
     █████
    ███████
   █████████
  ███████████
 █████████████
███████████████

  vercel.nvim
```

## 状态栏

带标志的 lualine 配置不在这个目录，而是作为模块随主题一起发布：

```lua
require("vercel.lualine").setup()
```

模式段会显示成 `▲ NORMAL`。详见主 [README](../README.zh-CN.md) 的"三角标志"一节。

## Git 状态图标

文件树里标记改动的那个符号也可以换成三角。snacks 和 neo-tree 的默认值都用空心和实心
区分两种状态，换成三角后保持同一套区分方式：

| 状态 | 默认（snacks） | 换成三角 |
| --- | --- | --- |
| 已修改，未暂存 | `○` | `△` |
| 已暂存 | `●` | `▲` |

| 文件 | 插件 |
| --- | --- |
| [`git-icons/snacks.lua`](git-icons/snacks.lua) | [snacks.nvim](https://github.com/folke/snacks.nvim) 的 explorer 和 picker |
| [`git-icons/neo-tree.lua`](git-icons/neo-tree.lua) | [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) |

其余状态（added / deleted / renamed / untracked 等）保持插件默认，它们本来靠形状区分，
全换成三角就分不出来了。

`▲` 和 `△` 属于 Unicode 的"歧义宽度"字符：在装了中日韩字体的终端里可能被当成两格宽，
导致文件树的图标列错位。出现这种情况就把终端的 ambiguous width 设为 narrow，
或者改回默认图标。

## 标志字符

上面几个片段都从同一个模块取字符，你也可以自己用：

```lua
local logo = require("vercel.logo")

logo.glyph   -- "▲"
logo.outline -- "△"
logo.small   -- 4 行，窄终端用
logo.large   -- 8 行
logo.header({ size = "large", text = "vercel.nvim" })  -- 标志 + 下方文字
```

`header()` 返回的各行不带前导空格——上面三个插件都会逐行居中，自带缩进会和居中叠加，把三角形推歪。
渲染方如果是左对齐的，传 `align = "center"` 由函数自己补空格。`text` 传 `false` 去掉文字行，
`gap` 控制标志和文字之间的空行数。
