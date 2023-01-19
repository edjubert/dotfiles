local white      = '#c3ccdc'
-- Variations of blue-grey
local regal_blue = '#1d3b53'
local grey_blue  = '#7c8f8f'
local white_blue = '#d6deeb'
-- Core theme colors
local peach      = '#ffcb8b'
local tan        = '#ecc48d'
local red        = '#fc514e'
local watermelon = '#ff5888'
local violet     = '#c792ea'
local purple     = '#ae81ff'
local blue       = '#82aaff'
local turquoise  = '#7fdbca'
local emerald    = '#21c7a8'
local green      = '#a1cd5e'
--
-- Extra colors
local black      = '#011627'
local black_blue = '#081e2f'
local dark_blue  = '#092236'
local deep_blue  = '#0e293f'
local slate_blue = '#2c3043'
local steel_blue = '#4b6479'
local cadet_blue = '#a1aab8'
local ash_blue   = '#acb4c2'
local yellow     = '#e3d18a'
local orange     = '#f78c6c'
local indigo     = '#5e97ec'
local cyan_blue  = '#296596'

-- Specify the colors used by the inbuilt terminal of Neovim and Vim
vim.g.terminal_color_0        = regal_blue
vim.g.terminal_color_1        = red
vim.g.terminal_color_2        = green
vim.g.terminal_color_3        = peach
vim.g.terminal_color_4        = blue
vim.g.terminal_color_5        = violet
vim.g.terminal_color_6        = turquoise
vim.g.terminal_color_7        = white
vim.g.terminal_color_8        = grey_blue
vim.g.terminal_color_9        = watermelon
vim.g.terminal_color_10       = emerald
vim.g.terminal_color_11       = tan
vim.g.terminal_color_12       = blue
vim.g.terminal_color_13       = purple
vim.g.terminal_color_14       = turquoise
vim.g.terminal_color_15       = white_blue
vim.g.neovide_cursor_vfx_mode = "sonicboom"

vim.g.Hexokinase_highlighters = { "virtual", "foreground" }


lvim.transparent_window = true
-- Neovide Special config
vim.o.guifont = "Iosevka Nerd Font"
vim.g.neovide_transparency = 0.3
vim.o.relativenumber = true

lvim.log.level = "warn"
lvim.format_on_save = true
vim.cmd([[ command! -nargs=1 Browse silent exec '!open "<args>"' ]])

lvim.leader = "space"
vim.g.smoothie_experimental_mappings = true

vim.api.nvim_command([[
  augroup transparentBackground
    autocmd colorscheme * :hi CursorLine ctermbg=NONE cterm=bold guibg=NONE gui=bold
    autocmd colorscheme * :hi TelescopeNormal ctermbg=NONE guibg=NONE
    autocmd colorscheme * :hi TelescopeBorder ctermbg=NONE guibg=NONE
    autocmd colorscheme * :hi FloatBorder ctermbg=NONE guibg=NONE
    autocmd colorscheme * :hi NormalFloat ctermbg=NONE guibg=NONE
    autocmd colorscheme * :hi NvimTreeNormal ctermbg=NONE guibg=NONE
    autocmd colorscheme * :hi NvimTreeRootFolder ctermbg=NONE guibg=NONE
    autocmd colorscheme * :hi WhichKey ctermbg=NONE guibg=NONE
    autocmd colorscheme * :hi WhichKeyGroup ctermbg=NONE guibg=NONE
    autocmd colorscheme * :hi WhichKeyFloat ctermbg=NONE guibg=NONE
    autocmd colorscheme * :hi BufferLineFill ctermbg=NONE guibg=NONE
    autocmd colorscheme * :hi Visual cterm=bold gui=bold
    autocmd colorscheme * :hi Comment cterm=italic gui=italic
    autocmd colorscheme * :hi NotifyBackground cterm=italic gui=italic
  augroup END
]])

