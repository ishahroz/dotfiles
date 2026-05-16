-- Github Dark Default Theme
-- https://github.com/projekt0n/github-nvim-theme#github-dark-default
return {
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd("colorscheme github_dark_default")
    end,
  },
}
