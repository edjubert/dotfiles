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
vim.g.terminal_color_0  = regal_blue
vim.g.terminal_color_1  = red
vim.g.terminal_color_2  = green
vim.g.terminal_color_3  = peach
vim.g.terminal_color_4  = blue
vim.g.terminal_color_5  = violet
vim.g.terminal_color_6  = turquoise
vim.g.terminal_color_7  = white
vim.g.terminal_color_8  = grey_blue
vim.g.terminal_color_9  = watermelon
vim.g.terminal_color_10 = emerald
vim.g.terminal_color_11 = tan
vim.g.terminal_color_12 = blue
vim.g.terminal_color_13 = purple
vim.g.terminal_color_14 = turquoise
vim.g.terminal_color_15 = white_blue

-- Neovide Special config
vim.o.guifont = "Iosevka Nerd Font"
vim.g.neovide_transparency = 0.6
vim.api.nvim_command([[
  autocmd colorscheme * :hi CursorLine ctermbg=NONE cterm=bold,italic guibg=NONE gui=bold,italic
]])

lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarkpro"
lvim.transparent_window = true

lvim.leader = "space"

-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["n"] = {
  n = { "<cmd>bn<cr>", "Buffer next" },
}
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
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
lvim.builtin.notify.active = true
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

lvim.plugins = {
  { "tpope/vim-surround" },
  { "xiyaowong/nvim-transparent" },
  { "easymotion/vim-easymotion" },
  { "f-person/git-blame.nvim" },
  { "folke/zen-mode.nvim" },
  { "danilamihailov/beacon.nvim" },
  { "psliwka/vim-smoothie" },
  { "airblade/vim-gitgutter" },
  { "camspiers/animate.vim" },
  { "ray-x/lsp_signature.nvim" },
  { "olimorris/onedarkpro.nvim" },
  { "lukas-reineke/indent-blankline.nvim" },
  { "rafamadriz/neon" },
  { "sainnhe/edge" },
  { "p00f/nvim-ts-rainbow" },
  { "tree-sitter/tree-sitter-go" },
  { "mitchellh/tree-sitter-proto" },
  {
    "folke/trouble.nvim",
    require = "kyazdani24/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }
}

require 'transparent'.setup({
  enable = true,
  "BufferLineTabClose",
  "BufferlineBufferSelected",
  "BufferLineFill",
  "BufferLineBackground",
  "BufferLineSeparator",
  "BufferLineIndicatorSelected",
  "CursorLineNr",
  "LineNr"
})

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

require 'nvim-treesitter.configs'.setup({
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1000
  }
})
