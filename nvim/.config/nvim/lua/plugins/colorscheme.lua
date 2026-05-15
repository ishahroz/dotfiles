return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = true,
        transparent = false,
        theme = "dragon", -- Always use the dragon variant
      })

      vim.cmd("colorscheme kanagawa-dragon")
    end,
  },
}
