---@type MappingsConfig

local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
		["nf"] = { "<cmd>HopWord<CR>", "hop anywhere", opts = { nowait = true } },
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
	},
}

-- more keybinds!

return M
