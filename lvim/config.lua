local black      = '#011627'
local white      = '#c3ccdc'
-- Variations of blue-grey
local black_blue = '#081e2f'
local dark_blue  = '#092236'
local deep_blue  = '#0e293f'
local slate_blue = '#2c3043'
local regal_blue = '#1d3b53'
local steel_blue = '#4b6479'
local grey_blue  = '#7c8f8f'
local cadet_blue = '#a1aab8'
local ash_blue   = '#acb4c2'
local white_blue = '#d6deeb'
-- Core theme colors
local yellow     = '#e3d18a'
local peach      = '#ffcb8b'
local tan        = '#ecc48d'
local orange     = '#f78c6c'
local red        = '#fc514e'
local watermelon = '#ff5874'
local violet     = '#c792ea'
local purple     = '#ae81ff'
local indigo     = '#5e97ec'
local blue       = '#82aaff'
local turquoise  = '#7fdbca'
local emerald    = '#21c7a8'
local green      = '#a1cd5e'
-- Extra colors
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

-- Neovide Special config
vim.o.guifont = "Iosevka Nerd Font"
vim.g.neovide_transparency = 0.3

lvim.log.level = "warn"
lvim.format_on_save = true
vim.cmd([[ command! -nargs=1 Browse silent exec '!open "<args>"' ]])

-- lvim.colorscheme = "catppuccin"
-- require('catppuccin').setup({
--   flavour = "mocha",
--   transparent_background = false,
--   term_colors = false,
--   dim_inactive = {
--     enable = true,
--     shade = "dark",
--     percentage = 0.5
--   },
--   styles = {
--     comments = { "italic" },
--     conditionals = { "italic" },
--   },
--   integrations = {
--     cmp = true,
--     gitsigns = true,
--     nvimtree = true,
--     telescope = true,
--     treesitter = true,
--   }
-- })

-- lvim.colorscheme = "onedark"
-- require('onedark').setup({
--   comment_style = "NONE",
--   keyword_style = "NONE",
--   function_style = "NONE",
--   variable_style = "NONE",
--   dark_sidebar = 1,
--   dark_float = 1,
--   highlight_linenumber = 0,
--   hide_inactive_statusline = 1,
--   transparent = 1,
--   transparent_sidebar = 1
-- })

-- lvim.transparent_window = true

lvim.leader = "space"

vim.g.rnvimr_enable_ex = 1
vim.g.rnvimr_enable_picker = 1
vim.g.rnvimr_draw_border = 1
vim.g.rnvimr_shadow_winblend = 100

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
  augroup END
]])

-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"


-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["<space>"] = { "<cmd>ChooseWin<cr>", "Choose window" }
-- lvim.builtin.which_key.mappings["X"] = { "<cmd>lua require('silicon').visualise(false, false)<C>" }
lvim.builtin.which_key.mappings["n"] = {
  n = { "<cmd>bn<cr>", "Buffer next" },
}
lvim.builtin.which_key.mappings["r"] = { "<cmd>RnvimrToggle<CR>", "Open Ranger" }
lvim.builtin.which_key.mappings["S"] = {
  name = "+Spectre",
  s = { "<cmd>lua require('spectre').open()<CR>", "Open Spectre" },
  w = { "<cmd>lua require('spectre').open_visual({ select_word=true })<CR>", "Search current word" },
  p = { "viw:lua require('spectre').open_file_search()<CR>", "Search in file" }
}
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["C"] = { "<cmd>Centerpad 30 30<CR>", "Center buffer" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
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
lvim.builtin.treesitter.highlight.enabled = true

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

lvim.plugins = {
  { "tpope/vim-surround" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  { "smithbm2316/centerpad.nvim" },
  { "f-person/git-blame.nvim" },
  { "danilamihailov/beacon.nvim" },
  { "psliwka/vim-smoothie" },
  { "airblade/vim-gitgutter" },
  { "ray-x/lsp_signature.nvim" },
  -- { "ful1e5/onedark.nvim" },
  { "catppuccin/nvim", as = "catppuccin" },
  { "lukas-reineke/indent-blankline.nvim" },
  { "p00f/nvim-ts-rainbow" },
  { "tree-sitter/tree-sitter-go" },
  { "t9md/vim-choosewin" },
  { "kevinhwang91/rnvimr" },
  { "windwp/nvim-spectre" },
  { "MunifTanjim/eslint.nvim" },
  { "mitchellh/tree-sitter-proto" },
  { "cbochs/portal.nvim" },
  {
    'iamcco/markdown-preview.nvim',
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" }
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
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
  }
}
require 'lsp_signature'.setup({
  bind = true,
  handler_opts = {
    border = "rounded"
  }
})

require 'indent_blankline'.setup({
  show_current_context = true,
  show_current_context_start = true,
})

lvim.builtin.lualine.style = "lvim"
lvim.builtin.lualine.sections.lualine_y = { 'fileformat', 'filesize', 'location', 'progress' }

require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })

require("portal").setup({
  jump = {
    query = { "tagged", "modified", "different", "valid" },
    labels = {
      select = { "j", "k", "h", "l" },
      escape = {
        ["<esc>"] = true
      },
    },
  },
})

vim.keymap.set('n', 'fo', require 'portal'.jump_backward, { remap = true, silent = false })
vim.keymap.set('n', 'fi', require 'portal'.jump_forward, { remap = true, silent = false })

local types = require("portal.types")
local query = require("portal.query").resolve({ "tagged" })
local jumps = require("portal.jump").search(query, types.Direction.BACKWARD)
if jumps[1].direction ~= types.Direction.NONE then
  require("portal.jump").select(jumps[1])
end
vim.keymap.set('n', 'fm', require 'portal.tag'.toggle, { remap = true, silent = true })

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
