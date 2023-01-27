---@type MappingsConfig

local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["fw"] = { "<cmd>HopWord<CR>", "hop anywhere", opts = { nowait = true } },
    ["<leader>C"] = { "<cmd>NoNeckPain<CR>", "toggle NoNeckPain", opts = { nowait = true, silent = true } },
    ["<leader>gg"] = { "<cmd>LazyGit<CR>", "toggle LazyGit", opts = { nowait = true } },
    ["<leader>q"] = { "<cmd>q<CR>", "quit window", opts = { nowait = true } },
    ["<leader>w"] = { "<cmd>w<CR>", "save buffer", opts = { nowait = true } },
    ["<leader>e"] = { "<cmd>NvimTreeToggle<cr>", "toggle nvimtree", opts = { nowait = true } },
    ["<leader><space>"] = {
      "<cmd>lua local winid = require'winpick'.select(); if winid then vim.api.nvim_set_current_win(winid) end<CR>",
      "toggle winpick",
      opts = { nowait = true },
    },
    ["<leader>lj"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "prev diagnostic",
      opts = { nowait = true },
    },
    ["<leader>ll"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "prev diagnostic",
      opts = { nowait = true },
    },
    ["<leader>Ss"] = { "<cmd>lua require('spectre').open()<CR>", "Open Spectre" },
    ["<leader>Sw"] = { "<cmd>lua require('spectre').open_visual()<CR>", "Open spectre under current word" },
  },
}

-- more keybinds!

return M
