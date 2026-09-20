-- Triangle git-status icons for the neo-tree.nvim file tree.
-- The theme does not load this file; paste its contents into your own neo-tree config.
--
-- neo-tree splits statuses into two groups: change type (added / deleted / modified / renamed)
-- and status type (untracked / ignored / unstaged / staged / conflict).
-- Only the modified / staged pair is changed here, told apart by hollow and solid triangles.
-- The rest keep neo-tree's defaults: they are distinguished by shape, and turning them all into triangles would make them indistinguishable.
local logo = require("vercel.logo")

require("neo-tree").setup({
  default_component_configs = {
    git_status = {
      symbols = {
        modified = logo.outline, -- △ modified
        staged = logo.glyph, -- ▲ staged
      },
      align = "right",
    },
  },
})