-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.builtin.terminal.open_mapping = [[<C-t>]]

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["<space>"] = { "<cmd>ChooseWin<cr>", "Choose window" }
lvim.builtin.which_key.mappings["n"] = {
  n = { "<cmd>bn<cr>", "Buffer next" },
}
lvim.builtin.which_key.mappings["S"] = {
  name = "+Spectre",
  s = { "<cmd>lua require('spectre').open()<CR>", "Open Spectre" },
  w = { "<cmd>lua require('spectre').open_visual({ select_word=true })<CR>", "Search current word" },
  p = { "viw:lua require('spectre').open_file_search()<CR>", "Search in file" }
}
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["C"] = { "<cmd>NoNeckPain<CR>", "Center buffer" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

lvim.builtin.which_key.mappings["G"] = {
  name = "Goto Preview",
  d = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "" },
  t = { "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", "" },
  i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "" },
  c = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "" },
  r = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
-- lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
-- lvim.builtin.treesitter.highlight.enabled = true


lvim.plugins = {
  { "tpope/vim-surround" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  { "f-person/git-blame.nvim" },
  { "danilamihailov/beacon.nvim" },
  { "rmagatti/goto-preview" },
  { "psliwka/vim-smoothie" },
  { "airblade/vim-gitgutter" },
  { "ray-x/lsp_signature.nvim" },
  { "RRethy/vim-hexokinase", run = "make hexokinase" },
  {
    "max397574/colortils.nvim",
    cmd = "Colortils",
    config = function()
      require("colortils").setup()
    end,
  },
  { "tree-sitter/tree-sitter-go" },
  { "t9md/vim-choosewin" },
  { "windwp/nvim-spectre" },
  { "MunifTanjim/eslint.nvim" },
  { "mitchellh/tree-sitter-proto" },
  { "rcarriga/nvim-notify" },
  { "ziontee113/color-picker.nvim",
    config = function()
      require("color-picker")
    end,
  },
  {
    'simnalamburt/vim-mundo'
  },
  { "shortcuts/no-neck-pain.nvim", tag = "*" },
  {
    "phaazon/hop.nvim",
    branch = 'v2', -- optional but strongly recommended
  },
  {
    "narutoxy/silicon.lua",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require('silicon').setup({})
    end
  },
  {
    "folke/trouble.nvim",
    require = "kyazdani24/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      -- local lsp_installer_servers = require("nvim-lsp-installer.servers")
      -- local _, requested_server = lsp_installer_servers.get_server("rust_analyzer")
      require("rust-tools").setup({
        tools = {
          autoSetHints = true,
          -- hover_with_actions = true,
          -- options same as lsp hover / vim.lsp.util.open_floating_preview()
          hover_actions = {

            -- the border that is used for the hover window
            -- see vim.api.nvim_open_win()
            border = {
              { "╭", "FloatBorder" },
              { "─", "FloatBorder" },
              { "╮", "FloatBorder" },
              { "│", "FloatBorder" },
              { "╯", "FloatBorder" },
              { "─", "FloatBorder" },
              { "╰", "FloatBorder" },
              { "│", "FloatBorder" },
            },

            -- whether the hover action window gets automatically focused
            -- default: false
            auto_focus = true,
          },
          runnables = {
            use_telescope = true,
          },
        },
        server = {
          on_init = require("lvim.lsp").common_on_init,
          on_attach = function(client, bufnr)
            require("lvim.lsp").common_on_attach(client, bufnr)
            local rt = require("rust-tools")
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<leader>lA", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })
    end,
    ft = { "rust", "rs" },
  },
}
require 'lsp_signature'.setup({
  bind = true,
  handler_opts = {
    border = "rounded"
  }
})

require 'hop'.setup({
  create_hl_autocmd = true,
  uppercase_labels = false,
  multi_windows = false
})
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'fw', function()
  hop.hint_words()
end, { remap = true, silent = true })
vim.keymap.set('', 'ff', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR })
end, { remap = true, silent = true })
vim.keymap.set('', 'fF', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR })
end, { remap = true, silent = true })


require('telescope').load_extension('notify')
require "notify".setup({
  background_colour = "Normal",
  fps = 60,
  timeout = 2000,
  render = "default",
  stages = "slide"
})

