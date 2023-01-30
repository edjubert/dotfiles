-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- map({"i","n"}, "<C-\/>", "")
map(
  "n",
  "<leader><leader>",
  "<cmd>lua local winid = require'winpick'.select(); if winid then vim.api.nvim_set_current_win(winid) end<CR>",
  { desc = "Toggle winpick" }
)
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save buffer" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit window" })

map("n", "<leader>lj", function()
  vim.diagnostic.goto_prev()
end, { desc = "Prev diagnostic" })
map("n", "<leader>ll", function()
  vim.diagnostic.goto_next()
end, { desc = "Prev diagnostic" })
map("n", "<leader>Ss", "<cmd>lua require'spectre'.open()<cr>", { desc = "Open Spectr" })
map("n", "<leader>Sw", "<cmd>lua require'spectre'.open_visual()<cr>", { desc = "Open Spectr under current word" })
