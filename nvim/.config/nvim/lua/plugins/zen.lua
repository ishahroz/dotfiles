return {
  {
    "folke/zen-mode.nvim",

    keys = {
      {
        "<leader>z",
        function()
          require("zen-mode").toggle()
        end,
        desc = "Toggle Zen Mode", -- toggle zen
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
          enabled = true, -- keep git signs
        },
        tmux = {
          enabled = true, -- hide tmux statusline
        },
        twilight = {
          enabled = true, -- dim inactive code
        },
      },
    },
  },
}
