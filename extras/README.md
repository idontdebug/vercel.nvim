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

## 标志字符

上面几个片段都从同一个模块取字符，你也可以自己用：

```lua
local logo = require("vercel.logo")

logo.glyph   -- "▲"
logo.small   -- 4 行，窄终端用
logo.large   -- 8 行
logo.header({ size = "large", text = "vercel.nvim" })  -- 标志 + 居中文字
```

`header()` 的 `text` 传 `false` 可以去掉文字行，`gap` 控制标志和文字之间的空行数。
