-- Zen Mode
-- https://github.com/folke/zen-mode.nvim
return {
  {
    "folke/zen-mode.nvim",

    keys = {
      {
        "<leader>z", -- key mapping
        function()
          require("zen-mode").toggle()
        end,
        desc = "Toggle Zen Mode",
      },
    },

    opts = {
      window = {
        width = 90, -- width of the Zen window
        options = {
          number = true, -- enable number column
          relativenumber = false, -- disable relative numbers
        },
      },

      plugins = {
        gitsigns = {
          enabled = true, -- hide git signs
        },
        tmux = {
          enabled = true, -- hide tmux statusline
        },
      },
    },
  },
}
