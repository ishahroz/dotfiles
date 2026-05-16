-- Lualine
-- https://github.com/nvim-lualine/lualine.nvim#usage-and-customization
return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_z = {} -- disable the `z` section
    end,
  },
}
