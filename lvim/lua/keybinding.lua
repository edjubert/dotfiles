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
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
    name = "+Trouble",
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

lvim.builtin.terminal.open_mapping = [[<C-t>]]

lvim.builtin.which_key.mappings["<space>"] = {
    "<cmd>lua local winid = require'winpick'.select(); if winid then vim.api.nvim_set_current_win(winid) end<cr>",
    "Choose window" }
lvim.builtin.which_key.mappings["n"] = {
    n = { "<cmd>bn<cr>", "Buffer next" },
}
lvim.builtin.which_key.mappings["S"] = {
    name = "+Spectre",
    s = { "<cmd>lua require('spectre').open()<CR>", "Open Spectre" },
    w = { "<cmd>lua require('spectre').open_visual({ select_word=true })<CR>", "Search current word" },
    p = { "viw:lua require('spectre').open_file_search()<CR>", "Search in file" }
}
lvim.builtin.which_key.mappings["C"] = { "<cmd>NoNeckPain<CR>", "Center buffer" }
lvim.builtin.which_key.mappings["G"] = {
    name = "Goto Preview",
    d = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "" },
    t = { "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", "" },
    i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "" },
    c = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "" },
    r = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "" },
}

local hop = require('hop')
local directions = require('hop.hint').HintDirection
hop.setup({
    create_hl_autocmd = true,
    uppercase_labels = false,
    multi_windows = false
})

vim.keymap.set('', 'fw', function() hop.hint_words() end, { remap = true, silent = true })
vim.keymap.set('', 'ff', function() hop.hint_char1({ direction = directions.AFTER_CURSOR }) end,
    { remap = true, silent = true })
vim.keymap.set('', 'fF', function() hop.hint_char1({ direction = directions.BEFORE_CURSOR }) end,
    { remap = true, silent = true })
