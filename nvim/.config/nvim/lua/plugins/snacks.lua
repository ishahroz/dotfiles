return {
  "folke/snacks.nvim",
  opts = {
    -- To show the hidden files both in files finder and explorer
    -- To learn about the configs: https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
    picker = {
      sources = {
        explorer = { hidden = true },
        files = { hidden = true },
        grep = { hidden = true },
      },
    },
  },
}
