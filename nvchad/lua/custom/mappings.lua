---@type MappingsConfig
--
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["nf"] = { ":HopWord<CR>", "hop anywhere", opts = { nowait = true } },
  },
}

-- more keybinds!

return M
