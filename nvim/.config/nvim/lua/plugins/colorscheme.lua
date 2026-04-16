return {
  -- Add Tokyonight theme (install and set configurations)
  -- If this theme is not already installed (btw comes by default with LazyVim), lazy.nvim will install it
  -- Source link: https://www.lazyvim.org/plugins/colorscheme#tokyonightnvim
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "night" }, -- set style to night
  },

  -- Configure LazyVim to load Tokyonight theme
  -- It sounds like a hook that we update the colorscheme to "tokyonight" once LazyVim is init
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
