-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<space>f")
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
-- ~/.config/lvim/config.lua
lvim.builtin.telescope.defaults.prompt_prefix = "  "
lvim.builtin.telescope.defaults.borderchars = {
  prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
  results = { "─", "▐", "─", "│", "╭", "▐", "▐", "╰" },
  preview = { " ", "│", " ", "▌", "▌", "╮", "╯", "▌" },
}
lvim.builtin.telescope.defaults.selection_caret = "  "
lvim.builtin.telescope.defaults.layout_config = {
  width = 0.90,
  height = 0.85,
  preview_cutoff = 120,
  prompt_position = "bottom",
  horizontal = {
    preview_width = function(_, cols, _)
      return math.floor(cols * 0.6)
    end,
  },
  vertical = {
    width = 0.9,
    height = 0.95,
    preview_height = 0.5,
  },
  flex = {
    horizontal = {
      preview_width = 0.9,
    },
  },
}
lvim.builtin.telescope.defaults.layout_strategy = "horizontal"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
  a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code actions" },
  t = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" }
}

lvim.builtin.terminal.open_mapping = [[<C-t>]]

lvim.builtin.which_key.mappings["<space>"] = {
  "<cmd>lua local winid = require'winpick'.select(); if winid then vim.api.nvim_set_current_win(winid) end<cr>",
  "Choose window" }
lvim.builtin.which_key.mappings["n"] = {
  name = "Buffer next, no neck pain and close notifications",
  n = { "<cmd>bn<cr>", "Buffer next" },
  c = { "<cmd>lua require('notify').dismiss()<cr>", "Close all notifications" }
}
lvim.builtin.which_key.mappings["S"] = {
  name = "+Spectre",
  s = { "<cmd>lua require('spectre').open()<CR>", "Open Spectre" },
  w = { "<cmd>lua require('spectre').open_visual({ select_word=true })<CR>", "Search current word" },
  p = { "viw:lua require('spectre').open_file_search()<CR>", "Search in file" }
}
lvim.builtin.which_key.mappings["G"] = {
  name = "Goto Preview",
  d = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "" },
  t = { "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", "" },
  i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "" },
  c = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "" },
  r = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "" },
}

lvim.builtin.which_key.mappings["z"] = {
  name = "Persistance",
  s = { "<cmd>lua require('persistence').load()<cr>", "Persistance load" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Persistance load last" },
  d = { "<cmd>lua require('persistence').stop()<cr>", "Persistance stop" },
}

lvim.builtin.which_key.mappings["m"] = {
  name = "Markdown previewer (peek)",
  o = { "<cmd>lua require('peek').open()<cr>", "Open preview" },
  c = { "<cmd>lua require('peek').close()<cr>", "Close preview" }
}

local hop = require('hop')
local directions = require('hop.hint').HintDirection

vim.keymap.set('', 'fw', function() hop.hint_words() end, { remap = true, silent = true })
vim.keymap.set('', 'ff', function() hop.hint_char1({ direction = directions.AFTER_CURSOR }) end,
  { remap = true, silent = true })
vim.keymap.set('', 'fF', function() hop.hint_char1({ direction = directions.BEFORE_CURSOR }) end,
  { remap = true, silent = true })
vim.keymap.set('', ';', ":")
