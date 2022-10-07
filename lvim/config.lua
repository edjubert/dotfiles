--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

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
vim.g.terminal_color_3  = yellow
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
vim.g.guibg = "#292c3e"

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarkpro"
-- lvim.colorscheme = "onedarker"
lvim.transparent_window = true
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

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

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"},
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

lvim.plugins = {
  { "tpope/vim-surround" },
  { "easymotion/vim-easymotion" },
  { "f-person/git-blame.nvim" },
  { "folke/zen-mode.nvim" },
  { "danilamihailov/beacon.nvim" },
  { "psliwka/vim-smoothie" },
  { "airblade/vim-gitgutter" },
  { "camspiers/animate.vim" },
  -- { "fatih/vim-go" },
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

-- vim.keymap.set(
--   "nnoremap",
--   "<leader>dbl",
--   require('mongo-nvim.telescope.pickers').database_picker()
-- )

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
