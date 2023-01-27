---@type MappingsConfig
--
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["nf"] = { ":HopWord<CR>", "hop anywhere", opts = { nowait = true } },
    ["<leader>C"] = { ":NoNeckPain<CR>", "toggle NoNeckPain", opts = { nowait = true } },
    ["<leader>gg"] = { ":LazyGit<CR>", "toggle LazyGit", opts = { nowait = true } },
    ["<leader>q"] = { ":q<CR>", "quit window", opts = { nowait = true } },
    ["<leader>w"] = { ":w<CR>", "save buffer", opts = { nowait = true } },
    ["<leader>e"] = { ":NvimTreeToggle<cr>", "toggle nvimtree", opts = { nowait = true} },
    ["<leader><space>"] = { "<cmd>lua local winid = require'winpick'.select(); if winid then vim.api.nvim_set_current_win(winid) end<CR>", "toggle winpick", opts = { nowait = true } }
  },
}

-- more keybinds!

return M
