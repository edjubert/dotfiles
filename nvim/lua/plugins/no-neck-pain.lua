return {
  {
    "shortcuts/no-neck-pain.nvim",
    config = function()
      require("no-neck-pain").setup({
        debug = false,
        enableOnVimEnter = true,
        width = 150,
        toogleMapping = "<leader>np",
        disableOnLastBuffer = false,
        killAllBuffersOnDisable = false,
        buffers = {
          setNames = false,
          backgroundColor = nil,
          blend = 0,
          textColor = nil,
          bo = {
            filetype = "no-neck-pain",
            buftype = "nofile",
            bufhidden = "hide",
            buflisted = false,
            swapfile = false,
          },
          wo = {
            cursorline = false,
            cursorcolumn = false,
            number = false,
            relativenumber = false,
            foldenable = false,
            list = false,
            wrap = true,
            linebreak = true,
          },
          left = {
            enabled = true,
            backgroundColor = nil,
            blend = 0,
            textColor = nil,
            bo = {
              filetype = "no-neck-pain",
              buftype = "nofile",
              bufhidden = "hide",
              buflisted = false,
              swapfile = false,
            },
            wo = {
              cursorline = false,
              cursorcolumn = false,
              number = false,
              relativenumber = false,
              foldenable = false,
              list = false,
              wrap = true,
              linebreak = true,
            },
          },
          right = {
            enabled = true,
            backgroundColor = nil,
            blend = 0,
            textColor = nil,
            bo = {
              filetype = "no-neck-pain",
              buftype = "nofile",
              bufhidden = "hide",
              buflisted = false,
              swapfile = false,
            },
            wo = {
              cursorline = false,
              cursorcolumn = false,
              number = false,
              relativenumber = false,
              foldenable = false,
              list = false,
              wrap = true,
              linebreak = true,
            },
          },
        },
        integrations = {
          NvimTree = {
            position = "left",
          },
          undotree = {
            position = "left",
          },
        },
      })
    end,
  },
}
