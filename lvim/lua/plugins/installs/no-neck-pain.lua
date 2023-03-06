return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  config = function()
    -- Hexadecimal color code to override the current background color of the buffer. (e.g. #24273A)
    -- popular theme are supported by their name:
    -- - catppuccin-frappe
    -- - catppuccin-frappe-dark
    -- - catppuccin-latte
    -- - catppuccin-latte-dark
    -- - catppuccin-macchiato
    -- - catppuccin-macchiato-dark
    -- - catppuccin-mocha
    -- - catppuccin-mocha-dark
    -- - tokyonight-day
    -- - tokyonight-moon
    -- - tokyonight-night
    -- - tokyonight-storm
    -- - rose-pine
    -- - rose-pine-moon
    -- - rose-pine-dawn

    local BufferOptions = {
      enabled = true,
      backgroundColor = nil,
      colors = {
        blend = 0,
      },
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
    }

    local noNeckPain = require('no-neck-pain')
    noNeckPain.setup({
      debug = false,
      autoCmd = {
        enableOnVimEnter = false,
      },
      width = 150,
      mappings = {
        mapping = "<Leader>np"
      },
      disableOnLastBuffer = false,
      killAllBuffersOnDisable = false,
      buffers = {
        setNames = false,
        backgroundColor = nil,
        colors = {
          blend = 0,
        },
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
        left = BufferOptions,
        right = BufferOptions,
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
  end
}