require 'indent_blankline'.setup({
  show_current_context = true,
  show_current_context_start = true,
})

lvim.builtin.lualine.style = "lvim"
lvim.builtin.lualine.sections.lualine_y = { 'fileformat', 'filesize', 'location', 'progress' }

local null_ls = require("null-ls")
local eslint = require("eslint")

null_ls.setup()

eslint.setup({
  bin = 'eslint', -- or `eslint_d`
  code_actions = {
    enable = true,
    apply_on_save = {
      enable = true,
      types = { "problem", "suggestion", "layout" },
    },
    disable_rule_comment = {
      enable = true,
      location = "separate_line", -- or `same_line`
    },
  },
  diagnostics = {
    enable = true,
    report_unused_disable_directives = false,
    run_on = "type", -- or `save`
  },
})

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "rustfmt", filetypes = { "rust" } },
})

require 'goto-preview'.setup({})

require("no-neck-pain").setup({
  -- Prints useful logs about what event are triggered, and reasons actions are executed.
  debug = false,
  -- When `true`, enables the plugin when you start Neovim.
  enableOnVimEnter = true,
  -- The width of the focused buffer when enabling NNP.
  -- If the available window size is less than `width`, the buffer will take the whole screen.
  width = 150,
  -- Set globally to Neovim, it allows you to toggle the enable/disable state.
  -- When `false`, the mapping is not created.
  toggleMapping = "<Leader>np",
  -- Disables NNP if the last valid buffer in the list has been closed.
  disableOnLastBuffer = false,
  -- When `true`, disabling NNP kills every split/vsplit buffers except the main NNP buffer.
  killAllBuffersOnDisable = false,
  --- Common options that are set to both buffers, for option scoped to the `left` and/or `right` buffer, see `buffers.left` and `buffers.right`.
  --- See |NoNeckPain.bufferOptions|.
  buffers = {
    -- When `true`, the side buffers will be named `no-neck-pain-left` and `no-neck-pain-right` respectively.
    setNames = false,
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
    backgroundColor = nil,
    -- Brighten (positive) or darken (negative) the side buffers background color. Accepted values are [-1..1].
    blend = 0,
    -- Hexadecimal color code to override the current text color of the buffer. (e.g. #7480c2)
    textColor = nil,
    -- vim buffer-scoped options: any `vim.bo` options is accepted here.
    bo = {
      filetype = "no-neck-pain",
      buftype = "nofile",
      bufhidden = "hide",
      buflisted = false,
      swapfile = false,
    },
    -- vim window-scoped options: any `vim.wo` options is accepted here.
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
    --- Options applied to the `left` buffer, the options defined here overrides the ones at the root of the `buffers` level.
    --- See |NoNeckPain.bufferOptions|.
    left = BufferOptions,
    --- Options applied to the `right` buffer, the options defined here overrides the ones at the root of the `buffers` level.
    --- See |NoNeckPain.bufferOptions|.
    right = BufferOptions,
  },
  -- lists supported integrations that might clash with `no-neck-pain.nvim`'s behavior
  integrations = {
    -- https://github.com/nvim-tree/nvim-tree.lua
    NvimTree = {
      -- the position of the tree, can be `left` or `right``
      position = "left",
    },
    -- https://github.com/mbbill/undotree
    undotree = {
      -- the position of the tree, can be `left` or `right``
      position = "left",
    },
  },
})

BufferOptions = {
  -- When `false`, the buffer won't be created.
  enabled = true,
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
  backgroundColor = nil,
  -- Brighten (positive) or darken (negative) the side buffers background color. Accepted values are [-1..1].
  blend = 0,
  -- Hexadecimal color code to override the current text color of the buffer. (e.g. #7480c2)
  textColor = nil,
  -- vim buffer-scoped options: any `vim.bo` options is accepted here.
  bo = {
    filetype = "no-neck-pain",
    buftype = "nofile",
    bufhidden = "hide",
    buflisted = false,
    swapfile = false,
  },
  -- vim window-scoped options: any `vim.wo` options is accepted here.
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
