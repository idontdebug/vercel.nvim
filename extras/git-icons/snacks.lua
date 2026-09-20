-- Triangle git-status icons for the snacks.nvim explorer and picker.
-- The theme does not load this file; paste its contents into your own snacks config.
--
-- snacks defaults to modified = "○" and staged = "●", telling the two states apart by hollow vs solid.
-- Here they become △ and ▲, keeping the same distinction and the same one-cell width.
-- The other statuses (added / deleted / renamed, etc.) keep snacks' default Nerd Font icons,
-- since they are already distinguished by shape and would be indistinguishable as triangles.
local logo = require("vercel.logo")

require("snacks").setup({
  picker = {
    icons = {
      git = {
        modified = logo.outline, -- △ modified, unstaged
        staged = logo.glyph, -- ▲ staged
      },
    },
  },
})

-- To change untracked files as well:
--
--   git = {
--     modified  = logo.outline,
--     staged    = logo.glyph,
--     untracked = logo.outline,
--   },
