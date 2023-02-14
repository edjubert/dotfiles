return {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup({
          dimming = {
              alpha = 0.50,
              color = { "Normal", "#ffffff" },
              term_bg = "#000000",
              inactive = false,
          },
          context = 20,
          treesitter = true,
          expand = {
              "function",
              "method",
              "table",
              "if_statement",
          },
      })
    end
}
