return {
    "phaazon/hop.nvim",
    branch = 'v2',
    config = function()
      local hop = require('hop')
      hop.setup({
          create_hl_autocmd = true,
          uppercase_labels = false,
          multi_windows = false
      })
    end
}
