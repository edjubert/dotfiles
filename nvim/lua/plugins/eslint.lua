return {
  {
    "MunifTanjim/eslint.nvim",
    config = function()
      require("eslint").setup({
        bin = "eslint",
        code_actions = {
          apply_on_save = {
            enable = true,
            types = { "problem", "suggestion", "layout" },
          },
          disable_rule_comment = {
            enable = true,
            location = "separate_line",
          },
        },
        diagnostics = {
          enable = true,
          report_unused_disable_directives = false,
          run_on = "type",
        },
      })
    end,
  },
}
